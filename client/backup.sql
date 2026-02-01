-- =====================================
-- Railway MySQL Import (Clean Version)
-- Hostinger → Railway Migration
-- =====================================

CREATE DATABASE IF NOT EXISTS railway;
USE railway;

SET FOREIGN_KEY_CHECKS = 0;
START TRANSACTION;

-- =====================================
-- DROP TABLES (safe re-import)
-- =====================================

DROP TABLE IF EXISTS answer_likes;
DROP TABLE IF EXISTS answer_comments;
DROP TABLE IF EXISTS answers_table;
DROP TABLE IF EXISTS questions_Table;
DROP TABLE IF EXISTS users_Table;

-- =====================================
-- users_Table
-- =====================================

CREATE TABLE users_Table (
  userid int(20) NOT NULL AUTO_INCREMENT,
  username varchar(20) NOT NULL,
  firstname varchar(20) NOT NULL,
  lastname varchar(20) NOT NULL,
  email varchar(40) NOT NULL,
  password varchar(100) NOT NULL,
  created_at timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (userid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO users_Table VALUES
(1,'Wednesday','Wed26','Jan','Wed26@email.com','$2b$10$jFcIPLRifzwVOwJ9EIWj9.BtNhIC1YqiMMVyto1t68m3ikfLesxAO',NOW()),
(2,'ante','ante','w','ante@email.com','$2b$10$3gk0H5ZiB./v/Av.7/N7pe0ViBIO69L0iL9uyf3tS3NBACYXwu2ha',NOW()),
(3,'nu','Nu','Na','nu@example.com','$2b$10$SguQoX24NQoM.HF4QLejVuy3P4.sDnIQxOM26NTD5K/GFFvfcpt6K',NOW()),
(4,'evangadi','evan','gadi','evangadi@email.com','$2b$10$FPfkmAM4NfGYmY.rrhfmDOQsF/ufy1NzCaFFVFrEGTDHv5oQkcFR2',NOW());

-- =====================================
-- questions_Table
-- =====================================

CREATE TABLE questions_Table (
  id int(20) NOT NULL AUTO_INCREMENT,
  questionid varchar(100) NOT NULL,
  userid int(20) NOT NULL,
  title varchar(50) NOT NULL,
  description varchar(200) NOT NULL,
  tags varchar(20),
  created_at datetime DEFAULT current_timestamp(),
  PRIMARY KEY (id, questionid),
  UNIQUE KEY(questionid),
  FOREIGN KEY (userid) REFERENCES users_Table(userid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO questions_Table VALUES
(1,'0ab88e14-1ef6-4966-a545-a2c2548fe59d',1,'what is your favorite AI','you can prefer from open AI',NULL,NOW()),
(2,'7ea1be1b-ca72-4a22-8e85-7ea83b5e8aca',1,'Feedback','How is our feedback for Evan forum project',NULL,NOW());

-- =====================================
-- answers_table
-- =====================================

CREATE TABLE answers_table (
  answerid int(20) NOT NULL AUTO_INCREMENT,
  userid int(20) NOT NULL,
  questionid varchar(100) NOT NULL,
  answer varchar(200) NOT NULL,
  created_at datetime DEFAULT current_timestamp(),
  PRIMARY KEY(answerid),
  FOREIGN KEY (userid) REFERENCES users_Table(userid),
  FOREIGN KEY (questionid) REFERENCES questions_Table(questionid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO answers_table VALUES
(1,3,'7ea1be1b-ca72-4a22-8e85-7ea83b5e8aca','It has not been deployed yet.',NOW()),
(2,3,'7ea1be1b-ca72-4a22-8e85-7ea83b5e8aca','It has not been deployed yet.',NOW()),
(3,2,'7ea1be1b-ca72-4a22-8e85-7ea83b5e8aca','it is remarkable',NOW()),
(4,4,'0ab88e14-1ef6-4966-a545-a2c2548fe59d','Copilot is the one I recommend.',NOW());

-- =====================================
-- answer_comments
-- =====================================

CREATE TABLE answer_comments (
  commentid int(20) NOT NULL AUTO_INCREMENT,
  answerid int(20) NOT NULL,
  userid int(20) NOT NULL,
  comment varchar(100) NOT NULL,
  created_at timestamp DEFAULT current_timestamp(),
  PRIMARY KEY(commentid),
  FOREIGN KEY(answerid) REFERENCES answers_table(answerid) ON DELETE CASCADE,
  FOREIGN KEY(userid) REFERENCES users_Table(userid) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO answer_comments VALUES
(1,1,3,'Great!',NOW()),
(2,1,3,'Great!',NOW()),
(3,1,3,'Great!',NOW()),
(4,2,3,'Ok!',NOW()),
(5,2,2,'alright!',NOW()),
(6,4,4,'Alright!',NOW());

-- =====================================
-- answer_likes
-- =====================================

CREATE TABLE answer_likes (
  id int(20) NOT NULL AUTO_INCREMENT,
  answerid int(20),
  userid int(20) NOT NULL,
  type enum('like','comment','dislike') NOT NULL,
  created_at timestamp DEFAULT current_timestamp(),
  PRIMARY KEY(id),
  FOREIGN KEY(answerid) REFERENCES answers_table(answerid) ON DELETE CASCADE,
  FOREIGN KEY(userid) REFERENCES users_Table(userid) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

SET FOREIGN_KEY_CHECKS = 1;
COMMIT;