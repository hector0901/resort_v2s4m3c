/**********************************/
/* Table Name: ��� */
/**********************************/
DROP TABLE reply;

CREATE TABLE reply(
        replyno                                NUMBER(10)         NOT NULL         PRIMARY KEY,
        contentsno                           NUMBER(10)    NOT     NULL ,
        memberno                            NUMBER(6)         NOT NULL ,
        content                               VARCHAR2(1000)         NOT NULL,
        passwd                                VARCHAR2(20)         NOT NULL,
        rdate                              DATE NOT NULL,
  FOREIGN KEY (contentsno) REFERENCES contents (contentsno),
  FOREIGN KEY (memberno) REFERENCES member (memberno)
);

COMMENT ON TABLE reply is '���';
COMMENT ON COLUMN reply.replyno is '��۹�ȣ';
COMMENT ON COLUMN reply.contentsno is '��������ȣ';
COMMENT ON COLUMN reply.memberno is 'ȸ�� ��ȣ';
COMMENT ON COLUMN reply.content is '����';
COMMENT ON COLUMN reply.passwd is '��й�ȣ';
COMMENT ON COLUMN reply.rdate is '�����';

1) ���
INSERT INTO reply(replyno, contentsno, memberno, content, passwd, rdate)
VALUES((SELECT NVL(MAX(replyno), 0) + 1 as replyno FROM reply),
             45, 1, '���1', '1234', sysdate);
INSERT INTO reply(replyno, contentsno, memberno, content, passwd, rdate)
VALUES((SELECT NVL(MAX(replyno), 0) + 1 as replyno FROM reply),
             45, 1, '���2', '1234', sysdate);
INSERT INTO reply(replyno, contentsno, memberno, content, passwd, rdate)
VALUES((SELECT NVL(MAX(replyno), 0) + 1 as replyno FROM reply),
             45, 1, '���3', '1234', sysdate);             

commit;

2) ��ü ���
SELECT replyno, contentsno, memberno, content, passwd, rdate
FROM reply
ORDER BY replyno DESC;

 REPLYNO CONTENTSNO MEMBERNO CONTENT PASSWD RDATE
 ------- ---------- -------- ------- ------ ---------------------
       3          45        1 ���3     1234   2019-12-17 16:59:38.0
       2          45        1 ���2     1234   2019-12-17 16:59:37.0
       1          45        1 ���1     1234   2019-12-17 16:59:36.0


3) contentsno �� ���
SELECT replyno, contentsno, memberno, content, passwd, rdate
FROM reply
WHERE contentsno=1
ORDER BY replyno DESC;

 REPLYNO CONTENTSNO MEMBERNO CONTENT PASSWD RDATE
 ------- ---------- -------- ------- ------ ---------------------
       3          1        1 ���3     1234   2019-12-17 16:59:38.0
       2          1        1 ���2     1234   2019-12-17 16:59:37.0
       1          1        1 ���1     1234   2019-12-17 16:59:36.0


4) ����
-- �н����� �˻�
SELECT count(passwd) as cnt
FROM reply
WHERE replyno=1 AND passwd='1234';

 CNT
 ---
   1
   
-- ����
DELETE FROM reply
WHERE replyno=1;

COMMIT;

5) contentsno�� �ش��ϴ� ��� �� Ȯ�� �� ����
SELECT COUNT(*) as cnt
FROM reply
WHERE contentsno=1;

 CNT
 ---
   1

DELETE FROM reply
WHERE contentsno=1;

6) memberno�� �ش��ϴ� ��� �� Ȯ�� �� ����
SELECT COUNT(*) as cnt
FROM reply
WHERE memberno=1;

 CNT
 ---
   1

DELETE FROM reply
WHERE memberno=1;

7-1) reply + member join ��ü ���
SELECT m.id,
           r.replyno, r.contentsno, r.memberno, r.content, r.passwd, r.rdate
FROM member m,  reply r
WHERE m.memberno = r.memberno 
ORDER BY r.replyno DESC;


7-2) reply + member join ��� + ȸ�� ID
SELECT m.id,
           r.replyno, r.contentsno, r.memberno, r.content, r.passwd, r.rdate
FROM member m,  reply r
WHERE (m.memberno = r.memberno) AND r.contentsno= 45
ORDER BY r.replyno DESC;

 ID    REPLYNO CONTENTSNO MEMBERNO CONTENT                                                                                                                                                                         PASSWD RDATE
 ----- ------- ---------- -------- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ------ ---------------------
 user1       3          1        1 ��� 3                                                                                                                                                                            123    2019-12-18 16:46:43.0
 user1       2          1        1 ��� 2                                                                                                                                                                            123    2019-12-18 16:46:39.0
 user1       1          1        1 ��� 1                                                                                                                                                                            123    2019-12-18 16:46:35.0
 
7-3) ������ ��ư ����¡, contentsno �� ���
SELECT id, replyno, contentsno, memberno, content, passwd, rdate, r
FROM (
        SELECT id, replyno, contentsno, memberno, content, passwd, rdate, rownum as r
        FROM (
                SELECT m.id,
                           r.replyno, r.contentsno, r.memberno, r.content, r.passwd, r.rdate
                FROM member m,  reply r
                WHERE (m.memberno = r.memberno) AND r.contentsno=45
                ORDER BY r.replyno DESC
        )
)
WHERE r >= 1 AND r <= 2;
 
 
8) ������ �н����� �˻�
SELECT COUNT(*) as cnt
FROM reply
WHERE replyno=1 AND passwd='1234';

 CNT
 ---
   0

9) ����
DELETE FROM reply
WHERE replyno=1;



