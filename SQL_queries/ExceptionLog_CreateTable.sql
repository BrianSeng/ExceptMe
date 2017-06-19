/****** Object:  Table [dbo].[ExceptionLog]    Script Date: 6/18/2017 8:48:03 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ExceptionLog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NULL,
	[Message] [nvarchar](1000) NULL,
	[Type] [nvarchar](100) NULL,
	[StackTrace] [nvarchar](max) NULL,
	[ApiUrl] [nvarchar](300) NULL,
	[ViewUrl] [nvarchar](300) NULL,
	[RequestBody] [nvarchar](1000) NULL,
	[LogDate] [datetime2](7) NULL,
 CONSTRAINT [PK_ExceptionLog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

ALTER TABLE [dbo].[ExceptionLog] ADD  CONSTRAINT [DF_ExceptionLog_LogDate]  DEFAULT (getutcdate()) FOR [LogDate]
GO


