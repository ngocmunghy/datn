const mysql = require('mysql');
const jwt = require('jsonwebtoken');
const bcrypt = require('bcryptjs');
const moment = require('moment');

const mailgun = require('mailgun-js');
const DOMAIN = process.env.DOMAIN_NAME;
const mg = mailgun({ apiKey: process.env.MAILGUN_API_KEY, domain: DOMAIN });

const db = mysql.createConnection({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASS,
  dateStrings: 'date',
  database: 'cumsdbms',
});

// Database query promises
const zeroParamPromise = (sql) => {
  return new Promise((resolve, reject) => {
    db.query(sql, (err, results) => {
      if (err) return reject(err);
      return resolve(results);
    });
  });
};

const queryParamPromise = (sql, queryParam) => {
  return new Promise((resolve, reject) => {
    db.query(sql, queryParam, (err, results) => {
      if (err) return reject(err);
      return resolve(results);
    });
  });
};

// LOGIN
exports.getLogin = (req, res, next) => {
  res.render('Staff/login');
};

exports.postLogin = async (req, res, next) => {
  const { email, password } = req.body;
  let errors = [];
  const sql1 = 'SELECT * FROM staff WHERE email = ?';
  const users = await queryParamPromise(sql1, [email]);
  if (
    users.length === 0 ||
    !(await bcrypt.compare(password, users[0].password))
  ) {
    errors.push({ msg: 'Email or Password is Incorrect' });
    res.status(401).render('Staff/login', { errors });
  } else {
    const token = jwt.sign({ id: users[0].st_id }, process.env.JWT_SECRET, {
      expiresIn: process.env.JWT_EXPIRE,
    });
    res.cookie('jwt', token, {
      httpOnly: true,
      maxAge: 24 * 60 * 60 * 1000,
    });
    res.redirect('/staff/dashboard');
  }
};

exports.getDashboard = async (req, res, next) => {
  const sql1 = 'SELECT * FROM staff WHERE st_id = ?';
  const user = req.user;
  const data = await queryParamPromise(sql1, [user]);
  res.render('Staff/dashboard', { user: data[0], page_name: 'overview' });
};

exports.getProfile = async (req, res, next) => {

  const sql1 = 'SELECT * FROM staff WHERE st_id = ?';
  const user = req.user;
  const data = await queryParamPromise(sql1, [user]);
  const userDOB = data[0].dob;
  const sql2 = 'SELECT d_name FROM department WHERE dept_id = ?';
  const deptData = await queryParamPromise(sql2, [data[0].dept_id]);

  const sql3 =
    'SELECT cl.class_id, cl.section, cl.semester, cl.c_id, co.name FROM class AS cl, course AS co WHERE st_id = ? AND co.c_id = cl.c_id;';
  const classData = await queryParamPromise(sql3, [data[0].st_id]);

  res.render('Staff/profile', {
    user: data[0],
    userDOB,
    deptData,
    classData,
    page_name: 'profile',
  });
};

exports.getTimeTable = async (req, res, next) => {
  const staffData = (
    await queryParamPromise('SELECT * FROM staff WHERE st_id = ?', [req.user])
  )[0];
  const timeTableData = await queryParamPromise(
    'select * from time_table where st_id = ? order by day, start_time',
    [req.user]
  );
  console.log(timeTableData);
  const startTimes = ['10:00', '11:00', '12:00', '13:00'];
  const endTimes = ['11:00', '12:00', '13:00', '14:00'];
  const dayNames = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday'];
  res.render('Staff/timetable', {
    page_name: 'timetable',
    timeTableData,
    startTimes,
    staffData,
    endTimes,
    dayNames,
  });
};

exports.getAttendance = async (req, res, next) => {
  const sql1 = 'SELECT * FROM staff WHERE st_id = ?';
  const user = req.user;
  const data = await queryParamPromise(sql1, [user]);

  const sql3 =
    'SELECT cl.class_id, cl.section, cl.semester, cl.c_id, co.name FROM class AS cl, course AS co WHERE st_id = ? AND co.c_id = cl.c_id ORDER BY cl.semester;';
  const classData = await queryParamPromise(sql3, [data[0].st_id]);

  res.render('Staff/selectClassAttendance', {
    user: data[0],
    classData,
    btnInfo: 'Students List',
    page_name: 'attendance',
  });
};

exports.markAttendance = async (req, res, next) => {
  const { classdata, date } = req.body;
  console.log(req.body.classdata);
  const regex1 = /[A-Z]+[0-9]+/g;
  const regex2 = /[A-Z]+-[0-9]+/g;

  const c_id = classdata.match(regex1)[0];
  const class_sec = classdata.match(regex2)[0].split('-');
  const staffId = req.user;

  const sql = `
    SELECT * FROM student WHERE dept_id = ? AND section = ?
`;

  let students = await queryParamPromise(sql, [class_sec[0], class_sec[1]]);
  for (student of students) {
    const status = await queryParamPromise(
      'SELECT status FROM attendance WHERE c_id = ? AND s_id = ? AND date = ?',
      [c_id, student.s_id, date]
    );
    if (status.length !== 0) {
      student.status = status[0].status;
    } else {
      student.status = 0;
    }
  }

  return res.render('Staff/attendance', {
    studentData: students,
    courseId: c_id,
    date,
    page_name: 'attendance',
  });
};

exports.postAttendance = async (req, res, next) => {
  const { date, courseId, ...students } = req.body;
  let attedData = await queryParamPromise(
    'SELECT * FROM attendance WHERE date = ? AND c_id = ?',
    [date, courseId]
  );

  if (attedData.length === 0) {
    for (const s_id in students) {
      const isPresent = students[s_id];
      await queryParamPromise('insert into attendance set ?', {
        s_id: s_id,
        date: date,
        c_id: courseId,
        status: isPresent == 'True' ? 1 : 0,
      });
    }
    req.flash('success_msg', 'Attendance done successfully');
    return res.redirect('/staff/student-attendance');
  }

  for (const s_id in students) {
    const isPresent = students[s_id] === 'True' ? 1 : 0;
    await queryParamPromise(
      'update attendance set status = ? WHERE s_id = ? AND date = ? AND c_id = ?',
      [isPresent, s_id, date, courseId]
    );
  }

  req.flash('success_msg', 'Attendance updated successfully');
  return res.redirect('/staff/student-attendance');
};

exports.getClassManagement = async (req, res, next) => {
  const sql1 = 'SELECT * FROM staff WHERE st_id = ?';
  const user = req.user;
  const data = await queryParamPromise(sql1, [user]);

  const sql3 =
    'SELECT cl.class_id, cl.section, cl.semester, cl.c_id, co.name FROM class AS cl, course AS co WHERE st_id = ? AND co.c_id = cl.c_id ORDER BY cl.semester;';
  const classData = await queryParamPromise(sql3, [data[0].st_id]);
  //console.log(classData);

  res.render('Staff/selectClassManagement', {
    user: data[0],
    classData: classData,
    btnInfo: 'View',
    page_name: 'class-management',
  });
};

exports.getClassReport = async(req, res, next) => {
  const sql1 = 'SELECT * FROM staff WHERE st_id = ?';
  const user = req.user;
  const data = await queryParamPromise(sql1, [user]);

  const sql3 =
    'SELECT cl.class_id, cl.section, cl.semester, cl.c_id, co.name FROM class AS cl, course AS co WHERE st_id = ? AND co.c_id = cl.c_id ORDER BY cl.semester;';
  const classData = await queryParamPromise(sql3, [data[0].st_id]);

  res.render('Staff/Report/selectClassReport', {
    user: data[0],
    classData,
    btnInfo: 'Students List',
    page_name: 'cls-report',
  });
}

exports.postClassReport = async(req, res, next) => {
  const classdata = req.body.classdata;
  const regex1 = /[A-Z]+[0-9]+/g;

  const c_id = classdata.match(regex1)[0];
  const staffId = req.user;

  const sql = "SELECT * FROM class WHERE c_id = ? AND st_id = ?";
  const classData = await queryParamPromise(sql, [c_id, staffId]);
  //console.log(classData[0]);

  const sql1 = "SELECT * FROM staff WHERE st_id = ?";
  const staffData = (await queryParamPromise(sql1, staffId))[0];
  //console.log(staffData);

  const sql2 = "SELECT * FROM student WHERE section = ? AND dept_id = ?";
  const students = await queryParamPromise(sql2, [classData[0].section, staffData.dept_id]);

  res.redirect('/staff/class-report/' + classData[0].class_id);

  
};

exports.getViewClassReport = async(req, res, next) => {
  const classId = req.params.classId;
  const sql = "SELECT * FROM class WHERE class_id = ?";
  const classData = await queryParamPromise(sql, [classId]);
  //console.log(classData[0]);

  const sql1 = "SELECT * FROM staff WHERE st_id = ?";
  const staffData = await queryParamPromise(sql1, req.user);
  //console.log(staffData);

  const sql2 = "SELECT * FROM student WHERE section = ? AND dept_id = ?";
  const students = await queryParamPromise(sql2, [classData[0].section, staffData[0].dept_id]);

  attendanceCount = [];
  totalDoneAssigments = [];
  maxScores = [];
  minScores = [];
  
  for(let i = 0; i < students.length; i++) {
    let sql1 = "SELECT COUNT(status) FROM attendance WHERE s_id = ? AND STATUS = 1";
    let count = await queryParamPromise(sql1, [students[i].s_id]);
    attendanceCount.push(count[0]["COUNT(status)"]);

    let sql2 = "SELECT COUNT(DISTINCT asg_id) FROM result WHERE s_id = ?";
    let doneAssignment = await queryParamPromise(sql2, [students[i].s_id]);
    totalDoneAssigments.push(doneAssignment[0]["COUNT(DISTINCT asg_id)"]);

    let sql3 = "SELECT MAX(score) from result where s_id = ?";
    let maxScore = await queryParamPromise(sql3, [students[i].s_id]);
    maxScores.push(maxScore[0]["MAX(score)"]);

    let sql4 = "SELECT MIN(score) from result where s_id = ?";
    let minScore = await queryParamPromise(sql4, [students[i].s_id]);
    minScores.push(minScore[0]["MIN(score)"]);
  }

  console.log(minScores);

  return res.render('Staff/Report/viewClassReport', {
    studentData: students,
    attendanceCount: attendanceCount,
    totalDoneAssigments: totalDoneAssigments,
    maxScores: maxScores,
    minScores: minScores,
    courseId: classData[0].c_id,
    classId: classId,
    page_name: 'cls-report',
  });
}

// exports.selectClassReport = async (req, res, next) => {
//   const sql1 = 'SELECT * FROM staff WHERE st_id = ?';
//   const user = req.user;
//   const data = await queryParamPromise(sql1, [user]);

//   const sql3 =
//     'SELECT cl.class_id, cl.section, cl.semester, cl.c_id, co.name FROM class AS cl, course AS co WHERE st_id = ? AND co.c_id = cl.c_id ORDER BY cl.semester;';
//   const classData = await queryParamPromise(sql3, [data[0].st_id]);

//   res.render('Staff/selectClassReport', {
//     user: data[0],
//     classData,
//     btnInfo: 'Check Status',
//     page_name: 'cls-report',
//   });
// };

// exports.getClassReport = async (req, res, next) => {
//   const courseId = req.params.id;
//   const staffId = req.user;
//   const section = req.query.section;
//   const classData = await queryParamPromise(
//     'SELECT * FROM class WHERE c_id = ? AND st_id = ? AND section = ?',
//     [courseId, staffId, section]
//   );
//   const sql1 = 'SELECT * FROM staff WHERE st_id = ?';
//   const user = req.user;
//   const data = await queryParamPromise(sql1, [user]);
//   res.render('Staff/getClassReport', {
//     user: data[0],
//     classData,
//     page_name: 'cls-report',
//   });
// };

exports.getClassInfo = async(req, res, next) => {
  const classId = req.params.id;
  const user = req.user;

  const sql1 = "SELECT * FROM chapter WHERE class_id = ?";
  const chapterDataArray = await queryParamPromise(sql1, [classId]);

  //console.log(chapterDataArray);
  res.render('Staff/selectClass', {
    classId: classId,
    chapterDataArray: chapterDataArray,
    page_name: 'class-management',
  });
};


exports.getAddChapter = async(req, res, next) => {
  const classId = req.params.classId;
  const user = req.user;

  const sql1 = "SELECT * FROM class WHERE class_id = ?";
  const classData = await queryParamPromise(sql1, [classId]);

  //console.log(classData[0]);

  res.render('Staff/addChapter', {
    classData: classData[0],
    user: user,
    page_name: 'class-management',
  });
};

exports.postAddChapter = async(req, res, next) => {
  const user = req.user;
  const classId = req.params.classId;
  const chapterName = req.body.chapterName;
  const chapterDescription = req.body.chapterDescription;

  const sql1 = "SELECT * FROM class WHERE c_id = ? AND st_id = ?";
  const classData = await queryParamPromise(sql1, [classId, user]);

  //console.log(classData);

  const sql2 = "INSERT INTO chapter SET ?";
  await queryParamPromise(sql2, {
    chapter_name: chapterName,
    chapter_description: chapterDescription,
    pdf: './' + req.file.path,
    class_id: classId,
  });
  req.flash('success_msg', 'Chapter Inserted Successfully');
  return res.redirect('/staff/class-info/class/' + classId);
};

exports.getEditChapter = async(req, res, next) => {
  const classId = req.params.classId;
  const chapterId = req.params.chapterId;
  const user = req.user;

  const sql1 = "SELECT * FROM class WHERE class_id = ?";
  const classData = await queryParamPromise(sql1, [classId]);

  const sql2 = "SELECT * FROM chapter WHERE chapter_id = ?";
  const chapterData = await queryParamPromise(sql2, [chapterId]);

  res.render('Staff/editChapter', {
    classData: classData[0],
    chapterData: chapterData[0],
    user: user,
    page_name: 'class-management',
  });
}

exports.postEditChapter = async(req, res, next) => {
  const user = req.user;
  const classId = req.params.classId;
  const chapterName = req.body.chapterName;
  const chapterDescription = req.body.chapterDescription;
  
  const sql1 = "SELECT * FROM class WHERE class_id = ?";
  const classData = await queryParamPromise(sql1, [classId]);

  //console.log(classData);

  const sql2 = "UPDATE chapter SET ? WHERE chapter_id = ?";
  await queryParamPromise(sql2, [{
    chapter_name: chapterName,
    chapter_description: chapterDescription,
    pdf: './' + req.file.path,
    class_id: classId,
  }, req.params.chapterId]);
  req.flash('success_msg', 'Chapter Updated Successfully');
  return res.redirect('/staff/class-info/class/' + classId);
}

exports.getDeleteChapter = async(req, res, next) => {
  const classId = req.params.classId;
  const chapterId = req.params.chapterId;

  const sql = "DELETE FROM chapter WHERE chapter_id = ?";
  await queryParamPromise(sql, chapterId);

  req.flash('success_msg', 'Chapter Removed Successfully');
  return res.redirect('/staff/class-info/class/' + classId);
}

const fs = require('fs');
const router = require('../routes/staff');
const { query } = require('express');

exports.getChapter = async(req, res, next) => {
  const sql1 = "SELECT * FROM chapter WHERE chapter_id = ?";
  const chapterData = await queryParamPromise(sql1, [req.params.chapterId]);

  const path = chapterData[0].pdf;
  var data = fs.readFileSync('./' + path);
  res.contentType('application/pdf');
  return res.send(data);  
};

// QUESTION MANAGEMENT
exports.getQuestionManagement = async(req, res, next) => {

  const sql1 = 'SELECT * FROM class WHERE st_id = ?';
  const user = req.user;
  const data = await queryParamPromise(sql1, [user]);

  const sql3 =
    'SELECT cl.class_id, cl.section, cl.semester, cl.c_id, co.name FROM class AS cl, course AS co WHERE st_id = ? AND co.c_id = cl.c_id ORDER BY cl.semester;';
  const classData = await queryParamPromise(sql3, [data[0].st_id]);

  res.render('Staff/selectClassQuestion', {
    user: data[0],
    classData,
    btnInfo: 'Questions List',
    page_name: 'question-management',
  });
};

exports.getClassQuestionBank = async(req, res, next) => {
  const classdata = req.body.classdata;
  const regex1 = /[A-Z]+[0-9]+/g;

  const c_id = classdata.match(regex1)[0];
  const staffId = req.user;

  const sql = "SELECT * FROM class WHERE c_id = ? AND st_id = ?";
  const classData = await queryParamPromise(sql, [c_id, staffId]);

  //console.log(classData[0].class_id);

  const sql1 = "SELECT * FROM question WHERE class_id = ?";
  const questions = await queryParamPromise(sql1, [classData[0].class_id]);

  res.redirect('/staff/question-management/class/' + classData[0].class_id);
}

exports.getQuestionManagementInClass = async(req, res, next) => {
  const classId = req.params.classId;

  const sql = "SELECT * FROM class where class_id = ?";
  const classData = await queryParamPromise(sql, [classId]);

  const sql1 = "SELECT * FROM question WHERE class_id = ?";
  const questions = await queryParamPromise(sql1, [classId]);

  res.render('Staff/viewQuestionInClass', {
    classData: classData[0],
    questions: questions,
    page_name: 'question-management'
  });  
}

exports.getAddQuestion = async(req, res, next) => {
  const classId = req.params.classId;

  const sql = "SELECT * FROM class WHERE class_id = ?";
  const classData = await queryParamPromise(sql, [classId]);
  
  //console.log(classData[0]);

  res.render(`Staff/addQuestion`, {
    classData: classData[0],
    page_name: 'question-management',
  });

}

exports.postAddQuestion = async(req, res, next) => {

  const question = req.body.question;
  const opt1 = req.body.opt1;
  const opt2 = req.body.opt2;
  const opt3 = req.body.opt3;
  const opt4 = req.body.opt4;
  const ans = req.body.ans;

  // const {question, opt1, opt2, opt3, opt4, ans} = req.body;
  const classId = req.params.classId;

  const sql = "INSERT INTO question SET ?";
  await queryParamPromise(sql, {
    question: question,
    opt1: opt1,
    opt2: opt2,
    opt3: opt3,
    opt4: opt4,
    answer: ans,
    class_id: classId,
  });
  req.flash('success_msg', 'Question Inserted Successfully');
  return res.redirect('/staff/question-management/class/' + classId);
}

exports.getViewQuestion = async(req, res, next) => {
  const classId = req.params.classId;
  const questionId = req.params.questionId;

  const sql1 = "SELECT * FROM question WHERE q_id = ?";
  const questionData = await queryParamPromise(sql1, [questionId]);

  res.render('Staff/viewQuestion', {
    classId: classId,
    questionData: questionData[0],
    page_name: 'question-management'
  });  
}

exports.getEditQuestion = async(req, res, next) => {
  const classId = req.params.classId;
  const questionId = req.params.questionId;

  const sql1 = "SELECT * FROM question WHERE q_id = ?";
  const questionData = await queryParamPromise(sql1, [questionId]);

  res.render('Staff/editQuestion', {
    classId: classId,
    questionData: questionData[0],
    page_name: 'question-management'
  }); 
}

exports.postEditQuestion = async(req, res, next) => {

  const question = req.body.question;
  const opt1 = req.body.opt1;
  const opt2 = req.body.opt2;
  const opt3 = req.body.opt3;
  const opt4 = req.body.opt4;
  const answer = req.body.ans;

  const classId = req.params.classId;
  const questionId = req.params.questionId;

  const sql = "UPDATE question SET ? WHERE q_id = ?";
  await queryParamPromise(sql, [{
    question: question,
    opt1: opt1,
    opt2: opt2,
    opt3: opt3,
    opt4: opt4,
    answer: answer,
    class_id: classId
  }, questionId]);


  req.flash('success_msg', 'Question updated successfully!');
  res.redirect('/staff/question-management/class/' + classId);
}

exports.deleteQuestion = async(req, res, next) => {
  const classId = req.params.classId;
  const questionId = req.params.questionId;
  console.log(questionId);

  const sql = "DELETE FROM question WHERE q_id = ?";
  await queryParamPromise(sql, questionId);

  req.flash('success_msg', 'Question removed successfully!');
  res.redirect('/staff/question-management/class/' + classId);
}

// ASSIGNMENT MANAGEMENT
exports.getAssignmentManagement = async(req, res, next) => {

  const sql1 = 'SELECT * FROM class WHERE st_id = ?';
  const user = req.user;
  const data = await queryParamPromise(sql1, [user]);

  const sql3 =
    'SELECT cl.class_id, cl.section, cl.semester, cl.c_id, co.name FROM class AS cl, course AS co WHERE st_id = ? AND co.c_id = cl.c_id ORDER BY cl.semester;';
  const classData = await queryParamPromise(sql3, [data[0].st_id]);

  res.render('Staff/selectClassAssignment', {
    user: data[0],
    classData,
    btnInfo: 'Questions List',
    page_name: 'assignment-management',
  });
};

exports.getClassAssignment = async(req, res, next) => {

  const classdata = req.body.classdata;
  const regex1 = /[A-Z]+[0-9]+/g;

  const c_id = classdata.match(regex1)[0];
  const staffId = req.user;

  const sql = "SELECT * FROM class WHERE c_id = ? AND st_id = ?";
  const classData = await queryParamPromise(sql, [c_id, staffId]);

  const sql1 = "SELECT * FROM question WHERE class_id = ?";
  const questions = await queryParamPromise(sql1, [classData[0].class_id]);

  res.redirect('/staff/assignment-management/class/' + classData[0].class_id);
}

exports.getAssignmentManagementInClass = async(req, res, next) => {
  const classId = req.params.classId;

  const sql = "SELECT * FROM class where class_id = ?";
  const classData = await queryParamPromise(sql, [classId]);

  const sql1 = "SELECT * FROM assignment WHERE class_id = ?";
  const assignments = await queryParamPromise(sql1, [classId]);

  res.render('Staff/viewAssignmentInClass', {
    classData: classData[0],
    assignments: assignments,
    page_name: 'assignment-management'
  });  
}

exports.getAddAssignment = async(req, res, next) => {
  const classId = req.params.classId;

  const sql = "SELECT * FROM class where class_id = ?";
  const classData = await queryParamPromise(sql, [classId]);

  res.render('Staff/addAssignment', {
    classData: classData[0],
    page_name: 'assignment-management',
  });
};

exports.postAddAssignment = async(req, res, next) => {
  const name = req.body.name;
  const dateCreated = moment().format('YYYY-MM-DD hh:mm:ss');
  const deadline = req.body.deadline;
  const classId = req.params.classId;

  //console.log(name, dateCreated, deadline, classId);

  const sql = "INSERT INTO assignment SET ?";
  await queryParamPromise(sql, {
    name: name,
    day: dateCreated,
    deadline: deadline,
    class_id: classId,
  });
  req.flash('success_msg', 'Assignment inserted successfully!');
  res.redirect('/staff/assignment-management/class/' + classId);
};

exports.getEditAssignment = async(req, res, next) => {

  const classId = req.params.classId;
  const asgId = req.params.asgId;

  const sql = "SELECT * FROM class WHERE class_id = ?";
  const classData = await queryParamPromise(sql, [classId]);

  const sql2 = "SELECT * FROM assignment WHERE asg_id = ?";
  const asgData = await queryParamPromise(sql2, [asgId]);

  const sql3 = "SELECT * FROM question WHERE class_id = ?";
  const questions = await queryParamPromise(sql3, [classId]);

  let flag = 1;

  const status = await queryParamPromise(
    'SELECT status FROM assignment_question, assignment WHERE assignment_question.asg_id = ? AND assignment.class_id = ? AND assignment_question.asg_id = assignment.asg_id',
    [asgId, classId]
  );

  if(status.length == 0) {
    flag = 0;
  }

  // console.log(status);
  // console.log("------------");

  for(let i = 0; i < questions.length; i++) {
    if(i < status.length) {
      if(flag == 0) {
        questions[i].status = 0;
      } else {
        
        questions[i].status = status[i].status;
      }
    } else {
      questions[i].status = 0;
    }
    
  }

  //console.log(questions);

  res.render('Staff/editAssignment', {
    classData: classData[0],
    asgData: asgData[0],
    questions: questions,
    page_name: 'assignment-management',
  });
};

exports.postEditAssignment = async(req, res, next) => {

  const {...questions} = req.body;

  let data = [];

  for(var q_id in questions) {
    if(questions.hasOwnProperty(q_id)) {
      let obj = {
        q_id: q_id,
        status: questions[q_id]
      }
      data.push(obj);
    }
  }

  const asgId = req.params.asgId;
  const classId = req.params.classId;
  
  const sql1 = "SELECT * FROM assignment_question WHERE asg_id = ?";
  let asgQuestionDatas = await queryParamPromise(sql1, [asgId]);

  for(let i = asgQuestionDatas.length; i < data.length; i++) {
    let obj = {
      asg_id: parseInt(asgId),
      q_id: parseInt(data[i].q_id),
      status: data[i].status === 'True' ? 1 : 0,
    }
    asgQuestionDatas.push(obj);
  }

  for(let i = 0; i < asgQuestionDatas.length; i++) {
    asgQuestionDatas[i].status = data[i].status === 'True' ? 1 : 0;
  }

  // console.log("------After--------");
  console.log(asgQuestionDatas);

  for(let i = 0; i < asgQuestionDatas.length; i++) {
    const sql = "SELECT * FROM assignment_question WHERE asg_id = ? AND q_id = ?";
    const asg_ques_data = await queryParamPromise(sql, [asgId, asgQuestionDatas[i].q_id]);

    console.log(asg_ques_data[0]);

    if(asg_ques_data.length == 0) {
      const sql1 = "INSERT INTO assignment_question SET ?";
      await queryParamPromise(sql1, {
        asg_id: asgId,
        q_id: asgQuestionDatas[i].q_id,
        status: asgQuestionDatas[i].status
      });
    } else {
      //console.log('update');
      const sql2 = "UPDATE assignment_question SET status = ? WHERE asg_id = ? AND q_id = ?";
      await queryParamPromise(sql2, [asgQuestionDatas[i].status, asgId, asgQuestionDatas[i].q_id]);
    }
  }

  req.flash('success_msg', 'Assignment updated successfully!');
  res.redirect('/staff/assignment-management/class/' + classId);
};

exports.getDeleteAssignment = async(req, res, next) => {
  const classId = req.params.classId;
  const asgId = req.params.asgId;


}

exports.viewAssignment = async(req, res, next) => {
  const classId = req.params.classId;
  const asgId = req.params.asgId;

  const sql = "SELECT * FROM assignment WHERE asg_id = ?";
  const asgData = await queryParamPromise(sql, [asgId]);

  const sql1 = "SELECT * FROM class WHERE class_id = ?";
  const classData = await queryParamPromise(sql1, [classId]);

  const sql2 = "SELECT * FROM question, assignment_question WHERE assignment_question.asg_id = ? AND assignment_question.q_id = question.q_id AND status = 1";
  const questions = await queryParamPromise(sql2, [asgId]);

  res.render('Staff/assignmentInfo', {
    asgData: asgData[0],
    classData: classData[0],
    questions: questions,
    page_name: 'assignment-management',
  });
}

exports.getLogout = (req, res, next) => {
  res.cookie('jwt', '', { maxAge: 1 });
  req.flash('success_msg', 'You are logged out');
  res.redirect('/staff/login');
};

// FORGOT PASSWORD
exports.getForgotPassword = (req, res, next) => {
  res.render('Staff/forgotPassword');
};

exports.forgotPassword = async (req, res, next) => {
  const { email } = req.body;
  if (!email) {
    return res.status(400).render('Staff/forgotPassword');
  }

  let errors = [];

  const sql1 = 'SELECT * FROM staff WHERE email = ?';
  const results = await queryParamPromise(sql1, [email]);
  if (!results || results.length === 0) {
    errors.push({ msg: 'That email is not registered!' });
    return res.status(401).render('Staff/forgotPassword', {
      errors,
    });
  }

  const token = jwt.sign(
    { _id: results[0].st_id },
    process.env.RESET_PASSWORD_KEY,
    { expiresIn: '20m' }
  );

  const data = {
    from: 'noreplyCMS@mail.com',
    to: email,
    subject: 'Reset Password Link',
    html: `<h2>Please click on given link to reset your password</h2>
                <p><a href="${process.env.URL}/staff/resetpassword/${token}">Reset Password</a></p>
                <hr>
                <p><b>The link will expire in 20m!</b></p>
              `,
  };

  const sql2 = 'UPDATE staff SET resetLink = ? WHERE email = ?';
  db.query(sql2, [token, email], (err, success) => {
   if (err) {
     errors.push({ msg: 'Error In ResetLink' });
     res.render('Staff/forgotPassword', { errors });
   } else {
     mg.messages().send(data, (err, body) => {
       if (err) throw err;
       else {
         req.flash('success_msg', 'Reset Link Sent Successfully!');
         res.redirect('/staff/forgot-password');
       }
     });
   }
  });
};

exports.getResetPassword = (req, res, next) => {
  const resetLink = req.params.id;
  res.render('Staff/resetPassword', { resetLink });
};

exports.resetPassword = (req, res, next) => {
  const { resetLink, password, confirmPass } = req.body;

  let errors = [];

  if (password !== confirmPass) {
    req.flash('error_msg', 'Passwords do not match!');
    res.redirect(`/staff/resetpassword/${resetLink}`);
  } else {
    if (resetLink) {
      jwt.verify(resetLink, process.env.RESET_PASSWORD_KEY, (err, data) => {
        if (err) {
          errors.push({ msg: 'Token Expired!' });
          res.render('Staff/resetPassword', { errors });
        } else {
          const sql1 = 'SELECT * FROM staff WHERE resetLink = ?';
          db.query(sql1, [resetLink], async (err, results) => {
            if (err || results.length === 0) {
              throw err;
            } else {
              let hashed = await bcrypt.hash(password, 8);

              const sql2 = 'UPDATE staff SET password = ? WHERE resetLink = ?';
              db.query(sql2, [hashed, resetLink], (errorData, retData) => {
                if (errorData) {
                  throw errorData;
                } else {
                  req.flash(
                    'success_msg',
                    'Password Changed Successfully! Login Now'
                  );
                  res.redirect('/staff/login');
                }
              });
            }
          });
        }
      });
    } else {
      errors.push({ msg: 'Authentication Error' });
      res.render('Staff/resetPassword', { errors });
    }
  }
};
