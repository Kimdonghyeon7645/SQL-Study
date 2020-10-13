use sqldb;

-- 사용자별 총 구매 개수 구하기
select userID as '사용자 아이디', SUM(amount) as '총 구매 개수' from buytbl group by userID;

-- 사용자별 총 구매액 구하기
select userID as '사용자 아이디', SUM(price * amount) as '총 구매액' from buytbl group by userID;

-- 모든 구매자의 물품 개수 평균
select AVG(amount) as '평균 구매 개수' from buytbl;

-- 사용자별로 구매한 물품 개수 평균
select userID, AVG(amount) as '평균 구매 개수' from buytbl group by userID;