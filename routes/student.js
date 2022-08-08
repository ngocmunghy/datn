const express = require('express');
const controller = require('../controllers/student');
const { requireAuth, forwardAuth } = require('../middlewares/studentAuth');

const router = express.Router();

// get login page
router.get('/login', forwardAuth, controller.getLogin);
router.post('/login', controller.postLogin);

router.get('/dashboard', requireAuth, controller.getDashboard);
router.get('/profile', requireAuth, controller.getProfile);

router.get('/selectAttendance', requireAuth, controller.getSelectAttendance);
router.post('/selectAttendance', requireAuth, controller.postSelectAttendance);

router.get('/resource', requireAuth, controller.getClassResource);
router.post('/resource', requireAuth, controller.postClassResource);
router.get('/resource/class/:classId/viewResource/:chapterId', requireAuth, controller.getViewResource);

router.get('/logout', requireAuth, controller.getLogout);

router.get('/assignment', requireAuth, controller.getClassAssignment);
router.post('/assignment', requireAuth, controller.postClassAssignment);

router.get('/assignment/take-assignment/:asgId', requireAuth, controller.getAssignment);
router.post('/assignment/take-assignment/:asgId', requireAuth, controller.postAssignment);

router.get('/assignment/take-assignment/:asgId/result', requireAuth, controller.getResultAfterAssignment);

router.get('/mark', requireAuth, controller.getClassMark);
router.post('/mark', requireAuth, controller.postClassMark);

router.get('/mark/assignment/:asgId', requireAuth, controller.getMarkAssignment);

// 1.5 FORGET PASSWORD
router.get('/forgot-password', forwardAuth, controller.getForgotPassword);
router.put('/forgot-password', controller.forgotPassword);

// 1.6 RESET PASSWORD
router.get('/resetpassword/:id', forwardAuth, controller.getResetPassword);
router.put('/resetpassword', controller.resetPassword);

module.exports = router;
