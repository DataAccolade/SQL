﻿/*
Deployment script for test

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "test"
:setvar DefaultFilePrefix "test"
:setvar DefaultDataPath "C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\"
:setvar DefaultLogPath "C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\"

GO
:on error exit
GO
/*
Detect SQLCMD mode and disable script execution if SQLCMD mode is not supported.
To re-enable the script after enabling SQLCMD mode, execute the following:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'SQLCMD mode must be enabled to successfully execute this script.';
        SET NOEXEC ON;
    END


GO
USE [$(DatabaseName)];


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ANSI_NULLS ON,
                ANSI_PADDING ON,
                ANSI_WARNINGS ON,
                ARITHABORT ON,
                CONCAT_NULL_YIELDS_NULL ON,
                QUOTED_IDENTIFIER ON,
                ANSI_NULL_DEFAULT ON,
                CURSOR_DEFAULT LOCAL 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET PAGE_VERIFY NONE 
            WITH ROLLBACK IMMEDIATE;
    END


GO
ALTER DATABASE [$(DatabaseName)]
    SET TARGET_RECOVERY_TIME = 0 SECONDS 
    WITH ROLLBACK IMMEDIATE;


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET QUERY_STORE (OPERATION_MODE = READ_WRITE, MAX_STORAGE_SIZE_MB = 100) 
            WITH ROLLBACK IMMEDIATE;
    END


GO
PRINT N'Creating [dbo].[FactTable]...';


GO
CREATE TABLE [dbo].[FactTable] (
    [idf_FactTableKey] BIGINT          IDENTITY (1, 1) NOT NULL,
    [NKKeyField2]      INT             NOT NULL,
    [BizField1]        INT             NOT NULL,
    [BizField2]        NVARCHAR (100)  NULL,
    [BizField3]        VARCHAR (100)   NULL,
    [BizField4]        NUMERIC (16, 4) NULL,
    [idf_Source]       VARCHAR (100)   NOT NULL,
    [idf_ModifiedDate] DATETIME        NOT NULL,
    CONSTRAINT [CPK__dboFactTable__idf_FactTableKey] PRIMARY KEY CLUSTERED ([idf_FactTableKey] ASC)
);


GO
PRINT N'Creating unnamed constraint on [dbo].[FactTable]...';


GO
ALTER TABLE [dbo].[FactTable]
    ADD DEFAULT ('') FOR [BizField2];


GO
PRINT N'Creating [dbo].[DF__dboFactTable__BizField4]...';


GO
ALTER TABLE [dbo].[FactTable]
    ADD CONSTRAINT [DF__dboFactTable__BizField4] DEFAULT (0) FOR [BizField4];


GO
PRINT N'Creating [dbo].[FactTable].[MS_Description]...';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This is the [dbo].[FactTable] Table.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'FactTable';


GO
PRINT N'Creating [dbo].[FactTable].[idf_FactTableKey].[MS_Description]...';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This is the SurrogateKey Field [idf_FactTableKey].', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'FactTable', @level2type = N'COLUMN', @level2name = N'idf_FactTableKey';


GO
PRINT N'Creating [dbo].[CPK__dboFactTable__idf_FactTableKey].[MS_Description]...';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This is the CPK for the field [idf_FactTableKey] in the table [FactTable].', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'FactTable', @level2type = N'CONSTRAINT', @level2name = N'CPK__dboFactTable__idf_FactTableKey';


GO
----- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
----- Framework: Nik - Shahriar Nikkhah               Date: 2022-09-21	Time: 23:04
----- Author:    Enzo - Parsa Bahrami                 Date: 2023-01-18	Time: 21:43
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

-- ****************************************************************************
-- Call Stored Procedures
-- ****************************************************************************

--Examples
--:r "..\010-DatabaseAndSchemas\010-0030 UpdateDBAttributes.sql"
--:r "..\010-DatabaseAndSchemas\010-0115 CloneFwTables.sql"
--:r ".\060-0010 CreateAndSeedDimDate.sql"
GO

GO
PRINT N'Update complete.';


GO