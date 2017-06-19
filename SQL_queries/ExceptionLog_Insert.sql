/****** Object:  StoredProcedure [dbo].[ExceptionLog_Insert]    Script Date: 6/18/2017 8:53:58 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[ExceptionLog_Insert]
			@Message NVARCHAR(1000)
			,@Type NVARCHAR(100)
			,@StackTrace NVARCHAR(MAX)
			,@ApiUrl NVARCHAR(300)
			,@ViewUrl NVARCHAR(300)
			,@RequestBody NVARCHAR(1000)
			,@UserId NVARCHAR(128)

AS

/* TEST CODE 

DECLARE		@Message NVARCHAR(1000) = 'Ya blew it'
			,@Type NVARCHAR(100) = 'Typical Tomfoolery'
			,@StackTrace NVARCHAR(MAX) = 'Ya dang self'
			,@ApiUrl NVARCHAR(300)
			,@ViewUrl NVARCHAR(300)
			,@RequestBody NVARCHAR(1000)
			,@UserId NVARCHAR(128)

EXECUTE dbo.ExceptionLog_Insert
			@Message
			,@Type
			,@StackTrace
			,@ApiUrl
			,@ViewUrl
			,@RequestBody
			,@AspNetUserId

SELECT *
FROM dbo.ExceptionLog


*/

BEGIN

	INSERT INTO [dbo].[ExceptionLog]
			   ([Message]
			   ,[Type]
			   ,[StackTrace]
			   ,ApiUrl
			   ,ViewUrl
			   ,[RequestBody]
			   ,[UserId])
		 VALUES
			   (@Message
			   ,@Type
			   ,@StackTrace
			   ,@ApiUrl
			   ,@ViewUrl
			   ,@RequestBody
			   ,@UserId)
END



GO


