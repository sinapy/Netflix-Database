CREATE TABLE USER(
    userId NUMBER PRIMARY KEY,
    firstName VARCHAR2(30),
    lastName VARCHAR2(30),
    emailAddress VARCHAR2(100),
    hashPassword VARCHAR2(200),
    age NUMBER(3, 0)
)