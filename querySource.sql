-- 
-- ������ Database / MSSQL ��� ����
-- s201810246
-- ����(�����)����
--

-- ����� ���̺� ����
use ksh -- �ڱ� �̸��� ���̺� ����

-- ���̺� userDB ����(�⺻ �������� �߰�)
create table userDB
(
	name varchar(20) not null, -- �̸�
	gender varchar(1) check(gender in('M', 'W')), -- ����
	age int check((age < 120 and age > 64) and age > 0), -- ����
	temp numeric(3, 1) check(temp < 43.0 and temp > 24.0), -- �µ�
	bpm int check(bpm < 151 and bpm > 19), -- �ɹڼ�
	ID varchar(30), -- ���̵�
	PW varchar(30), -- ��й�ȣ
	admin bit,
	primary key(ID)
)
go
sp_help userDB
-- drop table userDB

-- ���̺� BPMDB ����(�⺻ �������� �߰�)
create table infoDB
(
	name varchar(20) not null, -- �̸�
	temp numeric(3, 1) check(temp < 43.0 and temp > 24.0), -- �µ�
	bpm int check(bpm < 151 and bpm > 19), -- �ɹڼ�
	ID varchar(30), -- ���̵�
	time datetime default getdate(), -- �Է� �ð�
	primary key(ID, time),
)
go
sp_help infoDB
-- drop table infoDB

-- userDB ���̺� ���� ������ �������� ����
-- alter table userDB add constraint df_nameC check(name is not null)
-- alter table userDB add constraint df_genderC check(gender in('M', 'W'))
alter table userDB add constraint df_genderD default 'M' for gender
-- alter table userDB add constraint df_ageC check((age < 120 and age > 64) and age > 0)
-- alter table userDB add constraint df_tempC check(temp < 43.0 and temp > 24.0)
alter table userDB add constraint df_tempD default 36.5 for temp
-- alter table df_bpmC add constraint bpm check(bpm < 151 and bpm > 19)
alter table userDB add constraint df_bpmD default 70 for bpm
-- alter table df_bpmC add constraint bpm check(bpm in(0, 1))
alter table userDB add constraint df_adminD default 0 for admin
-- alter table userDB drop primary key
-- alter table userDB modify ID varchar(30) not null primary key

-- userDB ������ ��Ŭ�����͵� �ε��� ����(�� Ű ID�� ���� ��.)
create nonclustered index uidn on userDB(ID)
go
sp_helpindex userDB
-- drop index uidn

-- userDB ������ ��Ŭ�����͵� �ε��� ����(�� Ű ID�� ���� ��.)
create nonclustered index iidn on infoDB(ID)
go
sp_helpindex infoDB
-- drop index iidn

-- �����ͺ��̽� ���� Ʈ���� ����
create trigger tri_insert on userDB
	instead of insert
	as
	if not exists(select name from inserted where ID = null)
		begin
			insert userDB select name, gender, age, temp, bpm, ID, PW, admin from inserted
			insert infoDB(name, temp, bpm, ID) select inserted.name, inserted.temp, inserted.bpm, inserted.ID from inserted
		end
	else if not exists(select name from inserted where temp = null or bpm = null)
		begin
			insert userDB select name, gender, age, '36.5', '70', ID, PW, admin from inserted
			insert infoDB(name, temp, bpm, ID) select inserted.name, '36.5', '70', inserted.ID from inserted
		end
go
-- drop trigger tri_insert

-- �����ͺ��̽� ���� Ʈ���� ����
create trigger tri_update on userDB
	for update
	as
	if not exists(select name from inserted where name = null or temp = null or bpm = null or ID = null)
		begin
			insert infoDB(name, temp, bpm, ID) select inserted.name, inserted.temp, inserted.bpm, inserted.ID from inserted
		end
go
-- drop trigger tri_update

-- ������ ����
insert into userDB values('����ȣ', 'M', 65, 35.5, 78, 'roh', '123456', 0)
insert into userDB values('�輼��', 'M', 65, 36.5, 75, 'ksh', '123456', 1)
insert into userDB values('������', 'M', 65, 36.7, 80, 'csb', '123456', 0)
insert into userDB values('������', 'M', 65, 36.7, 80, 'hjh', '123456', 0)

-- ������ ����
update userDB set temp = 36.0, bpm = 70 where ID = 'roh'
update userDB set temp = 36.0, bpm = 70 where ID = 'ksh'
update userDB set temp = 36.0, bpm = 70 where ID = 'csb'
update userDB set temp = 36.0, bpm = 70 where ID = 'hjh'

-- ������ ����
delete from userDB
delete from infoDB

-- ������ Ȯ��
select * from userDB
select * from infoDB