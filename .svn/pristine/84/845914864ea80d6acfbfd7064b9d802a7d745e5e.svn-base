/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2016/8/25 8:12:49                            */
/*==============================================================*/


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
   activity_id          int not null,
   activity_time        datetime,
   activity_content     varchar(1024),
   primary key (activity_id)
);

/*==============================================================*/
/* Table: Announcement                                          */
/*==============================================================*/
create table Announcement
(
   Announcement_id      int not null,
   leader_id            int,
   Announcement_content varchar(1024),
   Announcement_time    datetime,
   primary key (Announcement_id)
);

/*==============================================================*/
/* Table: Class                                                 */
/*==============================================================*/
create table Class
(
   class_id             int not null,
   class_num            varchar(1024),
   class_location       varchar(1024),
   grade                varchar(1024),
   primary key (class_id)
);

/*==============================================================*/
/* Table: Comment                                               */
/*==============================================================*/
create table Comment
(
   comment_id           int not null,
   teacher_id           int,
   student_id           int,
   Message_content      varchar(1024),
   Message_time         datetime,
   primary key (comment_id)
);

/*==============================================================*/
/* Table: Homework                                              */
/*==============================================================*/
create table Homework
(
   homework_id          int not null,
   subject_id           int,
   class_id             int,
   homework_content     varchar(1024),
   homework_time        datetime,
   homework_submit      varchar(1024),
   primary key (homework_id)
);

/*==============================================================*/
/* Table: Honor                                                 */
/*==============================================================*/
create table Honor
(
   honor_id             int not null,
   student_id           int,
   honor_content        varchar(1024),
   honor_time           datetime,
   primary key (honor_id)
);

/*==============================================================*/
/* Table: Leader                                                */
/*==============================================================*/
create table Leader
(
   leader_id            int not null,
   leader_name          varchar(1024),
   Manager_password     varchar(1024),
   primary key (leader_id)
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
   comment_id2          int not null,
   parent_id            int,
   teacher_id           int,
   Message_content      varchar(1024),
   Message_time         datetime,
   primary key (comment_id2)
);

/*==============================================================*/
/* Table: Parent                                                */
/*==============================================================*/
create table Parent
(
   parent_id            int not null,
   student_id           int,
   parent_name          varchar(1024),
   parent_password      varchar(1024),
   primary key (parent_id)
);

/*==============================================================*/
/* Table: Resource                                              */
/*==============================================================*/
create table Resource
(
   Resource_id          int not null,
   Resource_name        varchar(1024),
   parents              int,
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
   Resource_name        varchar(1024),
   primary key (Role_id)
);

/*==============================================================*/
/* Table: Score                                                 */
/*==============================================================*/
create table Score
(
   score_id             int not null,
   student_id           int,
   subject_id           int,
   score                float,
   score_time           datetime,
   primary key (score_id)
);

/*==============================================================*/
/* Table: Student                                               */
/*==============================================================*/
create table Student
(
   student_id           int not null,
   parent_id            int,
   class_id             int,
   student_sex          varchar(1024),
   student_name         varchar(1024),
   student_password     varchar(1024),
   primary key (student_id)
);

/*==============================================================*/
/* Table: Subject                                               */
/*==============================================================*/
create table Subject
(
   subject_id           int not null,
   teacher_id           int,
   subject_name         varchar(1024),
   primary key (subject_id)
);

/*==============================================================*/
/* Table: Teach                                                 */
/*==============================================================*/
create table Teach
(
   teacher_id           int not null,
   class_id             int not null,
   teach_content        varchar(1024),
   teach_time           datetime,
   primary key (teacher_id, class_id)
);

/*==============================================================*/
/* Table: Teacher                                               */
/*==============================================================*/
create table Teacher
(
   teacher_id           int not null,
   subject_id           int,
   teacher_name         varchar(1024),
   teacher_phone        int,
   teacher_password     varchar(1024),
   primary key (teacher_id)
);

/*==============================================================*/
/* Table: User                                                  */
/*==============================================================*/
create table User
(
   User_id              int not null,
   User_name            varchar(1024),
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
   class_id             int not null,
   activity_id          int not null,
   primary key (class_id, activity_id)
);

alter table Announcement add constraint FK_Relationship_15 foreign key (leader_id)
      references Leader (leader_id) on delete restrict on update restrict;

alter table Comment add constraint FK_check2 foreign key (student_id)
      references Student (student_id) on delete restrict on update restrict;

alter table Comment add constraint FK_write foreign key (teacher_id)
      references Teacher (teacher_id) on delete restrict on update restrict;

alter table Homework add constraint FK_have foreign key (subject_id)
      references Subject (subject_id) on delete restrict on update restrict;

alter table Homework add constraint FK_own1 foreign key (class_id)
      references Class (class_id) on delete restrict on update restrict;

alter table Honor add constraint FK_own foreign key (student_id)
      references Student (student_id) on delete restrict on update restrict;

alter table Message add constraint FK_Relationship_21 foreign key (teacher_id)
      references Teacher (teacher_id) on delete restrict on update restrict;

alter table Message add constraint FK_have1 foreign key (parent_id)
      references Parent (parent_id) on delete restrict on update restrict;

alter table Parent add constraint FK_has2 foreign key (student_id)
      references Student (student_id) on delete restrict on update restrict;

alter table Resource_Role add constraint FK_Relationship_18 foreign key (Resource_id)
      references Resource (Resource_id) on delete restrict on update restrict;

alter table Resource_Role add constraint FK_Relationship_19 foreign key (Role_id)
      references Role (Role_id) on delete restrict on update restrict;

alter table Score add constraint FK_mark foreign key (subject_id)
      references Subject (subject_id) on delete restrict on update restrict;

alter table Score add constraint FK_obtain foreign key (student_id)
      references Student (student_id) on delete restrict on update restrict;

alter table Student add constraint FK_has foreign key (parent_id)
      references Parent (parent_id) on delete restrict on update restrict;

alter table Student add constraint FK_study foreign key (class_id)
      references Class (class_id) on delete restrict on update restrict;

alter table Subject add constraint FK_course2 foreign key (teacher_id)
      references Teacher (teacher_id) on delete restrict on update restrict;

alter table Teach add constraint FK_Teach foreign key (teacher_id)
      references Teacher (teacher_id) on delete restrict on update restrict;

alter table Teach add constraint FK_Teach2 foreign key (class_id)
      references Class (class_id) on delete restrict on update restrict;

alter table Teacher add constraint FK_course foreign key (subject_id)
      references Subject (subject_id) on delete restrict on update restrict;

alter table User_Role add constraint FK_Relationship_16 foreign key (User_id)
      references User (User_id) on delete restrict on update restrict;

alter table User_Role add constraint FK_Relationship_20 foreign key (Role_id)
      references Role (Role_id) on delete restrict on update restrict;

alter table hold add constraint FK_hold foreign key (class_id)
      references Class (class_id) on delete restrict on update restrict;

alter table hold add constraint FK_hold2 foreign key (activity_id)
      references Activity (activity_id) on delete restrict on update restrict;

