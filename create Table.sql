CREATE TABLE Person (
  pid INTEGER,
  fName CHAR(26),
  lName CHAR(26),
  PRIMARY KEY (pid)
);

CREATE TABLE Organizations (
  orid INTEGER,
  oname CHAR(26),
  PRIMARY KEY (orid)
);

CREATE TABLE Volunteers (
  pid INTEGER,
  orid INTEGER,
  des CHAR(30) DEFAULT NULL,
  hrs INTEGER,
  vdate DATE,
  PRIMARY KEY (pid, orid),
  FOREIGN KEY (pid) REFERENCES Person,
  FOREIGN KEY (orid) REFERENCES Organizations
);

CREATE TABLE ParkingSpot (
  lot CHAR(1),
  spotNum INTEGER,
  PRIMARY KEY (lot,spotNum)
);

CREATE TABLE Buys (
  pid INTEGER,
  lot CHAR(1),
  spotNum INTEGER,
  PRIMARY KEY (pid,lot,spotNum),
  FOREIGN KEY (pid) REFERENCES Person,
  FOREIGN key (Lot,spotNum) REFERENCES ParkingSpot
);

CREATE TABLE Course (
cid INTEGER,
  cdays CHAR(5),
  title CHAR(26),
  csize INTEGER,
  finalExam DATE,
  sem CHAR(6),
  yr INTEGER,
  PRIMARY KEY (cid, sem, yr)
);

CREATE TABLE Student (
  pid INTEGER,
  major CHAR(26),
  email CHAR(128),
  PRIMARY KEY (pid),
  FOREIGN KEY (pid) REFERENCES Person
);

CREATE TABLE Registers (
  pid INTEGER,
  cid INTEGER,
  sem CHAR(6),
  yr INTEGER,
  PRIMARY KEY (cid, pid,sem,yr),
  FOREIGN KEY (cid,sem,yr) REFERENCES Course,
  FOREIGN KEY (pid) REFERENCES Student
);

CREATE TABLE FinalGrade (
  pid INTEGER,
  cid INTEGER,
  grade CHAR(1),
  sem CHAR(6),
  yr INTEGER,
  PRIMARY KEY (pid, cid, sem, yr),
  FOREIGN KEY (pid) REFERENCES Student,
  FOREIGN KEY (cid, sem, yr) REFERENCES Course
);

CREATE TABLE Faculty (
  pid INTEGER,
  dept CHAR(3),
  PRIMARY KEY (pid),
  FOREIGN KEY (pid) REFERENCES Person
);

CREATE TABLE Teaches (
  pid INTEGER,
  cid INTEGER,
  sem CHAR(6),
  yr INTEGER,
  PRIMARY KEY (pid, cid, sem, yr),
  FOREIGN KEY (cid, sem, yr) REFERENCES Course,
  FOREIGN KEY (pid) REFERENCES Faculty
);

CREATE TABLE Room (
  building CHAR(3),
  roomNum INTEGER,
  PRIMARY KEY (building, roomNum)
);

CREATE TABLE LocatedAt (
  cid INTEGER,
  sem CHAR(6),
  yr INTEGER,
  building CHAR(3),
  roomNum INTEGER,
  PRIMARY KEY (cid, sem, yr, building, roomNum),
  FOREIGN KEY (cid, sem, yr) REFERENCES Course,
  FOREIGN KEY (building, roomNum) REFERENCES Room
);

