SHOW DATABASES;

CREATE DATABASE board;

USE board;

CREATE TABLE board.TB_BOARD (
BOARD_SEQ INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '게시글 번호',
BOARD_RE_REF INT COMMENT '글의 그룹 번호',
BOARD_RE_LEV INT COMMENT '답변 글의 깊이',
BOARD_RE_SEQ INT COMMENT '답변 글의 순서',
BOARD_WRITER VARCHAR(20) COMMENT '게시글의 작성자',
BOARD_SUBJECT VARCHAR(50) COMMENT '게시글의 제목',
BOARD_CONTENT VARCHAR(2000) COMMENT '게시글의 내용',
BOARD_HITS INT UNSIGNED NOT NULL DEFAULT '0' COMMENT '게시글의 조회수',
DEL_YN VARCHAR(1) NOT NULL DEFAULT 'N' COMMENT '삭제유무',
INS_USER_ID VARCHAR(20) COMMENT '입력자ID',
INS_DATE DATETIME COMMENT '입력일시',
UPD_USER_ID VARCHAR(20) COMMENT '입력자ID',
UPD_DATE DATETIME COMMENT '입력일시',
PRIMARY KEY (BOARD_SEQ)
) COMMENT '게시판'; 

SHOW FULL COLUMNS FROM board.TB_BOARD; 

INSERT INTO board.TB_BOARD (BOARD_RE_REF, BOARD_RE_LEV, BOARD_RE_SEQ, BOARD_WRITER, BOARD_SUBJECT, BOARD_CONTENT, INS_USER_ID, INS_DATE) VALUES (0, 0, 0, '게시글 작성자1', '게시글 제목1', '게시글 내용1', 'TEST1', NOW() );
INSERT INTO board.TB_BOARD (BOARD_RE_REF, BOARD_RE_LEV, BOARD_RE_SEQ, BOARD_WRITER, BOARD_SUBJECT, BOARD_CONTENT, INS_USER_ID, INS_DATE) VALUES (0, 0, 0, '게시글 작성자2', '게시글 제목2', '게시글 내용2', 'TEST2', NOW() );
INSERT INTO board.TB_BOARD (BOARD_RE_REF, BOARD_RE_LEV, BOARD_RE_SEQ, BOARD_WRITER, BOARD_SUBJECT, BOARD_CONTENT, INS_USER_ID, INS_DATE) VALUES (0, 0, 0, '게시글 작성자3', '게시글 제목3', '게시글 내용3', 'TEST3', NOW() );
INSERT INTO board.TB_BOARD (BOARD_RE_REF, BOARD_RE_LEV, BOARD_RE_SEQ, BOARD_WRITER, BOARD_SUBJECT, BOARD_CONTENT, INS_USER_ID, INS_DATE) VALUES (0, 0, 0, '게시글 작성자4', '게시글 제목4', '게시글 내용4', 'TEST4', NOW() );
INSERT INTO board.TB_BOARD (BOARD_RE_REF, BOARD_RE_LEV, BOARD_RE_SEQ, BOARD_WRITER, BOARD_SUBJECT, BOARD_CONTENT, INS_USER_ID, INS_DATE) VALUES (0, 0, 0, '게시글 작성자5', '게시글 제목5', '게시글 내용5', 'TEST5', NOW() );

SELECT * FROM TB_BOARD;

-- TB_BOARD_FILE 테이블 생성 및 코멘트 추가
CREATE TABLE BOARD.TB_BOARD_FILE(
	BOARD_SEQ INT NOT NULL COMMENT '게시글 번호',
    FILE_NO INT NOT NULL COMMENT '첨부파일 번호',
    FILE_NAME_KEY VARCHAR(200) COMMENT '첨부파일 암호화명',
    FILE_NAME VARCHAR(100) COMMENT '첨부파일명',
    FILE_PATH VARCHAR(300) COMMENT '첨부파일 경로',
    FILE_SIZE VARCHAR(50) COMMENT '첨부파일 크기',
    REMARK VARCHAR(1000) COMMENT '비고',
    DEL_YN VARCHAR(1) COMMENT '삭제유무',
    IN_USER_ID  VARCHAR(20) COMMENT '입력자ID',
    INS_DATE DATETIME COMMENT '수정일시',
    UPD_USER_ID VARCHAR(20) COMMENT '수정자ID',
    UPD_DATE DATETIME COMMENT '수정일시',
    PRIMARY KEY (BOARD_SEQ, FILE_NO) ) COMMENT '게시판 첨부파일';

-- TB_BOARD 테이블 샘플 데이터 조회
SELECT *
FROM BOARD.TB_BOARD_FILE;


SELECT VERSION();
SHOW VARIABLES LIKE 'version';