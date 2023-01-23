----- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
----- Framework: Nik - Shahriar Nikkhah               Date: 2022-09-21	Time: 23:04
----- Author:    Enzo - Parsa Bahrami                 Date: 2023-01-18	Time: 23:18
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

-----************************************************************************************ 
----- Primary Tests/Evaluation
-----************************************************************************************ 
/*
SELECT * from INFORMATION_SCHEMA.SCHEMATA ORDER BY [SCHEMA_NAME]
SELECT * FROM [sys].[schemas] ORDER BY [name] desc
SELECT * FROM [sys].[objects] WHERE [schema_id] = SCHEMA_ID('dbo') 
*/

-----************************************************************************************ 
----- Cleanup
-----************************************************************************************ 
/*
IF (SELECT COUNT(*) FROM sys.objects WHERE [schema_id] = SCHEMA_ID('Fct')) = 0 ANDSCHEMA_ID(''Fct') IS NOT NULL
	DROP SCHEMA [Fct]
GO
;

IF (SELECT COUNT(*) FROM sys.objects WHERE [schema_id] = SCHEMA_ID('Dim')) = 0 AND SCHEMA_ID(''Dim') IS NOT NULL
	DROP SCHEMA [Dim]
GO
;

IF (SELECT COUNT(*) FROM sys.objects WHERE [schema_id] = SCHEMA_ID('Cfg')) = 0 AND SCHEMA_ID(''Cfg') IS NOT NULL
	DROP SCHEMA [Cfg]
GO
;

IF (SELECT COUNT(*) FROM sys.objects WHERE [schema_id] = SCHEMA_ID('Stg')) = 0 AND SCHEMA_ID(''Stg') IS NOT NULL
	DROP SCHEMA [Stg]
GO
;

IF (SELECT COUNT(*) FROM sys.objects WHERE [schema_id] = SCHEMA_ID('Lkp')) = 0 AND SCHEMA_ID(''Lkp') IS NOT NULL
	DROP SCHEMA [Lkp]
GO
;

IF (SELECT COUNT(*) FROM sys.objects WHERE [schema_id] = SCHEMA_ID('Fwk')) = 0 AND SCHEMA_ID(''Fwk') IS NOT NULL
	DROP SCHEMA [Fwk]
GO
;

IF (SELECT COUNT(*) FROM sys.objects WHERE [schema_id] = SCHEMA_ID('Tab')) = 0 AND SCHEMA_ID(''Tab') IS NOT NULL
	DROP SCHEMA [Tab]
GO
;
*/

-----************************************************************************************ 
----- Extra Settings
-----************************************************************************************ 
--SET ANSI_NULLS ON;
--GO
--;

--SET QUOTED_IDENTIFIER ON;
--GO
--;

-----************************************************************************************  
----- Create object (Table/View/uSP/...)
-----************************************************************************************
CREATE SCHEMA [Fct]
GO
;

EXEC sys.sp_addextendedproperty
	@name		= N'MS_Description'	
,	@level0type = N'SCHEMA'	
,	@level0Name = N'Fct'	
,	@Value		= N'[Fct] is the schema for Fact tables'
GO
;

--- *** *** *** *** *** *** *** *** *** *** *** *** *** 
CREATE SCHEMA [Dim]
GO
;

EXEC sys.sp_addextendedproperty
	@name		= N'MS_Description'	
,	@level0type = N'SCHEMA'	
,	@level0Name = N'Dim'	
,	@Value		= N'[Dim] is the schema for Dimension tables'
GO
;

--- *** *** *** *** *** *** *** *** *** *** *** *** *** 
CREATE SCHEMA [Cfg]
GO
;

EXEC sys.sp_addextendedproperty
	@name		= N'MS_Description'	
,	@level0type = N'SCHEMA'	
,	@level0Name = N'Cfg'	
,	@Value		= N'[Cfg] is the schema for Configuration tables'
GO
;

--- *** *** *** *** *** *** *** *** *** *** *** *** *** 
CREATE SCHEMA [Stg]
GO
;

EXEC sys.sp_addextendedproperty
	@name		= N'MS_Description'	
,	@level0type = N'SCHEMA'	
,	@level0Name = N'Stg'	
,	@Value		= N'[Stg] is the schema for Staging tables'
GO
;

--- *** *** *** *** *** *** *** *** *** *** *** *** *** 
CREATE SCHEMA [Lkp]
GO
;

EXEC sys.sp_addextendedproperty
	@name		= N'MS_Description'	
,	@level0type = N'SCHEMA'	
,	@level0Name = N'Lkp'
,	@Value		= N'[Lkp] is the schema for Lookup tables'
GO
;

--- *** *** *** *** *** *** *** *** *** *** *** *** *** 
CREATE SCHEMA [Fwk]
GO
;

EXEC sys.sp_addextendedproperty
	@name		= N'MS_Description'	
,	@level0type = N'SCHEMA'	
,	@level0Name = N'Fwk'	
,	@Value		= N'[Fwk] is the schema for Framework tables'
GO
;

--- *** *** *** *** *** *** *** *** *** *** *** *** *** 
CREATE SCHEMA [Tab]
GO
;

EXEC sys.sp_addextendedproperty
	@name		= N'MS_Description'	
,	@level0type = N'SCHEMA'	
,	@level0Name = N'Tab'	
,	@Value		= N'[Tab] is the schema for Tabular Model related tables'
GO
;