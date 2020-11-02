select * from [Member] with(index(PK_Member)) where LoginName =　'HunterGreen45744363’
------------------------------------------
select * from [Member] where LoginName =　'HunterGreen45744363'
------------------------------------------
ALTER TABLE [dbo].[Member] ADD  CONSTRAINT [PK_Member] PRIMARY KEY CLUSTERED 
(
[MemberID] ASC
)
------------------------------------------
select * from Member where MemberID = 18629768
------------------------------------------
select * from Member where LoginName = 'Janita1317'
------------------------------------------
select * from Member where MemberID = 18629768
------------------------------------------
select * from Member where LoginName = 'Janita1317'
------------------------------------------
DECLARE @DB_ID int, @Object_ID int
set @DB_ID = DB_ID('MyTuningDB_small')
set @Object_ID = OBJECT_ID('Member')

SELECT
name, index_id, index_type_desc, index_depth, index_level, page_count, record_count, avg_fragmentation_in_percent as 断片化率
FROM sys.dm_db_index_physical_stats (@DB_ID, @Object_ID, NULL , NULL, 'DETAILED') as A
JOIN sys.objects as B  with(nolock) on A.object_id = B.object_id
ORDER BY index_id, index_level desc
------------------------------------------
ALTER TABLE [dbo].[Member] ADD  CONSTRAINT [PK_Member] PRIMARY KEY CLUSTERED 
(
[MemberID] ASC
)
------------------------------------------
select * from Member where MemberID = 18629768
select * from Member where LoginName = 'Janita1317'
------------------------------------------
select * from Member where LoginName = 'Janita1317'
------------------------------------------
CREATE NONCLUSTERED INDEX [IX_Member_LoginName] ON [dbo].[Member]
(
[LoginName] ASC
)
------------------------------------------
CREATE NONCLUSTERED INDEX [IX_Member_LoginName] ON [dbo].[Member]
(
[LoginName] ASC
) INCLUDE (RegistDate)
------------------------------------------
CREATE NONCLUSTERED INDEX [IX_Member_Sei_PrefectureID] ON [dbo].[Member]
(
[Sei] ASC,
[PrefectureID] ASC
)
------------------------------------------
SELECT COUNT(*) FROM Member WHERE Sei = 'Adena' AND PrefectureID = 1
SELECT COUNT(*) FROM Member WHERE Sei = 'Adena'
SELECT COUNT(*) FROM Member WHERE PrefectureID = 1
------------------------------------------
SELECT LoginName, RegistDate, Sei FROM Member WHERE LoginName = 'b1'
------------------------------------------
CREATE NONCLUSTERED INDEX [IX_Member_LoginName] ON [dbo].[Member]
([LoginName] ASC) INCLUDE (RegistDate)
------------------------------------------
SELECT LoginName, RegistDate FROM Member WHERE LoginName = 'Tawny265167'
------------------------------------------
CREATE NONCLUSTERED INDEX [IX_Member_LoginName] ON [dbo].[Member]
([LoginName] ASC) INCLUDE (RegistDate)
------------------------------------------
SELECT LoginName, RegistDate FROM Member WHERE LoginName = 'Tawny265167'
------------------------------------------
SELECT LoginName, RegistDate, Sei FROM Member WHERE LoginName = 'Tawny265167'
------------------------------------------
DECLARE @Tel VARCHAR(20)
SET @Tel = '0292866656'

SELECT MemberID
FROM Member
WHERE tel = @Tel
------------------------------------------
CREATE NONCLUSTERED INDEX [IX_Member_Tel]
ON [dbo].[Member] ([Tel])
------------------------------------------
DECLARE @LoginName VARCHAR(20)
SET @LoginName = 'Keg River4714'

SELECT MemberID
,GenderID
,PrefectureID
FROM Member
WHERE LoginName = @LoginName
------------------------------------------
CREATE NONCLUSTERED INDEX [IX_Memer_LoginName]
ON [dbo].[Member] ([LoginName])
------------------------------------------
CREATE NONCLUSTERED INDEX [IX_Memer_LoginName]
ON [dbo].[Member] ([LoginName]) INCLUDE ([GenderID], [PrefectureID])
------------------------------------------
use MyTuningDB_small
alter index PK_MemberEMail on MemberEMail rebuild
go

use MyTuningDB_middle
alter index PK_MemberEMail on MemberEMail rebuild
go

use MyTuningDB_large
alter index PK_MemberEMail on MemberEMail rebuild
go
------------------------------------------
DECLARE @OBJECT_ID int
set @OBJECT_ID = OBJECT_ID('MemberEMail')

SELECT
index_id
,index_type_desc
,index_depth
,index_level
,page_count
,record_count
FROM sys.dm_db_index_physical_stats (DB_ID(), @OBJECT_ID, NULL , NULL, 'DETAILED') as A
JOIN sys.objects as B on A.object_id = B.object_id
ORDER BY index_id, index_level
------------------------------------------
SELECT TOP 10 *
FROM MemberEMail
ORDER BY Email ASC
------------------------------------------
create index [IX_MemberEMail_Email] on [MemberEmail] ([Email] asc)
------------------------------------------
SELECT TOP 10 *
FROM MemberEMail
ORDER BY DeleteFlag ASC
,Email DESC
------------------------------------------
create index [IX_MemberEMail_DeleteFlag_Email] on
[MemberEmail] ([DeleteFlag] asc, [EMail] desc)
------------------------------------------
SELECT TOP 10 *
FROM MemberEMail
WHERE DeleteFlag = 0
ORDER BY EMail DESC
------------------------------------------
create index [IX_MemberEMail_DeleteFlag_Email]
on [MemberEmail]([DeleteFlag], [EMail])
------------------------------------------
update statistics member with fullscan
------------------------------------------
update statistics member
------------------------------------------
select *
from Member
where DeleteFlag = 0
and PrefectureID = 6
and GenderID = 2
and Sei = 'Marlin' 
------------------------------------------
create index IX_Member_1 on Member (DeleteFlag, PrefectureID, GenderID, Sei)
------------------------------------------
select A.MemberID
from Member A
join MemberEMail B on A.MemberID = B.MemberID
where A.DeleteFlag = 0 and A.Tel = '0698903494'
and B.MainFlag = 1
------------------------------------------
select MemberID
from Member
where DeleteFlag = 0
and Tel = '0698903494'
------------------------------------------
select MemberID
from MemberEMail
where MemberID = 18629764
and MainFlag = 1
------------------------------------------
select A.MemberID
from Member A
join MemberEMail B on A.MemberID = B.MemberID
where A.DeleteFlag = 0 and A.Tel = '0698903494'
and B.MainFlag = 1
------------------------------------------
select *
from Member A
join MemberEMail B on A.MemberID = B.MemberID
where A.PrefectureID = 1 and A.DeleteFlag = 0 and A.Sei like 'a%'
and B.MainFlag = 1
------------------------------------------
DECLARE @MemberID INT
SET @MemberID = 18629764

SELECT *
FROM Member a
JOIN MemberEMail b ON a.MemberID = b.MemberID
WHERE a.MemberID = @MemberID
ORDER BY MainFlag DESC
------------------------------------------
CREATE NONCLUSTERED INDEX [IX_MemberEmail_MemberID]
ON [dbo].[MemberEMail] ([MemberID])
------------------------------------------
DECLARE @Tel VARCHAR(100)
SET @Tel = '09002505878'

SELECT LoginName, Sei, Mei, Tel
FROM Member a
WHERE EXISTS (
    SELECT *
    FROM MemberEMail b
    WHERE a.MemberID = b.MemberID
    AND MainFlag = 1
    AND b.DeleteFlag = 0
)
AND Tel = @Tel
------------------------------------------
CREATE NONCLUSTERED INDEX [IX_Member_Tel]
ON [dbo].[Member] ([Tel])
------------------------------------------
CREATE NONCLUSTERED INDEX [IX_MemberEMail_MemberID]
ON [dbo].[MemberEMail] ([MemberID]) INCLUDE ([MainFlag], [DeleteFlag])
------------------------------------------
select * from Member where PrefectureID = 1
select * from Member where PrefectureID = 2
select * from Member where PrefectureID = 3
select * from Member where PrefectureID = 4
select * from Member where PrefectureID = 5
select * from Member where PrefectureID = 6
------------------------------------------
declare @PrefID int = 1
select top 10 * from Member where PrefectureID = @PrefID
------------------------------------------
declare @PrefID int = 2
select top 10 * from Member where PrefectureID = @PrefID
------------------------------------------
CREATE NONCLUSTERED INDEX [IX_Member_LoginName] ON [dbo].[Member]
(
[LoginName] ASC
) INCLUDE (RegistDate)
------------------------------------------
CREATE NONCLUSTERED INDEX [IX_Member_LoginName3] ON [dbo].[Member]
(
[LoginName] ASC, [RegistDate] ASC
) INCLUDE (Sei, Mei)
------------------------------------------
CREATE NONCLUSTERED INDEX [IX_Member_LoginName2] ON [dbo].[Member]
(
[LoginName] ASC
) INCLUDE (Sei, Mei)
------------------------------------------
CREATE NONCLUSTERED INDEX [IX_Member_LoginName4] ON [dbo].[Member]
(
[LoginName] ASC
) INCLUDE (Delete Flag)
------------------------------------------
declare @TableName varchar(1000) = 'Member'

select
  OBJECT_NAME(i.object_id) as table_name
  ,i.name as index_name
  ,ps.row_count as row_count
  ,ps.reserved_page_count * 8.0 / 1024 as size_mb
  ,type_desc
  ,us.*
from
  sys.dm_db_partition_stats ps
left join sys.indexes i
    on ps.object_id = i.object_id and ps.index_id = i.index_id
left join sys.dm_db_index_usage_stats us 
    on ps.object_id = us.object_id and ps.index_id = us.index_id
where
  OBJECT_NAME(i.object_id) = @TableName
order by
  index_id
------------------------------------------
select Sei, Mei from Member where LoginName = 'Test'
------------------------------------------
CREATE NONCLUSTERED INDEX [IX_Member_LoginName] ON [dbo].[Member] ([LoginName])
INCLUDE ([Sei], [Mei])

CREATE NONCLUSTERED INDEX [IX_Member_LoginName] ON [dbo].[Member] ([LoginName], [Sei], [Mei])
------------------------------------------
select top 10 Sei, Mei from Member where LoginName like 'Te%' order by RegistDate
------------------------------------------
CREATE NONCLUSTERED INDEX [IX_Member_LoginName] ON [dbo].[Member] ([LoginName])
INCLUDE ([Sei], [Mei])
------------------------------------------
CREATE NONCLUSTERED INDEX [IX_Member_LoginName] ON [dbo].[Member] ([LoginName], [DeleteFlag])
INCLUDE ([Sei], [Mei])
------------------------------------------
CREATE NONCLUSTERED INDEX [IX_Member_LoginName] ON [dbo].[Member] ([LoginName], [DeleteFlag])
INCLUDE ([Sei], [Mei])
------------------------------------------
select Sei, Mei from Member where LoginName = 'Test'
------------------------------------------
select Sei, Mei from Member where LoginName like 'Ten%' and DeleteFlag = 1
------------------------------------------
CREATE NONCLUSTERED INDEX [IX_Member_LoginName] ON [dbo].[Member] ([LoginName], [Sei], [Mei])
------------------------------------------
CREATE NONCLUSTERED INDEX [IX_Member_LoginName] ON [dbo].[Member] ([LoginName], [DeleteFlag], [Sei], [Mei])
------------------------------------------
CREATE NONCLUSTERED INDEX [IX_Member_LoginName] ON [dbo].[Member] ([LoginName], [Sei], [Mei])
------------------------------------------
select * from Member where LoginName = 'Test' and Sei = 'aaa' and Mei = 'bbb'
------------------------------------------
CREATE NONCLUSTERED INDEX [IX_Member_LoginName] ON [dbo].[Member] ([LoginName], [Sei], [Mei])
------------------------------------------
CREATE NONCLUSTERED INDEX [IX_Member_LoginName2] ON [dbo].[Member] ([LoginName], [DeleteFlag], [Sei], [Mei])
------------------------------------------
select LoginName from Member group by LoginName having count(*) > 1
------------------------------------------
select Sei, Mei from Member where LoginName = 'Test' and DeleteFlag = 1
------------------------------------------
CREATE NONCLUSTERED INDEX [IX_Member_LoginName] ON [dbo].[Member] ([LoginName])
INCLUDE ([Sei], [Mei], [DeleteFlag])
------------------------------------------
--①
CREATE INDEX [IX_Member_Tel] ON [Member] ([tel]) INCLUDE ([RegistDate])
--②
CREATE INDEX [IX_Member_LoginName] ON [Member] ([LoginName]) INCLUDE ([Sei], [Mei])
--③
CREATE INDEX [IX_Member_LoginName2] ON [Member] ([LoginName]) 
INCLUDE ([GenderID], [PrefectureID])
--④
CREATE INDEX [IX_Member_DeleteFlag_RegistDate] ON [Member] ([DeleteFlag], [RegistDate])
--⑤
CREATE INDEX [IX_Member_LoginName_HashedPassword] ON [Member] ([LoginName], [HashedPassword]) INCLUDE ([DeleteFlag])
--⑥
CREATE INDEX [IX_Member_Tel_DeleteFlag] ON [Member] ([tel], [DeleteFlag])
------------------------------------------
--① + ⑥
CREATE INDEX [IX_Member_Tel_DeleteFlag] ON [Member] ([tel], [DeleteFlag])
INCLUDE ([RegistDate])
--② + ③ + ⑤
CREATE INDEX [IX_Member_LoginName] ON [Member] ([LoginName], [HashedPassword])
INCLUDE ([Sei], [Mei], [GenderID], [PrefectureID], [DeleteFlag])
--④
CREATE INDEX [IX_Member_DeleteFlag_RegistDate] ON [Member] ([DeleteFlag], [RegistDate])
------------------------------------------
