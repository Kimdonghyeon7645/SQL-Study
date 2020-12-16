show databases;
use mydb;

create table parent (
	id int not null,
    primary key(id)
);

insert into parent values (1), (2), (3), (4), (5);

select * from parent;

create table child1 (
	id int not null,
    parent_id int,
    foreign key (parent_id) references parent(id)
    on delete set null	on update cascade
);

create table child2 (
	id int not null,
    parent_id int,
    foreign key (parent_id) references parent(id)
    on delete set null	on update no action
);

insert into child1 values (1, 3), (1, 4), (2, 3), (2, 5), (2, 2);
insert into child2 values (1, 3), (1, 4), (2, 3), (2, 5), (2, 2);


