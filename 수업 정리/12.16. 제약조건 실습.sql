show databases;
use mydb;

drop table if exists parent;
create table parent (
	id int not null,
    primary key(id)
);

insert into parent values (1), (2), (3), (4), (5);

select * from parent;

drop table if exists child1;
create table child1 (
	id int not null,
    parent_id int,
    foreign key (parent_id) references parent(id)
    on delete cascade	
    on update cascade
);

drop table if exists child2;
create table child2 (
	id int not null,
    parent_id int,
    foreign key (parent_id) references parent(id)
    on delete set null	
    on update no action
);

insert into child1 values (1, 3), (1, 4), (2, 3), (2, 5), (2, 2);
insert into child2 values (1, 3), (1, 4), (2, 3), (2, 5), (2, 2);

-- 셋팅 끝, 삭제 한번 해보까?

delete from parent where id = 3;

update parent set id = 20 where id = 2;



# 문제 풀기

create table child3 (
	ppap	int		not null,
    f_key	int,
    foreign key (f_key)	references parent(id)
);
desc child3;
select * from information_schema.table_constraints
	where table_name = 'child3';
