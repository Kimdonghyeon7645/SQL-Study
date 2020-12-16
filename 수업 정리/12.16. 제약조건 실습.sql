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

select * from child1;
select * from child2;
