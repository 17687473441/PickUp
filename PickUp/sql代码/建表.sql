create database PickUp;
use PickUp;

create table users--用户表
(
phone varchar(15) primary key,--手机号：由11位数字组成
psw varchar(20) not null,--密码：由字母、数字或_组成，不超过20个字符
othername nvarchar(30) default 'PickUp用户',--昵称 
pic varchar(200) default '~/img/default_face.jpg',--头像：图片的相对路径
signword nvarchar(100) default '该用户很懒，暂时还没有签名',--个性签名
sex nvarchar(2) default '男',--性别
birthday varchar(20) default '1997-1-1',
mb1 varchar(20) not null,--密保1：你的妈妈名字
mb2 varchar(20) not null--密保2：你的爸爸名字
)
delete from users where phone='17687473441'
insert into users(phone,psw,mb1,mb2) values(17687473441,123,'妈','爸');
select * from users
--修改用户
update users set othername='Ja',signword='我是一个签名',birthday='2000-2-2',sex='女',pic='~/img/pic/icon.png' where phone='17687473441'

update users 
set othername=@othername,signword=@signword,birthday=@birthday,sex=@sex,pic=@pic 
where phone=@phone



create table admin--管理员表
(
phone varchar(15) primary key,--手机号：由11位数字组成
psw varchar(20) not null,--密码：由字母、数字或_组成，不超过20个字符
)
select * from admin  
insert into admin values('18778713904','123456')
  
create table post--帖子表
(
postid int identity(1,1) primary key,--帖子ID,自增
text nvarchar(1000) default '',--文字内容
sendtime varchar(20) not null,
pd varchar(50) NOT NULL,--分类
userid varchar(15) not null,--手机号：由11位数字组成
imgpath varchar(500),--保存路径
foreign key(userid) references users(phone) on delete cascade, /*参照 references 不可少*/
)
insert into post values('今天是美好的一天','2000-9-9','军事','17687473441')
select * from post
select postid,userid,pic,othername,sendtime,text,imgpath, pd from post,users where users.phone = post.userid and userid='17687473441' order by sendtime desc
delete from users where phone='17687473441'

create table postimg--帖子图片表
(
imgid int identity(1,1) primary key,--图片ID,自增
postid int not null,
imgpath varchar(500),--保存路径
foreign key(postid) references  post(postid) on delete cascade,
)

create table givelike--点赞表
(
userid varchar(15) not null,--手机号：由11位数字组成
postid int not null,--帖子ID
liketime varchar(20) not null,
primary key(userid,postid), /*组合主键*/
foreign key(userid) references users(phone), /*参照 references 不可少*/
foreign key(postid) references post(postid) on delete cascade /*参照 references 不可少*/
)
insert into givelike values('17687473441','1','2000-1-1')
select * from givelike

create table comment--评论表
(
comid int identity(1,1) primary key,
userid varchar(15) not null,--手机号：由11位数字组成
postid int not null,--帖子ID
comtext nvarchar(1000)  default '',--文字内容
comtime varchar(20) not null,
beforeid int ,--帖子ID
foreign key(userid) references users(phone) on delete cascade, /*参照 references 不可少*/
)

create table letter--私信表
(
letterid int identity(1,1) primary key,
userid varchar(15) not null,--手机号：由11位数字组成
text nvarchar(1000)  default '',--文字内容
beforeid varchar(15) not null,--帖子ID
retime varchar(20) not null,
foreign key(userid) references users(phone) on delete cascade, /*参照 references 不可少*/
)

-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE pro_POSTDetail 
	-- Add the parameters for the stored procedure here
	@postid int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select postid,userid,pic,othername,sendtime,text,imgpath, pd from post,users where users.phone = post.userid and postid=@postid;
	select comment.*,users.pic,users.othername from comment,users where users.phone = comment.userid and (beforeid is null and postid = @postid) order by comtime desc;
END
GO

