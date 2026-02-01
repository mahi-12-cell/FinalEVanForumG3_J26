
const express = require("express");
const router = express.Router();


//user controllers
const {register,login,checkUser} = require("../controller/userController")

//import authentication middleware
const authMiddleware = require("../middleware/authMiddleware")


// Routes

router.post("/register", register)
router.post("/login", login);
router.get("/check", authMiddleware, checkUser);


module.exports = router;







