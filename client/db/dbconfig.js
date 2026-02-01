require("dotenv").config();
const mysql2 = require("mysql2");

console.log(process.env.DB_USER);
console.log(process.env.DB_PASSWORD);
console.log(process.env.DB_HOST);
console.log(process.env.DB_DATABASE);

const dbconnection = mysql2.createPool({
  host: process.env.DB_HOST,        // ✅ Hostinger server
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_DATABASE,
  port: process.env.DB_PORT,        // ✅ important
  waitForConnections: true,
  connectionLimit: 10,
  queueLimit: 0,
});

module.exports = dbconnection;


//to check mysql connection to the server

// dbconnection.getConnection((err, result) => {
//   if (err) {
//     console.log(err.message);
//   } else {
//     console.log(result);
//   }
// });

// app.get("/", (req, res) => {
//   res.status(200).send("Evangadi Forum is running");
// });

module.exports = dbconnection.promise();



