CREATE TABLE tb_reservation
(
    `reserve_seq`     INT           NOT NULL    AUTO_INCREMENT COMMENT '예약시퀀스', 
    `user_seq`        INT           NOT NULL    COMMENT '유저시퀀스', 
    `hospital_seq`       INT(10)           NOT NULL    COMMENT '병원코드', 
    `doctor_seq`        INT           NOT NULL    COMMENT '의사코드', 
    `reg_date`        datetime      default now()    COMMENT '접수날짜', 
    `reserve_date`    DATE          NOT NULL    COMMENT '날짜', 
    `reserve_time`    VARCHAR(4)      NOT NULL    COMMENT '시간', 
    `symptom`         VARCHAR(600)       NOT NULL    COMMENT '증상', 
    `reserve_status`  VARCHAR(1)   default '1'    COMMENT '방문상태', 
    `review_status`   VARCHAR(1)    default 'f'    COMMENT '리뷰작성', 
    `review_no`   INT    NULL    COMMENT '리뷰글번호'
    PRIMARY KEY (reserve_seq)
);
ALTER TABLE tb_reservation COMMENT '예약정보 테이블';
/*방문상태 1:예약접수(default), 2:예약취소, 3:미방문, 4:진료완료*/
/*리뷰작성 true(default) / false*/


CREATE TABLE tb_reservation_time
(
    `time_seq`        INT           NOT NULL    AUTO_INCREMENT COMMENT '타임시퀀스', 
    `hospital_seq`       INT(10)           NOT NULL    COMMENT '병원코드', 
    `doctor_seq`        INT           NOT NULL    COMMENT '의사코드', 
    `date`            DATE          NOT NULL    COMMENT '날짜', 
    `time`            VARCHAR(4)    NOT NULL    COMMENT '시간', 
    `booked_status`   VARCHAR(1)    default 'f'    COMMENT '예약상태', 
    `blocked_status`  VARCHAR(1)    default 'f'    COMMENT '막힘상태', 
    PRIMARY KEY (time_seq)
);
ALTER TABLE tb_reservation_time COMMENT '예약시간 관리 테이블';
/*예약상태,막힘상태 true(default) / false*/

CREATE TABLE tb_doctor
(
    `doctor_seq`    INT            NOT NULL    AUTO_INCREMENT COMMENT '의사 시퀀스', 
    `hospital_seq`  INT            NOT NULL    COMMENT '병원 시퀀스', 
    `doctor_name`   VARCHAR(12)    NOT NULL    COMMENT '의사 이름', 
    `major_seq`     VARCHAR(15)    NULL        COMMENT '소속 전공코드', 
    PRIMARY KEY (doctor_seq)
);
ALTER TABLE tb_doctor COMMENT '의사정보 테이블';


CREATE TABLE tb_major_code
(
    `major_seq`   INT            NOT NULL    AUTO_INCREMENT COMMENT '전공 시퀀스', 
    `major_name`  VARCHAR(30)    NOT NULL    COMMENT '전공이름 (ex.신경외과)', 
    PRIMARY KEY (major_seq)
);
ALTER TABLE tb_major_code COMMENT '진료과목 코드테이블';
/*가정의학과, 내과, 소아과, 신경정신과, 이비인후과, 안과, 피부과, 성형외과, 정형외과, 흉부외과 */


/*방문자수(통계) 테이블*/
CREATE TABLE tb_visit_cnt
(
    `hospital_seq`  INT     NOT NULL    COMMENT '병원시퀀스', 
    `visit_date`    DATE    NOT NULL    COMMENT '날짜', 
    `visit_cnt`     INT     NULL default 1        COMMENT '조회수', 
    PRIMARY KEY (hospital_seq, visit_date)
);
ALTER TABLE tb_visit_cnt COMMENT '방문자수 통계용';