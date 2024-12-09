--Създаваме таблиците
create table specialties(
"id" number primary key,
"name" varchar(50) unique
);

create table titles (
    "id" number primary key,
     title varchar(50) not null
);

create table teachers (
    "id" number primary key, 
    first_name varchar(50) not null,
    last_name varchar(50) not null,
    telephone_number varchar(50), 
    email varchar(50) unique,
    title_id number not null,
    CONSTRAINT p_t_fk foreign key (title_id) references titles("id")
);

alter table teachers
add constraint ck_t_telephone_length
check (length(telephone_number) = 10);

create table disciplines (
    "id" number primary key, 
    "name" varchar(20) unique not null, 
    semestre number not null,
    teacher_id number not null,
    constraint d_t_fk foreign key (teacher_id) references teachers("id")
);

create table grades (
    "id" number primary key,
    grade number not null,
    discipline_id number not null,
    "date" date not null,
    constraint d_g_fk foreign key (discipline_id) references disciplines("id")
);

create table students (
    "id" number primary key,
    f_number number unique,
    first_name varchar(50) not null,
    last_name varchar(50) not null,
    specialty_id number not null, 
    course number not null, 
    email varchar(50) unique not null,
    constraint s_s_fk foreign key (specialty_id) references specialties("id")
);

create table student_grades (
    student_id number not null,
    grade_id number not null,
    constraint stud_disci_st_fk foreign key (student_id) references students("id"),
    constraint grade_st_disc_fk foreign key (grade_id) references grades("id")
);

create sequence spec_seq start with 1 increment by 1;

--Нанасяме информация в таблиците
insert into specialties("id","name") values (1,'СИТ');
insert into specialties("id","name") values (2,'КСТ');

insert into students("id",f_number,first_name,last_name,specialty_id,course,email) values (1,12432,'Бетина','Антонова',1,2,'betiTop@gmail.com');
insert into students("id",f_number,first_name,last_name,specialty_id,course,email) values (2,12562,'Николай','Николаев',1,2,'niki@gmail.com');
insert into students("id",f_number,first_name,last_name,specialty_id,course,email) values (3,12762,'Виктория','Николаева',1,2,'viki@gmail.com');
insert into students("id",f_number,first_name,last_name,specialty_id,course,email) values (4,12322,'Даниел','Хотинов',2,2,'dani@gmail.com');
insert into students("id",f_number,first_name,last_name,specialty_id,course,email) values (5,12112,'Явор','Антонов',2,2,'qjo@gmail.com');
insert into students("id",f_number,first_name,last_name,specialty_id,course,email) values (6,12452,'Мелтем','Еролова',2,2,'meltemTop@gmail.com');
insert into students("id",f_number,first_name,last_name,specialty_id,course,email) values (7,17892,'Николата','Иванова',1,2,'n_n@gmail.com');

insert into titles("id",title) values (1,'Декан');
insert into titles("id",title) values (2,'Доцент');
insert into titles("id",title) values (3,'Асистент');

insert into teachers("id",first_name,last_name,telephone_number,email,title_id) values (1,'Диян','Динев','0998765670','dinev@gmail.com',2);
insert into teachers("id",first_name,last_name,telephone_number,email,title_id) values (2,'Христо','Ненов','0998999672','nenov@gmail.com',1);
insert into teachers("id",first_name,last_name,telephone_number,email,title_id) values (3,'Димитричка','Николаева','0995675672','nikolaeva@gmail.com',3);
insert into teachers("id",first_name,last_name,telephone_number,email,title_id) values (4,'Мая','Тодорова','0993335672','todorova@gmail.com',2);

insert into disciplines("id","name",semestre,teacher_id) values (1,'ООП',2,2);
insert into disciplines("id","name",semestre,teacher_id) values (2,'Бази данни',2,1);
insert into disciplines("id","name",semestre,teacher_id) values (3,'ДС',2,3);
insert into disciplines("id","name",semestre,teacher_id) values (4,'СА',2,4);

insert into grades("id",grade,discipline_id,"date") values (1,6,1,'2024-12-21');
insert into grades("id",grade,discipline_id,"date") values (2,6,2,'2024-12-12');
insert into grades("id",grade,discipline_id,"date") values (3,6,3,'2024-10-11');
insert into grades("id",grade,discipline_id,"date") values (4,5,1,'2024-12-01');
insert into grades("id",grade,discipline_id,"date") values (5,6,2,'2024-12-02');
insert into grades("id",grade,discipline_id,"date") values (6,6,3,'2024-12-14');
insert into grades("id",grade,discipline_id,"date") values (7,5,4,'2024-12-16');
insert into grades("id",grade,discipline_id,"date") values (8,4,1,'2024-11-21');
insert into grades("id",grade,discipline_id,"date") values (10,3,2,'2024-11-01');
insert into grades("id",grade,discipline_id,"date") values (11,6,3,'2024-10-18');
insert into grades("id",grade,discipline_id,"date") values (12,5,4,'2024-12-25');
insert into grades("id",grade,discipline_id,"date") values (13,5,3,'2024-12-24');
insert into grades("id",grade,discipline_id,"date") values (14,5,1,'2024-12-28');
insert into grades("id",grade,discipline_id,"date") values (15,4,2,'2024-11-21');
insert into grades("id",grade,discipline_id,"date") values (16,3,3,'2024-09-21');

insert into student_grades(student_id,grade_id) values (2,1);
insert into student_grades(student_id,grade_id) values (2,2);
insert into student_grades(student_id,grade_id) values (2,3);
insert into student_grades(student_id,grade_id) values (1,4);
insert into student_grades(student_id,grade_id) values (1,5);
insert into student_grades(student_id,grade_id) values (3,6);
insert into student_grades(student_id,grade_id) values (3,7);
insert into student_grades(student_id,grade_id) values (3,8);
insert into student_grades(student_id,grade_id) values (4,10);
insert into student_grades(student_id,grade_id) values (4,11);
insert into student_grades(student_id,grade_id) values (5,12);
insert into student_grades(student_id,grade_id) values (5,13);
insert into student_grades(student_id,grade_id) values (6,14);
insert into student_grades(student_id,grade_id) values (7,15);
insert into student_grades(student_id,grade_id) values (7,16);


--Оценки по студент
select
    s.first_name,
    s.last_name,
    s.f_number,
    s.course,
    ss."name",
    d."name",
    d.semestre,
    t.first_name,
    t.last_name,
    tt.title
from students s
join student_grades sg on sg.student_id = s."id"
join grades g on g."id" = sg.grade_id
join disciplines d on d."id" = g.discipline_id
join teachers t on t."id" = d.teacher_id
join titles tt on tt."id" = t.title_id
join specialties ss on ss."id" = s.specialty_id
where s."id" = 1;


--Оценки по дисциплина
select
    s.first_name,
    s.last_name,
    s.f_number,
    s.course,
    ss."name",
    d."name",
    d.semestre,
    t.first_name,
    t.last_name,
    tt.title
from students s
join student_grades sg on sg.student_id = s."id"
join grades g on g."id" = sg.grade_id
join disciplines d on d."id" = g.discipline_id
join teachers t on t."id" = d.teacher_id
join titles tt on tt."id" = t.title_id
join specialties ss on ss."id" = s.specialty_id
where d."id" = 1;


--Среден успех за студент по спеaлност
select
    s.first_name,
    s.last_name,
    s.f_number,
    ss."name",
    avg(g.grade)
from students s
join student_grades sg on sg.student_id = s."id"
join grades g on g."id" = sg.grade_id
join specialties ss on ss."id" = s.specialty_id
where ss."id" = 1
group by s.f_number,s.first_name,s.last_name,ss."name"
order by s.f_number desc;


--Среден успех за студент по курс
select
    s.first_name,
    s.last_name,
    ss."name",
    s.f_number,
    s.course,
    avg(g.grade)
from students s
join student_grades sg on sg.student_id = s."id"
join grades g on g."id" = sg.grade_id
join specialties ss on ss."id" = s.specialty_id
where s.course = 2
group by s.f_number,s.first_name,s.last_name,ss."name",s.course
order by s.f_number desc;

--Среден успех за дисциплина
select
    s.first_name,
    s.f_number,
    s.last_name,
    d."name",
    avg(g.grade)
from students s
join student_grades sg on sg.student_id = s."id"
join grades g on g."id" = sg.grade_id
join disciplines d on d."id" = g.discipline_id
where d."id" = 2
group by s.first_name,s.last_name,s.f_number,d."name",d.semestre
