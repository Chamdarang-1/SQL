-- 생성자 Oracle SQL Developer Data Modeler 24.3.1.347.1153
--   위치:        2025-08-11 12:16:47 KST
--   사이트:      Oracle Database 21c
--   유형:      Oracle Database 21c



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE lecture (
    lecno     INTEGER NOT NULL,
    lecname   VARCHAR2(20 BYTE) NOT NULL,
    leccredit INTEGER NOT NULL,
    lectime   INTEGER NOT NULL,
    lecclass  VARCHAR2(10)
);

ALTER TABLE lecture ADD CONSTRAINT lecture_pk PRIMARY KEY ( lecno );

CREATE TABLE register (
    reg_stdno     CHAR(8 BYTE) NOT NULL,
    reglecno      INTEGER NOT NULL,
    regmidscore   INTEGER,
    regfinalscore INTEGER,
    regtotalscore INTEGER,
    reggrade      CHAR(1 BYTE)
);

CREATE TABLE student (
    stdno      CHAR(8 BYTE) NOT NULL,
    stdname    VARCHAR2(20 BYTE) NOT NULL,
    stdhp      CHAR(13 BYTE) NOT NULL,
    stdyear    INTEGER NOT NULL,
    stdaddress VARCHAR2(100 BYTE)
);

ALTER TABLE student ADD CONSTRAINT student_pk PRIMARY KEY ( stdno );

ALTER TABLE student ADD CONSTRAINT student__un UNIQUE ( stdhp );

ALTER TABLE register
    ADD CONSTRAINT register_lecture_fk FOREIGN KEY ( reglecno )
        REFERENCES lecture ( lecno );

ALTER TABLE register
    ADD CONSTRAINT register_student_fk FOREIGN KEY ( reg_stdno )
        REFERENCES student ( stdno );

INSERT INTO STUDENT VALUES ('20201011', '김유신', '010-1234-1001', 3, '경남 김해시');
INSERT INTO STUDENT VALUES ('20201122', '김춘추', '010-1234-1002', 3, '경남 경주시');
INSERT INTO STUDENT VALUES ('20210213', '장보고', '010-1234-1003', 2, '전남 완도군');
INSERT INTO STUDENT VALUES ('20210324', '강감찬', '010-1234-1004', 2, '서울 관악구');
INSERT INTO STUDENT VALUES ('20220415', '이순신', '010-1234-1005', 1, '서울 종로구');

INSERT INTO LECTURE VALUES (101, '컴퓨터과학 개', 2, 40, '본301');
INSERT INTO LECTURE VALUES (102, '프로그래밍 언', 3, 52, '본302');
INSERT INTO LECTURE VALUES (103, '데이터베이스', 3, 56, '본303');
INSERT INTO LECTURE VALUES (104, '자료구조', 3, 60, '본304');
INSERT INTO LECTURE VALUES (105, '운영체제', 3, 52, '본305');

INSERT INTO REGISTER VALUES ('20220415', 101, 60, 30, NULL, NULL);
INSERT INTO REGISTER VALUES ('20210324', 103, 54, 36, NULL, NULL);
INSERT INTO REGISTER VALUES ('20201011', 105, 52, 28, NULL, NULL);
INSERT INTO REGISTER VALUES ('20220415', 102, 38, 40, NULL, NULL);
INSERT INTO REGISTER VALUES ('20210324', 104, 56, 32, NULL, NULL);
INSERT INTO REGISTER VALUES ('20210213', 103, 48, 40, NULL, NULL);

SELECT
    S.STDNO,
    S.STDNAME,
    S.STDHP,
    S.STDYEAR
FROM STUDENT S
LEFT JOIN REGISTER R ON S.STDNO = R.REG_STDNO
WHERE REG_STDNO IS NULL;

UPDATE REGISTER SET
    REGTOTALSCORE = REGMIDSCORE + REGFINALSCORE,
    REGGRADE = CASE
        WHEN( REGMIDSCORE + REGFINALSCORE ) >= 90 THEN 'A'
        WHEN( REGMIDSCORE + REGFINALSCORE ) >= 80 THEN 'B'
        WHEN( REGMIDSCORE + REGFINALSCORE ) >= 70 THEN 'C'
        WHEN( REGMIDSCORE + REGFINALSCORE ) >= 60 THEN 'D'
        ELSE 'F'
    END;
    
SELECT
    S.STDNO,
    S.STDNAME,
    L.LECNAME,
    R.REGMIDSCORE,
    R.REGFINALSCORE,
    R.REGTOTALSCORE,
    R.REGGRADE
FROM STUDENT S
JOIN REGISTER R ON S.STDNO = R.REG_STDNO
JOIN LECTURE L ON R.REGLECNO = L.LECNO
WHERE STDYEAR = 2;


-- Oracle SQL Developer Data Modeler 요약 보고서: 
-- 
-- CREATE TABLE                             3
-- CREATE INDEX                             0
-- ALTER TABLE                              5
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
