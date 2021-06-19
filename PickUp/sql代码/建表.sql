create database PickUp;
use PickUp;

create table users--�û���
(
phone varchar(15) primary key,--�ֻ��ţ���11λ�������
psw varchar(20) not null,--���룺����ĸ�����ֻ�_��ɣ�������20���ַ�
othername nvarchar(30) default 'PickUp�û�',--�ǳ� 
pic varchar(200) default '~/img/default_face.jpg',--ͷ��ͼƬ�����·��
signword nvarchar(100) default '���û���������ʱ��û��ǩ��',--����ǩ��
sex nvarchar(2) default '��',--�Ա�
birthday varchar(20) default '1997-1-1',
mb1 varchar(20) not null,--�ܱ�1�������������
mb2 varchar(20) not null--�ܱ�2����İְ�����
)
delete from users where phone='17687473441'
insert into users(phone,psw,mb1,mb2) values(17687473441,123,'��','��');
select * from users
--�޸��û�
update users set othername='Ja',signword='����һ��ǩ��',birthday='2000-2-2',sex='Ů',pic='~/img/pic/icon.png' where phone='17687473441'

update users 
set othername=@othername,signword=@signword,birthday=@birthday,sex=@sex,pic=@pic 
where phone=@phone



create table admin--����Ա��
(
phone varchar(15) primary key,--�ֻ��ţ���11λ�������
psw varchar(20) not null,--���룺����ĸ�����ֻ�_��ɣ�������20���ַ�
)
select * from admin  
insert into admin values('18778713904','123456')
  
create table post--���ӱ�
(
postid int identity(1,1) primary key,--����ID,����
text nvarchar(1000) default '',--��������
sendtime varchar(20) not null,
pd varchar(50) NOT NULL,--����
userid varchar(15) not null,--�ֻ��ţ���11λ�������
imgpath varchar(500),--����·��
foreign key(userid) references users(phone) on delete cascade, /*���� references ������*/
)
insert into post values('���������õ�һ��','2000-9-9','����','17687473441')
select * from post
select postid,userid,pic,othername,sendtime,text,imgpath, pd from post,users where users.phone = post.userid and userid='17687473441' order by sendtime desc
delete from users where phone='17687473441'

create table postimg--����ͼƬ��
(
imgid int identity(1,1) primary key,--ͼƬID,����
postid int not null,
imgpath varchar(500),--����·��
foreign key(postid) references  post(postid) on delete cascade,
)

create table givelike--���ޱ�
(
userid varchar(15) not null,--�ֻ��ţ���11λ�������
postid int not null,--����ID
liketime varchar(20) not null,
primary key(userid,postid), /*�������*/
foreign key(userid) references users(phone), /*���� references ������*/
foreign key(postid) references post(postid) on delete cascade /*���� references ������*/
)
insert into givelike values('17687473441','1','2000-1-1')
select * from givelike

create table comment--���۱�
(
comid int identity(1,1) primary key,
userid varchar(15) not null,--�ֻ��ţ���11λ�������
postid int not null,--����ID
comtext nvarchar(1000)  default '',--��������
comtime varchar(20) not null,
beforeid int ,--����ID
foreign key(userid) references users(phone) on delete cascade, /*���� references ������*/
)

create table letter--˽�ű�
(
letterid int identity(1,1) primary key,
userid varchar(15) not null,--�ֻ��ţ���11λ�������
text nvarchar(1000)  default '',--��������
beforeid varchar(15) not null,--����ID
retime varchar(20) not null,
foreign key(userid) references users(phone) on delete cascade, /*���� references ������*/
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

