const express = require('express');
const controller = require('../controllers/staff');
const { requireAuth, forwardAuth } = require('../middlewares/staffAuth');

const fs = require('fs');

const router = express.Router();

const multer = require('multer');

const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    const dest = "./upload/";
    fs.access(dest, function (error) {
      if (error) {
        console.log("Directory does not exist.");
        return fs.mkdir(dest, (error) => cb(error, dest));
      } else {
        console.log("Directory exists.");
        return cb(null, dest);
      }
    });
  },

  filename: (req, file, cb) => {
    cb(null, file.originalname);
  }
});

const upload = multer({ storage });

// login page
router.get('/login', forwardAuth, controller.getLogin);
router.post('/login', controller.postLogin);

router.get('/dashboard', requireAuth, controller.getDashboard);
router.get('/profile', requireAuth, controller.getProfile);
router.get('/logout', requireAuth, controller.getLogout);

router.get('/student-attendance', requireAuth, controller.getAttendance);
// router.get('/student-attendance/class/:id', requireAuth, controller.markAttendance);

router.post(
  '/student-attendance/class/:id',
  requireAuth,
  controller.postAttendance
);

router.get('/timetable', requireAuth, controller.getTimeTable);

router.post('/student-attendance', requireAuth, controller.markAttendance);

router.get('/class-management', requireAuth, controller.getClassManagement);

router.get('/class-report', requireAuth, controller.getClassReport);
router.post('/class-report', requireAuth, controller.postClassReport);

router.get('/class-report/:classId', requireAuth, controller.getViewClassReport);

// router.get('/class-report/class/:id', requireAuth, controller.getClassReport);
router.get('/class-info/class/:id', requireAuth, controller.getClassInfo);

router.get('/class/:classId/addChapter', requireAuth, controller.getAddChapter);
router.post('/class/:classId/addChapter', upload.single('chapterPdf'), requireAuth, controller.postAddChapter);

router.get('/class/:classId/editChapter/:chapterId', requireAuth, controller.getEditChapter);
router.post('/class/:classId/editChapter/:chapterId', upload.single('chapterPdf'), requireAuth, controller.postEditChapter);

router.get('/class/:classId/deleteChapter/:chapterId', requireAuth, controller.getDeleteChapter);

router.get('/class-info/class/:classId/:chapterId', requireAuth, controller.getChapter);

// DELETE pdf in chapter
// router.get('/class/updateChapter/chapter')

// QUESTION MANAGEMENT
router.get('/question-management', requireAuth, controller.getQuestionManagement);
router.post('/question-management', requireAuth, controller.getClassQuestionBank);

router.get('/question-management/class/:classId', requireAuth, controller.getQuestionManagementInClass);

router.get('/class/:classId/addQuestion', requireAuth, controller.getAddQuestion);
router.post('/class/:classId/addQuestion', requireAuth, controller.postAddQuestion);

router.get('/question-management/class/:classId/viewQuestion/:questionId', requireAuth, controller.getViewQuestion);

router.get('/question-management/class/:classId/editQuestion/:questionId', requireAuth, controller.getEditQuestion);
router.post('/question-management/class/:classId/editQuestion/:questionId', requireAuth, controller.postEditQuestion);

router.get('/question-management/class/:classId/deleteQuestion/:questionId', requireAuth, controller.deleteQuestion);


// ASIGNMENT MANAGEMENT
router.get('/assignment-management', requireAuth, controller.getAssignmentManagement);
router.post('/assignment-management', requireAuth, controller.getClassAssignment);

router.get('/assignment-management/class/:classId', requireAuth, controller.getAssignmentManagementInClass);
router.get('/assignment-management/class/:classId/addAssignment', requireAuth, controller.getAddAssignment);
router.post('/assignment-management/class/:classId/addAssignment', requireAuth, controller.postAddAssignment);

router.get('/assignment-management/class/:classId/editAssignment/:asgId', requireAuth, controller.getEditAssignment);
router.post('/assignment-management/class/:classId/editAssignment/:asgId', requireAuth, controller.postEditAssignment);

router.get('/assignment-management/class/:classId/deleteAssignment/:asgId', requireAuth, controller.getDeleteAssignment);

router.get('/assignment-management/class/:classId/viewAssignment/:asgId', requireAuth, controller.viewAssignment);

// 1.5 FORGET PASSWORD
router.get('/forgot-password', forwardAuth, controller.getForgotPassword);
router.put('/forgot-password', controller.forgotPassword);

// 1.6 RESET PASSWORD
router.get('/resetpassword/:id', forwardAuth, controller.getResetPassword);
router.put('/resetpassword', controller.resetPassword);

module.exports = router;
