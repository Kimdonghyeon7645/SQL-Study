use mydb;
drop table if exists dept;
drop table if exists emp;

-- create table dept(
-- 		dept_id		int		auto_increment		primary key,		# 컬럼 레벨에서 제약조건(pk) 지정
-- 		dept_name	varchar(20)		not null
-- );
create table dept(
	dept_id		int		auto_increment,
	dept_name	varchar(20)		not null,
	-- constraint PK_dept_dept_id primary key(dept_id)		# 테이블 레벨에서 제약조건(pk) 지정 = 정석
    primary key(dept_id)	# 굳이 제약조건 없이 이렇게 pk 지정가능
);

show index from dept;	# dept에 만들어진 인덱스(PK-> 클러스터 인덱스) 확인
select * from information_schema.table_constraints;


-- insert into dept values		# 모든 컬럼에 값을 삽입
-- 	(1, "총무부");
insert into dept(dept_name) values
	("교육부");

select * from dept;


create table emp(
	emp_id		int		auto_increment,
    emp_name	varchar(20)	not null,
    dept_id		int,
 	primary key(emp_id),
    constraint pk_emp_dept_dept_id foreign key(dept_id) references dept(dept_id)
);


insert into emp values
	(1, "청학동", 1),
    (2, "동학동", 1),
    (3, "학동학", 2);
    
select dept.dept_id as '부서번호', dept_name as '부서명', emp_id as '직원번호', emp_name as '직원명' from emp inner join dept
	on emp.dept_id = dept.dept_id;
