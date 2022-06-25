use sql_study;

-- 중간성적과 기말성적의 평균을 5등급으로 나눠, 1~5등급으로 출력하는 쿼리문
# ntile(등급 개수) over (order by 정렬조건) : 정렬 조건에 따라 등급 개수만큼 나눔
select 중간성적, 기말성적, (중간성적+기말성적)/2 as 중간기말평균, ntile(5) over (order by (중간성적+기말성적)/2 desc) as 등급 from 이수;
 

-- 학생별로 이수한 과목 중간성적, 기말성적 합계, 마지막 행에 전체 학생의 중간성적, 기말성적 합계 추가해 출력하는 쿼리문
# rollup : group by 로 그룹핑한 로우(행) 들의 합계를 마지막 구해줌 (group by 절 뒤에 with rollup 추가) (집계함수가 없으면 그룹핑해도 합계가 출력되지 않음)
select 학번, sum(중간성적), sum(기말성적) from 이수 group by 학번 with rollup;
