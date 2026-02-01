
const express = require("express");
const cors = require("cors");
// const port = 5000;

const app = express();
app.use(cors());

//db connection
const dbconnection = require("./db/dbconfig");


// Route imports
//user routes middleware file import
const userRoutes = require("./routes/userRoute");

//question routes middleware file import
const questionRoutes = require("./routes/questionRoute");

//answer routes middleware file import
const answerRoutes = require("./routes/answerRoute");

//like unlike coment middleware file import
const likeUnlikeComentRoutes = require("./routes/likeUnlikeComentRoute");


//Json middleware to extract json data
app.use(express.json());



//user routes middleware
app.use("/api/users", userRoutes);

//question routes middleware
app.use("/api/questions",  questionRoutes);

//answer routes middleware
app.use("/api/answers",  answerRoutes);

//likeunlikeComent middleware
app.use("/api/answers", likeUnlikeComentRoutes);


// Cloud Run requires this: 
const port = process.env.PORT || 5000;

async function start() { 
  app.listen(port, async () => {
  console.log(`Server running on port ${port}`);

  try {
    await dbconnection.execute("select 'test'");
    console.log("Database connection established");
  } catch (error) {
    console.log("Database connection failed:", error.message);
  }
});

}
start();
