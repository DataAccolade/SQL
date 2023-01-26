----- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
----- FrmWrk: Nik - Shahriar Nikkhah               Date: 2022-09-21	Time: 23:04
----- Author: Enzo - Parsa Bahrami                 Date: 2023-01-18	Time: 21:52
----- 
----- Input :
----- 
----- Output :
----- 
----- Description : 
----- 
----- Benchmark : 
----- 
----- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
----- Revision History : For the next section please add : Your name , Date , what was modified or added.
----- 					 Add reference number or reference an emails subject.
----- 
----- 
----- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
-----   This script is intended only as a supplement to demos and lectures
-----   given by "Nik - Shahriar Nikkhah" and/or "Enzo - Parsa Bahrami"
-----   
-----   THIS CODE AND INFORMATION ARE PROVIDED "AS IS" WITHOUT WARRANTY OF 
-----   ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED 
-----   TO THE IMPLIED WARRANTIES OF MERCHANTABILITY, NON-INFRINGMENT AND/OR FITNESS FOR A
-----   PARTICULAR PURPOSE.
----- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
--USE [test]
--GO
--;

-------************************************************************************************  
----- Primary Tests/Evaluation
-------************************************************************************************  
/*
EXEC sp_SpaceUsed '[Fwk].[Framework]'
SELECT TOP 100 * FROM [Fwk].[Framework]

SELECT * FROM INFORMATION_SCHEMA.TABLES  WHERE [TABLE_SCHEMA] = 'Fwk' AND [TABLE_NAME] = 'Framework';
SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = 'Framework' ORDER BY ORDINAL_POSITION;
SELECT * FROM sys.objects WHERE [is_ms_shipped] <> 1 AND type = 'U' 
SELECT [FullName]	=	CONCAT('[' , object_schema_name([object_id]) , '].[' , OBJECT_NAME([object_id]) , ']') , * FROM sys.columns WHERE  OBJECTPROPERTY([Object_id] , 'IsUserTable') = 1 AND OBJECT_NAME([object_id]) = 'Framework'ORDER BY [FullName] , [column_id] 

T--RUNCATE TABLE [Fwk].[Framework]
D--ELETE TABLE [Fwk].[Framework] WHERE [] = ''
*/


-------************************************************************************************  
----- Cleanup
-------************************************************************************************  
--IF OBJECT_ID ('[Fwk].[Framework]') IS NOT NULL AND 2 = 2 --( 2=2 is a Safety net)
--	DROP TABLE [Fwk].[Framework]
--GO
--;

-------************************************************************************************  
----- Extra Settings
-------************************************************************************************  
--SET ANSI_NULLS ON;
--GO
--;

--SET QUOTED_IDENTIFIER ON;
--GO
--;


-----************************************************************************************  
----- Create object (Table/View/uSP/...)
-----************************************************************************************  
CREATE TABLE [Fwk].[Framework]
(
	---------------------------------------------------------------------
	--- Internal fields
	---------------------------------------------------------------------
		[idf_FrameworkKey]		bigint			NOT NULL    identity(1,1)	
	--,	[idf_GroupRun]			smallint			NULL	CONSTRAINT [DF__Fwk__Framework__idf_GroupRun] DEFAULT (1)
	--,	[idf_SequanceGroupRun]	smallint			NULL	CONSTRAINT [DF__Fwk__Framework__idf_SequanceGroupRun] DEFAULT (1)
    ---------------------------------------------------------------------
	--- Main Business Data Fields
	---------------------------------------------------------------------
	--,	[NKKeyField1]			DateTime		NOT NULL	--- Natural Key (NK) (Business Key) it's a composite key with the next field
	,	[NKKeyField2]			int				NOT NULL	--- Natural Key (NK) (Business Key) it's a composite key with the previous field

    ,   [BizField1]				int				NOT NULL
    ,   [BizField2]				nvarchar(100)		NULL    DEFAULT ('')
    ,   [BizField3] 			varchar(100)		NULL
	,	[BizField4]				numeric(16,4)		NULL	CONSTRAINT [DF__Fwk__Framework__BizField4] DEFAULT (0)


    ---------------------------------------------------------------------
	--- More internal fields
	---------------------------------------------------------------------
	,	[idf_Source]			varchar(100)    NOT NULL CONSTRAINT [DF__Fwk__Framework__idf_Source]		DEFAULT ('')
	,	[idf_ModifiedDate]		Datetime		NOT NULL CONSTRAINT [DF__Fwk__Framework__idf_ModifiedDate]	DEFAULT (getdate())
);
GO
;

-----************************************************************************************  
----- Object Description (Table/View/SP/Trigger/Function/...)
-----************************************************************************************  
EXEC sys.sp_addextendedproperty
	@name = N'MS_Description'	,	@Value		=	N'This is the [Fwk].[Framework] Table.'
,	@Level0Type=N'SCHEMA'		,	@level0name	=	N'Fwk'
,	@Level1Type=N'TABLE'		,	@level1name	=	N'Framework'
GO
 

-----************************************************************************************  
----- Field Description
-----************************************************************************************  
EXEC sys.sp_addextendedproperty
	@name = N'MS_Description'	,	@Value		=	N'This is the SurrogateKey Field [idf_FrameworkKey].'
,	@Level0Type=N'SCHEMA'		,	@level0name	=	N'Fwk'
,	@Level1Type=N'TABLE'		,	@level1name	=	N'Framework'
,	@Level2Type=N'COLUMN'		,	@level2name	=	N'idf_FrameworkKey'
GO

-----************************************************************************************  
----- CREATE CLUSTER PRIMARY KEY
-----************************************************************************************  
--- SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS ORDER BY TABLE_CATALOG , TABLE_SCHEMA , TABLE_NAME , CONSTRAINT_TYPE DESC;
--- SELECT * FROM INFORMATION_SCHEMA.CONSTRAINT_COLUMN_USAGE

--- A--LTER TABLE [Fwk].[Framework] DROP CONSTRAINT [CPK__Fwk__Framework__idf_FrameworkKey]
ALTER TABLE [Fwk].[Framework] 
ADD CONSTRAINT [CPK__Fwk__Framework__idf_FrameworkKey] PRIMARY KEY CLUSTERED ([idf_FrameworkKey] ASC)
;
GO
;

EXEC sys.sp_addextendedproperty
	@name = N'MS_Description'	,	@Value		=	N'This is the CPK for the field [idf_FrameworkKey] in the table [Framework].'
,	@Level0Type=N'SCHEMA'		,	@level0name	=	N'Fwk'
,	@Level1Type=N'TABLE'		,	@level1name	=	N'Framework'
,	@Level2Type=N'CONSTRAINT'	,	@level2name	=	N'CPK__Fwk__Framework__idf_FrameworkKey'
GO

-----************************************************************************************  
----- CREATE INDEX
-----************************************************************************************  
--CREATE UNIQUE NONCLUSTERED INDEX [IX__Fwk__Framework__XYZField1] ON [Fwk].[Framework]
--(
--	[XYZField1] ASC
--)WITH (	PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF
--	  , IGNORE_DUP_KEY = OFF
--	  , DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON
--	  , ALLOW_PAGE_LOCKS = ON
--	   ) ON [PRIMARY]
--GO
--;

--CREATE NONCLUSTERED INDEX [IX__Fwk__Framework__XYZField2] ON [Fwk].[Framework]
--(
--		[XYZField2] ASC
--)WITH (	PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF
--		, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON
--		, ALLOW_PAGE_LOCKS = ON
--	   ) ON [PRIMARY]
--GO
--;

-----************************************************************************************  
----- CREATE CONSTRAINT
-----************************************************************************************  
----- A--LTER TABLE [Fwk].[Framework] DROP CONSTRAINT [DF__Fwk__Framework__Description]
--ALTER TABLE [Fwk].[Framework]
--ADD CONSTRAINT [DF__Fwk__Framework__XYZField3]  
--DEFAULT ('') FOR [XYZField3]     --- For DEFAULT = 0 use  DEFAULT ((0))
--GO
--;

-----************************************************************************************  
----- Tests/Evaluation
-----************************************************************************************      
/*
SELECT * FROM INFORMATION_SCHEMA.TABLES  WHERE [TABLE_SCHEMA] = 'Fwk' AND [TABLE_NAME] = 'Framework';
SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE [TABLE_NAME] = 'Framework' ORDER BY ORDINAL_POSITION;
SELECT * FROM sys.objects WHERE [is_ms_shipped] <> 1 AND type = 'U' 
SELECT [FullName]	=	CONCAT('[' , object_schema_name([object_id]) , '].[' , OBJECT_NAME([object_id]) , ']') , * FROM sys.columns WHERE  OBJECTPROPERTY([Object_id] , 'IsUserTable') = 1 AND OBJECT_NAME([object_id]) = 'Framework'ORDER BY [FullName] , [column_id] 
*/
