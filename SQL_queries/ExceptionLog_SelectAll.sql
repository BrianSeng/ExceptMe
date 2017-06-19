/****** Object:  StoredProcedure [dbo].[ExceptionLog_SelectAll]    Script Date: 6/18/2017 8:55:17 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[ExceptionLog_SelectAll]

AS

/* TEST CODE

EXECUTE dbo.ExceptionLog_SelectAll

*/

BEGIN

	SELECT TOP 20
		   EL.[Id]
		  ,EL.[AspNetUserId]
		  ,EL.[Message]
		  ,EL.[Type]
		  ,EL.[StackTrace]
		  ,EL.[ApiUrl]
		  ,EL.[ViewUrl]
		  ,EL.[RequestBody]
		  ,U.[Email]
		  ,U.[UserName]
		  ,EL.[LogDate]
		  ,COUNT(*) OVER () AS [TotalRows]
	  FROM [dbo].[ExceptionLog] AS EL
		LEFT JOIN [dbo].[AspNetUsers] AS U
		ON EL.[AspNetUserId] = U.[Id]
	  ORDER BY LogDate DESC

END



GO


