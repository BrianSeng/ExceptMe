
/****** Object:  StoredProcedure [dbo].[ExceptionLog_Insert]    Script Date: 6/19/2017 5:54:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[ExceptionLog_Insert]
			@AspNetUserId NVARCHAR(128)
			,@Message NVARCHAR(1000)
			,@Type NVARCHAR(100)
			,@StackTrace NVARCHAR(MAX)
			,@ApiUrl NVARCHAR(300)
			,@ViewUrl NVARCHAR(300)
			,@RequestBody NVARCHAR(1000)
AS

/* TEST CODE 

DECLARE		@AspNetUserId NVARCHAR(128) = '985e9b0b-229d-4f40-b4bd-c0fb2d17c685'
			,@Message NVARCHAR(1000) = 'Oops! Someone made a boo-boo!'
			,@Type NVARCHAR(100) = 'Babytown Frolics'
			,@StackTrace NVARCHAR(MAX) = 'Just a mess everywhere'
			,@ApiUrl NVARCHAR(300)
			,@ViewUrl NVARCHAR(300)
			,@RequestBody NVARCHAR(1000)

EXECUTE dbo.ExceptionLog_Insert
			@AspNetUserId
			,@Message
			,@Type
			,@StackTrace
			,@ApiUrl
			,@ViewUrl
			,@RequestBody

SELECT *
FROM dbo.ExceptionLog

*/

BEGIN
	INSERT INTO [dbo].[ExceptionLog]
			   ([AspNetUserId]
			   ,[Message]
			   ,[Type]
			   ,[StackTrace]
			   ,[ApiUrl]
			   ,[ViewUrl]
			   ,[RequestBody])
		 VALUES
			   (@AspNetUserId
			   ,@Message
			   ,@Type
			   ,@StackTrace
			   ,@ApiUrl
			   ,@ViewUrl
			   ,@RequestBody)
END



