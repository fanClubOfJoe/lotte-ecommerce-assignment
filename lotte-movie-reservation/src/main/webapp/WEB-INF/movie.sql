use mydb;

DROP TABLE theater_details;
DROP TABLE reserves;
DROP TABLE theaters;
DROP TABLE reviews;
DROP TABLE movies;
DROP TABLE users;

-- CREATE TABLE
CREATE TABLE movies(
                       movie_no int not null primary key auto_increment,
                       movie_title varchar(50) not null unique, -- 제목
                       movie_rate decimal(4, 2), -- 평점
                       movie_content varchar(4000), -- 줄거리
                       movie_summary varchar(1000), -- 간단한 내용
                       movie_img varchar(1000), -- 이미지
                       movie_screen_date timestamp not null default now(),
                       movie_time varchar(10),
                       movie_category varchar(1000),
                       reserve_rate decimal(4, 2), -- 예매율
                       age_grade varchar(100) not null default '전체' -- 영화등급
);

CREATE TABLE theaters(
                         theater_no int not null primary key auto_increment,
                         theater_name varchar(100) not null,
                         theater_location varchar(200) not null
);

CREATE TABLE theater_details(
                                theater_detail_no int not null primary key auto_increment,
                                theater_no int not null,
                                movie_no int not null,
                                theater_detail_standard_date timestamp not null default now(),
                                theater_detail_time varchar(10) not null,
                                theater_detail_remain_seats int not null default 0,
                                theater_detail_seats int not null,
                                foreign key(movie_no) references movies(movie_no),
                                foreign key(theater_no) references theaters(theater_no)
);

CREATE TABLE users(
                      user_no int not null primary key auto_increment,
                      user_id varchar(50) not null unique,
                      user_email varchar(100) not null unique,
                      user_name varchar(50) not null,
                      user_password varchar(50) not null
);

CREATE TABLE reserves(
                         reserve_no int not null primary key auto_increment,
                         user_no int not null,
                         movie_no int not null,
                         reserve_time timestamp not null,
                         reserve_enter_count int not null default 1,
                         foreign key(user_no) references users(user_no),
                         foreign key(movie_no) references movies(movie_no)
);

CREATE TABLE reviews(
                        review_no int not null primary key auto_increment,
                        movie_no int not null,
                        user_no int not null,
                        review_title varchar(50) not null,
                        review_content varchar(1000) not null,
                        review_rate decimal(4, 2) not null default 0.0, -- 사용자평점
                        foreign key(user_no) references users(user_no),
                        foreign key(movie_no) references movies(movie_no)
);
    

-- INSERT
INSERT INTO movies(movie_title, movie_rate, movie_content, movie_summary, movie_img, movie_screen_date, movie_time, movie_category, reserve_rate, age_grade)
VALUES("콘스탄틴", 4.72, "존 콘스탄틴, 인간세계와 지하세계의 경계에 선 절대 구원의 힘!", "", "https://movie.daum.net/moviedb/main?movieId=40906#photoId=136755", STR_TO_DATE('20050208', '%Y%m%d'),120, '액션/판타지', 8.3, "15세이상관람가");
INSERT INTO theaters VALUES (1, "비트컴퓨터 영화관", "강남");
INSERT INTO theater_details(theater_no, movie_no, theater_detail_standard_date, theater_detail_time, theater_detail_remain_seats, theater_detail_seats) VALUES (1, 1, STR_TO_DATE('20050208', '%Y%m%d') , "09:00", 65, 65);
INSERT INTO users(user_id, user_email, user_name, user_password) VALUES('test', 'test@test.com', '테스트', 'test');
INSERT INTO reserves(user_no, movie_no, reserve_time, reserve_enter_count) VALUES(1, 1, STR_TO_DATE("1200", '%H%i%s'), 5);

-- UPDATE
UPDATE theater_details SET theater_detail_remain_seats = 5 WHERE movie_no = 1;
SELECT movie_no, theater_detail_standard_date , 
                theater_detail_time, theater_detail_remain_seats , theater_detail_seats 
                FROM theater_details 
                WHERE DATEDIFF(now(), theater_detail_standard_date) > 0;
                
SELECT movie_no, movie_title, movie_rate, movie_content, movie_summary,movie_img, movie_screen_date, movie_time, movie_category, reserve_rate, age_grade
FROM movies WHERE movie_no = 1;

SELECT movie_no, theater_detail_remain_seats, theater_detail_seats
FROM theater_details;

SELECT IF(theater_detail_remain_seats >= 5 , 1 , 0) FROM theater_details WHERE movie_no = 1; 
