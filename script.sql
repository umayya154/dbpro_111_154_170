USE [DB3]
GO
/****** Object:  Table [dbo].[Bill]    Script Date: 4/14/2019 5:22:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill](
	[Bill_id] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[Price] [int] NULL,
	[Quantity] [int] NULL,
	[Customer] [nvarchar](max) NULL,
	[MedicineID] [int] NOT NULL,
 CONSTRAINT [PK_Bill] PRIMARY KEY CLUSTERED 
(
	[Bill_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Company]    Script Date: 4/14/2019 5:22:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company](
	[Company_id] [int] NOT NULL,
	[C_Name] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](max) NULL,
	[Mobile_Number] [nchar](20) NULL,
 CONSTRAINT [PK_Company_1] PRIMARY KEY CLUSTERED 
(
	[Company_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Medicine]    Script Date: 4/14/2019 5:22:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medicine](
	[Medicine_id] [int] NOT NULL,
	[Medicine_Name] [nvarchar](50) NOT NULL,
	[Price] [int] NULL,
	[Mfg_Date] [date] NOT NULL,
	[Exp_Date] [date] NULL,
	[Batch] [nvarchar](50) NULL,
	[Type] [nvarchar](max) NULL,
	[CompanyID] [int] NULL,
 CONSTRAINT [PK_Medicine_1] PRIMARY KEY CLUSTERED 
(
	[Medicine_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Salary]    Script Date: 4/14/2019 5:22:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Salary](
	[Salary_ID] [int] NOT NULL,
	[Amount] [int] NULL,
	[Status] [int] NULL,
	[Staff_Id] [int] NULL,
	[Date] [date] NULL,
 CONSTRAINT [PK_Salary] PRIMARY KEY CLUSTERED 
(
	[Salary_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sales]    Script Date: 4/14/2019 5:22:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sales](
	[Sale_Id] [int] NOT NULL,
	[Date] [date] NULL,
	[Quantity] [int] NULL,
	[Price] [int] NULL,
	[Total] [int] NULL,
	[Medicine_id] [int] NOT NULL,
 CONSTRAINT [PK_Sales] PRIMARY KEY CLUSTERED 
(
	[Sale_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Staff]    Script Date: 4/14/2019 5:22:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staff](
	[Staff_id] [int] NOT NULL,
	[S_Name] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NULL,
	[Address] [nvarchar](max) NOT NULL,
	[Mobile_Number] [nchar](20) NULL,
 CONSTRAINT [PK_Staff] PRIMARY KEY CLUSTERED 
(
	[Staff_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Stock]    Script Date: 4/14/2019 5:22:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stock](
	[Stock_Id] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Medicine_Id] [int] NULL,
 CONSTRAINT [PK_Stock] PRIMARY KEY CLUSTERED 
(
	[Stock_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [FK_Bill_Medicine] FOREIGN KEY([MedicineID])
REFERENCES [dbo].[Medicine] ([Medicine_id])
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [FK_Bill_Medicine]
GO
ALTER TABLE [dbo].[Medicine]  WITH CHECK ADD  CONSTRAINT [FK_Medicine_Company] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[Company] ([Company_id])
GO
ALTER TABLE [dbo].[Medicine] CHECK CONSTRAINT [FK_Medicine_Company]
GO
ALTER TABLE [dbo].[Salary]  WITH CHECK ADD  CONSTRAINT [FK_Salary_Staff] FOREIGN KEY([Staff_Id])
REFERENCES [dbo].[Staff] ([Staff_id])
GO
ALTER TABLE [dbo].[Salary] CHECK CONSTRAINT [FK_Salary_Staff]
GO
ALTER TABLE [dbo].[Sales]  WITH CHECK ADD  CONSTRAINT [FK_Sales_Medicine] FOREIGN KEY([Medicine_id])
REFERENCES [dbo].[Medicine] ([Medicine_id])
GO
ALTER TABLE [dbo].[Sales] CHECK CONSTRAINT [FK_Sales_Medicine]
GO
ALTER TABLE [dbo].[Stock]  WITH CHECK ADD  CONSTRAINT [FK_Stock_Medicine] FOREIGN KEY([Medicine_Id])
REFERENCES [dbo].[Medicine] ([Medicine_id])
GO
ALTER TABLE [dbo].[Stock] CHECK CONSTRAINT [FK_Stock_Medicine]
GO
