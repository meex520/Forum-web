-- Create sequence 
create sequence USER_SEQ
minvalue 1
maxvalue 999999999999
start with 1000
increment by 1
cache 20;


--吧表
-- Create table
create table BAR_TABLE
(
  NAME        VARCHAR2(64) not null,
  ID          NUMBER not null,
  INSERTTIME  DATE not null,
  UPDATETIME  DATE not null,
  USERID      NUMBER not null,
  POSTID      NUMBER,
  INSTRUCTION VARCHAR2(2048)
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate primary, unique and foreign key constraints 
alter table BAR_TABLE
  add constraint BAR_PRIMARYKEY primary key (ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table BAR_TABLE
  add constraint CREAT_USER foreign key (USERID)
  references USER_TABLE (USERID);
  
--评论表  
  -- Create table
create table COMMENT_TABLE
(
  NAME       VARCHAR2(64) not null,
  ID         NUMBER not null,
  INSERTTIME DATE not null,
  UPDATETIME DATE not null,
  USERID     NUMBER not null,
  USERNAME   VARCHAR2(64) not null,
  PARENT_ID  NUMBER
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate primary, unique and foreign key constraints 
alter table COMMENT_TABLE
  add constraint COMMENT_PRIMARYKEY primary key (ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table COMMENT_TABLE
  add constraint COMMENT_PARENTID foreign key (PARENT_ID)
  references FLOOR_TABLE (ID);
alter table COMMENT_TABLE
  add constraint COMMENT_USERID foreign key (USERID)
  references USER_TABLE (USERID);
  
--楼层表
-- Create table
create table FLOOR_TABLE
(
  NAME       VARCHAR2(64) not null,
  ID         NUMBER not null,
  USERID     NUMBER not null,
  USERNAME   VARCHAR2(64) not null,
  INSERTTIME DATE not null,
  UPDATETIME DATE not null,
  POST_ID    NUMBER not null,
  CONTENT    VARCHAR2(2048)
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate primary, unique and foreign key constraints 
alter table FLOOR_TABLE
  add constraint FLOOR_PRIMARYKEY primary key (ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table FLOOR_TABLE
  add constraint FLOOR_POSTID foreign key (POST_ID)
  references POST_TABLE (ID);
alter table FLOOR_TABLE
  add constraint FLOOR_USERID foreign key (USERID)
  references USER_TABLE (USERID);

--帖子表
-- Create table
create table POST_TABLE
(
  NAME       VARCHAR2(64) not null,
  ID         NUMBER not null,
  THEME      VARCHAR2(256),
  USERID     NUMBER not null,
  USERNAME   VARCHAR2(64) not null,
  INSERTTIME DATE not null,
  UPDATETIME DATE not null,
  BAR_ID     NUMBER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate primary, unique and foreign key constraints 
alter table POST_TABLE
  add constraint POST_PRIMARYKEY primary key (ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table POST_TABLE
  add constraint POST_BAR foreign key (BAR_ID)
  references BAR_TABLE (ID);
alter table POST_TABLE
  add constraint POST_USERID foreign key (USERID)
  references USER_TABLE (USERID);


--用户表
-- Create table
create table USER_TABLE
(
  USERNAME     VARCHAR2(64) not null,
  USERID       NUMBER not null,
  INSERTTIME   DATE not null,
  AGE          NUMBER,
  SEX          CHAR(1),
  INTRODUCTION VARCHAR2(1024),
  STATUS       CHAR(1),
  UPDATETIME   DATE not null,
  EMAIL        VARCHAR2(32),
  QQ           NUMBER,
  PHONE        NUMBER,
  PASSWORD     VARCHAR2(20),
  BIRTH        DATE
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate primary, unique and foreign key constraints 
alter table USER_TABLE
  add constraint PRIMARYKEY primary key (USERID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );  