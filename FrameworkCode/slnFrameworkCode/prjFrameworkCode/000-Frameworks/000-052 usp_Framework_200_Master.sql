----- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
----- FrmWrk: Nik - Shahriar Nikkhah               Date: 2022-09-21	Time: 23:04
----- Author: Enzo - Parsa Bahrami                 Date: 2023-01-25	Time: 20:36
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
SELECT * FROM sys.Objects WHERE name Like  '%usp_Framework_%'
SELECT * FROM sys.Objects WHERE name = 'usp_Framework_200_Master'
*/

-------************************************************************************************  
----- Cleanup
-------************************************************************************************ 
----- DROP PROCEDURE IF EXISTS [Fwk].[usp_Framework_200_Master]
--IF OBJECT_ID ('[Fwk].[usp_Framework_200_Master]') IS NOT NULL AND 2 = 2 --( 2=2 is a Safety net)
--	DROP PROCEDURE [Fwk].[usp_Framework_200_Master]
--GO;

-------************************************************************************************  
----- Extra Settings
-------************************************************************************************  
--SET ANSI_NULLS ON
--GO
--;

--SET QUOTED_IDENTIFIER ON
--GO
--;


-----************************************************************************************  
----- Create object (Table/View/uSP/...)
-----************************************************************************************  
CREATE PROCEDURE [Fwk].[usp_Framework_200_Master]
(
		@Parent_GuidId		uniqueIdentifier	--	This is the ADF/SSIS RunID Guid_Id
	,	@ObjectTimeStamp	DateTime			--	Used to track ETL loads
)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @Object_GuidId	uniqueIdentifier	=	NEWID()
	DECLARE @CurrentSPName  nVarChar(100)		=	OBJECT_NAME(@@PROCID)
	DECLARE @LogMessage		nVarChar(200) 		=	CAST(N'' AS nVarChar(200))

	BEGIN TRY
		BEGIN TRANSACTION
			
			----- Internal Custom Logging
			----- EXEC usp_Insert_Batch_log ( 'Start SP' , @CurrentSPName , GetDate() , @Parent_GuidId	, @Object_GuidId )

			---=======================================================================
			--- START CODE
			---=======================================================================
			SET @LogMessage = 'Error in TRUNCATE'
			EXEC [Fwk].[usp_Framework_100_TRUNCATE] @Object_GuidId , @ObjectTimeStamp;

			-- SET @LogMessage = 'Error in BusinessLogic1'
			-- EXEC [Fwk].[usp_Framework_300_BusinessLogic1] @Object_GuidId , @ObjectTimeStamp;

			-- SET @LogMessage = 'Error in BusinessLogic2'
			-- EXEC [Fwk].[usp_Framework_310_BusinessLogic2] @Object_GuidId , @ObjectTimeStamp;

			-- SET @LogMessage = 'Error in UPDATE'
			-- EXEC [Fwk].[usp_Framework_810_UPDATE] @Object_GuidId , @ObjectTimeStamp;

			-- SET @LogMessage = 'Error in INSERT'
			-- EXEC [Fwk].[usp_Framework_820_INSERT] @Object_GuidId , @ObjectTimeStamp;

			-- SET @LogMessage = 'Error in INSERT'
			-- EXEC [Fwk].[usp_Framework_830_UPSERT] @Object_GuidId , @ObjectTimeStamp;

			---=======================================================================
			--- END CODE 
			---=======================================================================
			
			----- Internal Custom Logging
			----- EXEC usp_Insert_Batch_log ( 'End SP' , @CurrentSPName , GetDate(), @Parent_GuidId	, @Object_GuidId )
		COMMIT 
	END TRY
	
	BEGIN CATCH
		----- Internal Custom Logging
		----- EXEC usp_Insert_Batch_log (ErrorNumber, MSErrorMsg + @LogMessage , @CurrentSPName, @Parent_GuidId	, @Object_GuidId )
		----- ;
		-- For test only --- SELECT @LogMessage Error , @CurrentSPName PRODName
		ROLLBACK
	END CATCH 
END
GO
;

-----************************************************************************************  
----- Object Description (Table/View/SP/Trigger/Function/...)
-----************************************************************************************  
EXEC sys.sp_addextendedproperty
	@name = N'MS_Description'	,	@Value		=	N'This is the [Fwk].[usp_Framework_200_Master] Procedure.'
,	@Level0Type=N'SCHEMA'		,	@level0name	=	N'Fwk'
,	@Level1Type=N'PROCEDURE'	,	@level1name	=	N'usp_Framework_200_Master'
GO

-----************************************************************************************  
----- Tests/Evaluation
-----************************************************************************************      
--EXEC [Fwk].[usp_Framework_200_Master] NEWID() , GETDATE();
--EXEC [Fwk].[usp_Framework_200_Master] '31E16C75-974B-4368-8685-DF31DF20977E' , '2023-01-01'

