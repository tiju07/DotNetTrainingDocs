USE [TrainingManagement]
GO
/****** Object:  Table [dbo].[Colleges]    Script Date: 24-01-2024 11:41:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Colleges](
	[CollegeId] [int] IDENTITY(1,1) NOT NULL,
	[CollegeName] [nvarchar](100) NULL,
	[Location] [nvarchar](50) NULL,
	[Remarks] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[CollegeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Trainees]    Script Date: 24-01-2024 11:41:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Trainees](
	[TraineeId] [int] IDENTITY(1,1) NOT NULL,
	[CollegeId] [int] NULL,
	[TraineeName] [nvarchar](100) NULL,
	[TraineeLocation] [nvarchar](100) NULL,
	[Email] [nvarchar](100) NULL,
	[Phone] [nvarchar](100) NULL,
	[Discontinue] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[TraineeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Colleges] ON 

INSERT [dbo].[Colleges] ([CollegeId], [CollegeName], [Location], [Remarks]) VALUES (1, N'Indira College of Engineering and Management', N'Pune, Maharashtra', N'')
INSERT [dbo].[Colleges] ([CollegeId], [CollegeName], [Location], [Remarks]) VALUES (2, N'Sri Chandrasekharendra Saraswathi Viswa Mahavidyalaya', N'Tamil Nadu', N'')
INSERT [dbo].[Colleges] ([CollegeId], [CollegeName], [Location], [Remarks]) VALUES (3, N'Noida Institute of Engineering and Technology', N'Noida', N'')
SET IDENTITY_INSERT [dbo].[Colleges] OFF
GO
SET IDENTITY_INSERT [dbo].[Trainees] ON 

INSERT [dbo].[Trainees] ([TraineeId], [CollegeId], [TraineeName], [TraineeLocation], [Email], [Phone], [Discontinue]) VALUES (1, 1, N'Tiju Lukose', N'Pune, Maharashtra', N'tijulukose0402@gmail.com', N'+919175301750', NULL)
INSERT [dbo].[Trainees] ([TraineeId], [CollegeId], [TraineeName], [TraineeLocation], [Email], [Phone], [Discontinue]) VALUES (2, 2, N'Vasanth Aditya', N'Tamil Nadu', N'vasanthaditya@gmail.com', N'+9184566654131', NULL)
SET IDENTITY_INSERT [dbo].[Trainees] OFF
GO
ALTER TABLE [dbo].[Trainees]  WITH CHECK ADD FOREIGN KEY([CollegeId])
REFERENCES [dbo].[Colleges] ([CollegeId])
GO
/****** Object:  StoredProcedure [dbo].[spAllTrainees]    Script Date: 24-01-2024 11:41:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spAllTrainees]
AS
SELECT C.CollegeName, C.Location, C.Remarks, T.TraineeName, T.TraineeLocation, T.Email, T.Phone FROM Colleges C LEFT JOIN Trainees T on C.CollegeId = T.CollegeId;
GO
