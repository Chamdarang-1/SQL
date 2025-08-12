/*
정규화 실습하기
*/

CREATE TABLE bookorder (
    orderno   NUMBER NOT NULL,
    orderdate DATE,
    custid    VARCHAR2(20 BYTE),
    cname     VARCHAR2(20),
    address   VARCHAR2(100),
    bookid    NUMBER,
    bookname  VARCHAR2(100),
    count     NUMBER,
    price     NUMBER
);

ALTER TABLE bookorder ADD CONSTRAINT table_1_pk PRIMARY KEY ( orderno );

INSERT INTO BOOKORDER VALUES (10001, '2024-01-12', 'A101', '김유신', '김해', 101, '프로그래밍', 1, 28000);
INSERT INTO BOOKORDER VALUES (10002, '2024-01-12', 'A102', '김춘추', '경주', 101, '프로그래밍', 1, 28000);
INSERT INTO BOOKORDER VALUES (10002, '2024-01-12', 'A102', '김춘추', '경주', 102, '자료구조', 2, 32000);
INSERT INTO BOOKORDER VALUES (10003, '2024-01-12', 'A103', '장보고', '완도', 102, '자료구조', 2, 32000);
INSERT INTO BOOKORDER VALUES (10004, '2024-01-12', 'A104', '강감찬', '서울', 110, '데이터베이스', 1,25000);
INSERT INTO BOOKORDER VALUES (10005, '2024-01-12', 'A105', '이순신', '서울', 110, '데이터베이스', 1,25000 );
INSERT INTO BOOKORDER VALUES (10005, '2024-01-12', 'A105', '이순신', '서울', 102, '자료구조', 1, 32000);

