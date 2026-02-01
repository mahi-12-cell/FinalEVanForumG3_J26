require("dotenv").config();
const fs = require("fs");
const mysql = require("mysql2/promise");

(async () => {
  const sql = fs.readFileSync("backup.sql", "utf8");

  const connection = await mysql.createConnection({
    host: process.env.MYSQLHOST,
    user: process.env.MYSQLUSER,
    password: process.env.MYSQLPASSWORD,
    database: process.env.MYSQLDATABASE,
    port: process.env.MYSQLPORT,
    multipleStatements: true
  });
  await connection.query(`USE ${process.env.MYSQLDATABASE}`);

  const statments =sql 
  .split(';').map(s => s.trim()).filter(s => s.length );
  for (const stmt of statments) {

    await connection.query(stmt);
  }
  console.log("Import complete!");
  connection.end();
})();