use university_database;

 
CREATE TABLE proffesor (
  SSN VARCHAR(8) PRIMARY KEY,
  Name CHAR(20) NOT NULL,
  Age INT NOT NULL,
  Ran_K INT NOT NULL,
  Speciality CHAR(25)
  );
  
 
CREATE TABLE department(
	DNo INT NOT NULL UNIQUE,
    DName CHAR(20),
    SSN VARCHAR(8) ,
    PRIMARY KEY(DNo),
    FOREIGN KEY (SSN) REFERENCES proffesor(SSN)
);
CREATE TABLE project (
  PId VARCHAR(8) NOT NULL UNIQUE,
  Start_Date DATE NULL,
  End_Date DATE NULL,
  Sponsor CHAR(10) NULL,
  Budget INT NULL,
  SSN VARCHAR(8) NULL,
  PRIMARY KEY (PId),
  FOREIGN KEY (SSN)
  REFERENCES proffesor (SSN)
);
CREATE TABLE work_dept (
   SSN VARCHAR(8),
  DNo INT, Timing TIME,
  PRIMARY KEY (SSN, DNo),

    FOREIGN KEY (SSN)
    REFERENCES proffesor (SSN),

    FOREIGN KEY ( DNo)
    REFERENCES department (DNo)
);


CREATE TABLE student (
  S_ID VARCHAR(8) NOT NULL UNIQUE,
  Name CHAR(20) NOT NULL,
  Age INT NOT NULL,
  Program CHAR(10) NOT NULL,
  DNo INT NULL,
  PId VARCHAR(8) NULL,
  SSN VARCHAR(8) NULL,
  PRIMARY KEY (S_ID),
    FOREIGN KEY (DNo)
    REFERENCES department (DNo),
    
    FOREIGN KEY (PId)
    REFERENCES project (PId),
    
    FOREIGN KEY (SSN)
    REFERENCES proffesor (SSN)
    );

CREATE TABLE work_in (
  SSN VARCHAR(8),
  PId VARCHAR(8),
  PRIMARY KEY (SSN, PId),

    FOREIGN KEY (SSN)
    REFERENCES proffesor (SSN),

    FOREIGN KEY ( PId)
    REFERENCES project (PId)
);

INSERT INTO proffesor (SSN, Name, Age, Ran_k, Speciality)
 VALUES ('CS01', 'VK', 50, 1, 'SE');
INSERT INTO proffesor (SSN, Name, Age, Ran_k, Speciality)
 VALUES ('CS02', 'Vidyardthi', 53, 2, 'DS'), ('CS03', 'DK Lobiyal', 50, 1, 'CN'),
 ('CS04', 'RK Agarwal', 60, 1, 'DAA'), ('CS05', 'Manju Khari', 45, 3, 'CF'), ('CS06', 'Poonam Agarwal', 40, 2, 'AI');
INSERT INTO proffesor (SSN, Name, Age, Ran_k, Speciality)
 VALUES ('ME01', 'DP Mahto', 43, 1, 'Robotics'), ( 'ME02', 'SK Chourasia', 33, 3, 'VLSI'),
 ('PH01', 'Goutam Mukherjee', 55, 1, 'Thermal Physics'), ('PH02', 'Amit Banerjee', 30, 3, 'Photonics'),
 ('PH03', 'Sudipto Chatterjee', 50, 1, 'Mathematics');
 
 


INSERT INTO department (DNo, DName, SSN) VALUES (1, 'Computer Application', 'CS01');
INSERT INTO department (DNo, DName, SSN) VALUES (2, 'EE', 'CS02');
INSERT INTO department (DNo, DName, SSN) VALUES (3, 'Management', 'PH01');
INSERT INTO department (DNo, DName, SSN) VALUES (4, 'Computer Science', 'PH02'),
(5, 'ME', 'CS03'), (6, 'ECE', 'CS04');


INSERT INTO project (PId, Start_Date, Sponsor, Budget, SSN) VALUES ('P101', '2023-03-02', 'RAJA', 15000, 'CS01');
INSERT INTO project (PId, Start_Date, Sponsor, Budget, SSN) VALUES ('P102', '2023-04-05', 'Krishna', 10000, 'CS02');
INSERT INTO project (PId, Start_Date, End_Date, Sponsor, Budget, SSN) VALUES ('P103', '2022-06-01', '2023-02-10', 'Amazon', 20000, 'PH01');
INSERT INTO project (PId, Start_Date, End_Date, Sponsor, Budget, SSN) VALUES 
('P104', '2021-01-02', '2022-05-20', 'Microsoft', 30000, 'PH02'), ('P105', '2020-01-01', '2023-05-05', 'JP Morgan', 50000, 'ME02'); 



INSERT INTO student (S_ID, Name, Age, Program, DNo, PId, SSN) VALUES ('MCA01', 'Ankit', 23, 'MCA', 1, 'P101', 'CS01');
INSERT INTO student (S_ID, Name, Age, Program, DNo, PId, SSN) VALUES ('MCA02', 'Rohit', 25, 'Mtech', 2, 'P102', 'CS02'),
('Soni123', 'Soni', 22, 'MCA', 1, 'P105', 'CS06'), ('Krishn57', 'Krishna', 21, 'AI', 4, 'P104', 'ME01'),
('Ankit05', 'Ankar', 25, 'MSC', 3, 'P103', 'ME02'), ('Prash01', 'Prashant', 45, 'Ph.d', 4,  'P101', 'ME02'),
('Anup45', 'Anupam', 34, 'MCA', 4, 'P101', 'CS03'), ('Aroo34', 'Aroohi', 20, 'BTech', 5, 'P102', 'CS04'),
('Kus045', 'Khushi', 23, 'Mtech', 2, 'P103', 'CS04'), ('Sour01', 'Sourav', 34, 'Ph.d', 3, 'P101', 'CS03');



INSERT INTO work_dept (SSN, DNo, Timing) VALUES ('CS01', 1, '09:00:00');
INSERT INTO work_dept (SSN, DNo, Timing) VALUES ('CS02', 2, '10:30:00'),
('CS03', 3, '09:00:00'), ('CS03', 4, '11:00:00'), ('CS01', 2, '12:30:00'), ('CS01', 4, '15:00:00'),
('CS02', 1, '13:00:00'), ('PH01', 1, '08:00:00'), ('PH01', 6, '12:00:00'), ('PH02', 6, '09:00:00');



INSERT INTO work_in (SSN, PId) VALUES ('CS01', 'P102');
INSERT INTO work_in (SSN, PId) VALUES ('CS02', 'P101'), ('CS02', 'P102'), ('CS02', 'P105'),
('CS03', 'P104'), ('CS03', 'P103'), ('CS01', 'P104'), ('PH01', 'P101'), ('PH02', 'P103'), ('PH03', 'P102');










