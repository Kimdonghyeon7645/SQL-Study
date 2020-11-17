use sql_study;

alter table 교수 add column 순위 int;

insert into 교수 values
	(5, "롸이겔루스", 5);

update 교수 set 순위 = 2
 where name = "가네";
-- safe update 로 에러가 난다면, edit > preferences... > SQL Editor > Other 의 Safe Updates를 꺼주고, MySQL Workbench를 재연결하자
 
select count(교수.순위) as count 
  from 교수 natural join 이론
 where no > 1;
# 위는 (1) 실행 구문

-- 공부 릴레이션과 같은 뷰(View)가 생성되도록 SQL구문 작성
select 교수.no as 번호, title as 내용 
  from 교수 inner join 이론 on 교수.no = 이론.no
 where title <> "수업";


# 아래는 상태 테스트 구문 
select * from 교수;
select * from 교수 natural join 이론;
