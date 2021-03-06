/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2016-8-27 9:26:18                            */
/*==============================================================*/

use fscc;

drop table if exists Activity;

drop table if exists Announcement;

drop table if exists Class;

drop table if exists Comment;

drop table if exists Homework;

drop table if exists Honor;

drop table if exists Leader;

drop table if exists Manager;

drop table if exists Message;

drop table if exists Parent;

drop table if exists Resource;

drop table if exists Resource_Role;

drop table if exists Role;

drop table if exists Score;

drop table if exists Student;

drop table if exists Subject;

drop table if exists Teach;

drop table if exists Teacher;

drop table if exists User;

drop table if exists User_Role;

drop table if exists hold;

/*==============================================================*/
/* Table: Activity                                              */
/*==============================================================*/
create table Activity
(
   Activity_id          int not null,
   Class_id             int,
   Activity_time        datetime,
   Activity_name        varchar(1024),
   Activity_content     varchar(1024),
   primary key (Activity_id)
);

/*==============================================================*/
/* Table: Announcement                                          */
/*==============================================================*/
create table Announcement
(
   Announcement_id      int not null,
   User_id            int,
   Announcement_title   varchar(1024),
   Announcement_content varchar(1024),
   Announcement_time    datetime,
   primary key (Announcement_id)
);


create table Attendance
(
   Attendance_id     int ,
   Student_name            varchar(1024),
   Attendance_content varchar(1024),
   Attendance_time    datetime,
   Student_id   int ,
   primary key (Attendance_id)
);		


/*==============================================================*/
/* Table: Class                                                 */
/*==============================================================*/
create table Class
(
   Class_id             int not null,
   Class_num            varchar(1024),
   Class_location       varchar(1024),
   Grade                varchar(1024),
   primary key (Class_id)
);

/*==============================================================*/
/* Table: Comment                                               */
/*==============================================================*/
create table Comment
(
   Comment_id           int not null,
   Teacher_id           int,
   Student_id           int,
   Message_content      varchar(1024),
   Message_time         datetime,
   primary key (Comment_id)
);

/*==============================================================*/
/* Table: Homework                                              */
/*==============================================================*/
create table Homework
(
   Homework_id          int not null,
   Subject_id           int,
   Class_id             int,
   Homework_content     varchar(1024),
   Homework_time        datetime,
   Homework_submit      varchar(1024),
   primary key (Homework_id)
);

/*==============================================================*/
/* Table: Honor                                                 */
/*==============================================================*/
create table Honor
(
   Honor_id             int not null,
   Student_id           int,
   Honor_content        varchar(1024),
   Honor_time           datetime,
   primary key (Honor_id)
);

/*==============================================================*/
/* Table: Leader                                                */
/*==============================================================*/
create table Leader
(
   Leader_id            int not null,
   Leader_name          varchar(1024),
   Leader_password      varchar(1024),
   primary key (Leader_id)
);

/*==============================================================*/
/* Table: Manager                                               */
/*==============================================================*/
create table Manager
(
   Manager_id           int not null,
   Manager_password     varchar(1024),
   primary key (Manager_id)
);

/*==============================================================*/
/* Table: Message                                               */
/*==============================================================*/
create table Message
(
   Message_id           int not null auto_increment,
   Addresser_name       varchar(1024),
   Addressee_name       varchar(1024),
   Message_title        varchar(1024),
   Message_content      varchar(1024),
   Message_time         datetime,
   primary key (Message_id)
);

/*==============================================================*/
/* Table: Parent                                                */
/*==============================================================*/
create table Parent
(
   Parent_id            int not null,
   Student_id           int,
   Parent_name          varchar(1024),
   Parent_password      varchar(1024),
   primary key (Parent_id)
);

/*==============================================================*/
/* Table: Resource                                              */
/*==============================================================*/
create table Resource
(
   Resource_id          int not null,
   Role_name            varchar(1024),
   Parents              int,
   primary key (Resource_id)
);

/*==============================================================*/
/* Table: Resource_Role                                         */
/*==============================================================*/
create table Resource_Role
(
   Resource_Role_id     int not null,
   Role_id              int,
   Resource_id          int,
   primary key (Resource_Role_id)
);

/*==============================================================*/
/* Table: Role                                                  */
/*==============================================================*/
create table Role
(
   Role_id              int not null,
   Role_name            varchar(1024),
   primary key (Role_id)
);

/*==============================================================*/
/* Table: Score                                                 */
/*==============================================================*/
create table Score
(
   Score_id             int not null,
   Student_id           int,
   Subject_name         varchar(1024),
   Score                float,
   Score_time           datetime,
   primary key (Score_id)
);

/*==============================================================*/
/* Table: Student                                               */
/*==============================================================*/
create table Student
(
   Student_id           int not null,
   Parent_id            int,
   Class_id             int,
   Student_sex          varchar(1024),
   Student_name         varchar(1024),
   Student_password     varchar(1024),
   primary key (Student_id)
);

/*==============================================================*/
/* Table: Subject                                               */
/*==============================================================*/
create table Subject
(
   Subject_id           int not null,
   Teacher_id           int,
   Subject_name         varchar(1024),
   primary key (Subject_id)
);

/*==============================================================*/
/* Table: Teach                                                 */
/*==============================================================*/
create table Teach
(
   Teacher_id           int not null,
   Class_id             int not null,
   Teach_content        varchar(1024),
   Teach_time           datetime,
   primary key (Teacher_id, Class_id)
);

/*==============================================================*/
/* Table: Teacher                                               */
/*==============================================================*/
create table Teacher
(
   Teacher_id           int not null,
   Subject_id           int,
   Teacher_name         varchar(1024),
   Teacher_phone        int,
   Teacher_password     varchar(1024),
   primary key (Teacher_id)
);

/*==============================================================*/
/* Table: User                                                  */
/*==============================================================*/
create table User
(
   User_id              int not null,
   Role_name            varchar(1024),
   User_password        varchar(1024),
   primary key (User_id)
);

/*==============================================================*/
/* Table: User_Role                                             */
/*==============================================================*/
create table User_Role
(
   User_Role_id         int not null,
   User_id              int,
   Role_id              int,
   primary key (User_Role_id)
);

/*==============================================================*/
/* Table: hold                                                  */
/*==============================================================*/
create table hold
(
   Class_id             int not null,
   Activity_id          int not null,
   primary key (Class_id, Activity_id)
);

