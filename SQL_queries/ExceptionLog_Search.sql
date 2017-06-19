/****** Object:  StoredProcedure [dbo].[ExceptionLog_Search]    Script Date: 6/18/2017 8:54:40 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE PROC [dbo].[ExceptionLog_Search]
			@Type NVARCHAR(100)
			,@Message NVARCHAR(1000)
			,@StackTrace NVARCHAR(MAX)
			,@Url NVARCHAR(300)
			,@Person NVARCHAR(200)
			,@StartDate DATETIME2(7)
			,@EndDate DATETIME2(7)
			,@CurrentPage INT
			,@ItemsPerPage INT

AS

/* TEST CODE

DECLARE		@Type NVARCHAR(100) = 'sql'
			,@Message NVARCHAR(1000) = ''
			,@StackTrace NVARCHAR(MAX) = ''
			,@Url NVARCHAR(300) = ''
			,@Person NVARCHAR(200) = ''
			,@StartDate DATETIME2(7)
			,@EndDate DATETIME2(7)
			,@CurrentPage INT = 1
			,@ItemsPerPage INT = 10

EXECUTE dbo.ExceptionLog_Search
			@Type
			,@Message
			,@StackTrace
			,@Url
			,@Person
			,@StartDate
			,@EndDate
			,@CurrentPage
			,@ItemsPerPage

*/

BEGIN

	SELECT EL.[Id]
		  ,[Message]
		  ,[Type]
		  ,[StackTrace]
		  ,ApiUrl
		  ,ViewUrl
		  ,[RequestBody]
		  ,EL.[AspNetUserId]
		  ,P.Id
		  ,P.FirstName
		  ,P.MiddleName
		  ,P.LastName
		  ,P.PhoneNumber
		  ,P.Email
		  ,P.JobTitle
		  ,[LogDate]
		  ,COUNT(*) OVER () TotalRows
	  FROM [dbo].[ExceptionLog] EL
		LEFT JOIN Person P ON EL.AspNetUserId = P.AspNetUserId
	  WHERE ((@Message = '') OR (Message LIKE '%' + @Message + '%'))
		AND ((@Type = '') OR (Type LIKE '%' + @Type + '%'))
		AND ((@StackTrace = '') OR (StackTrace LIKE '%' + @StackTrace + '%'))
		AND ((@Url = '') OR (ApiUrl LIKE '%' + @Url + '%')
						 OR (ViewUrl LIKE '%' + @Url + '%'))
		AND ((@Person = '') OR (P.FirstName LIKE '%' + @Person + '%')
							OR (P.LastName LIKE '%' + @Person + '%')
							OR (P.Email LIKE '%' + @Person + '%')
							OR (P.LastName + ' ' + P.LastName LIKE '%' + @Person + '%')
							OR (P.FirstName + ' ' + P.MiddleName + ' ' + P.LastName LIKE '%' + @Person + '%')
							OR (P.AspNetUserId LIKE '%' + @Person + '%'))
		AND LogDate BETWEEN @StartDate AND @EndDate
	  ORDER BY LogDate DESC
	  OFFSET @ItemsPerPage * (@CurrentPage - 1) ROWS
	  FETCH NEXT @ItemsPerPage ROWS ONLY
END



GO


