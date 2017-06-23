/****** Object:  StoredProcedure [dbo].[ExceptionLog_SelectAll]    Script Date: 6/22/2017 10:22:55 AM ******/
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
		  ,U.[Email]
		  ,EL.[Message]
		  ,EL.[Type]
		  ,EL.[StackTrace]
		  ,EL.[ApiUrl]
		  ,EL.[ViewUrl]
		  ,EL.[RequestBody]
		  ,EL.[LogDate]
		  ,COUNT(*) OVER () AS [TotalRows]
	  FROM [dbo].[ExceptionLog] AS EL WITH(NOLOCK)
		LEFT JOIN [dbo].[AspNetUsers] AS U
		ON EL.[AspNetUserId] = U.[Id]
	  ORDER BY LogDate DESC

END



