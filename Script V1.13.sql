USE [master]
GO
/****** Object:  Database [DoConnect]    Script Date: 2016-09-26 10:23:32 AM ******/
DROP DATABASE [DoConnect]
CREATE DATABASE [DoConnect]

GO
USE [DoConnect]
GO
/****** Object:  Table [dbo].[AccessLevel]    Script Date: 2016-09-26 10:23:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccessLevel](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Level] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_AccessLevel] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Appointments]    Script Date: 2016-09-26 10:23:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Appointments](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[App_Status] [int] NOT NULL,
	[Date_Time] [nvarchar](50) NOT NULL,
	[Details] [nvarchar](50) NOT NULL,
	[Patient_ID] [int] NOT NULL,
	[Doctor_ID] [int] NOT NULL,
 CONSTRAINT [PK_Appointments] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Consultation]    Script Date: 2016-09-26 10:23:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Consultation](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Patient_ID] [int] NOT NULL,
	[Doctor_ID] [int] NOT NULL,
	[Date] [nvarchar](50) NOT NULL,
	[ReasonForConsultation] [nvarchar](200) NOT NULL,
	[Symptoms] [nvarchar](200) NOT NULL,
	[ClinicalFindings] [nvarchar](200) NOT NULL,
	[Diagnosis] [nvarchar](200) NOT NULL,
	[TestResultSummary] [nvarchar](200) NOT NULL,
	[TreatmentPlan] [nvarchar](200) NOT NULL,
	[Presciption_ID] [int] NULL,
	[Referral_ID] [int] NULL,
	[DeletedStatus] [int] NULL DEFAULT ((0)),
 CONSTRAINT [PK_Consultation] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Doctors]    Script Date: 2016-09-26 10:23:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Doctors](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Gender] [char](1) NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[Practice_ID] [int] NOT NULL,
	[User_ID] [int] NOT NULL,
	[Job_Title] [nvarchar](50) NOT NULL,
	[DeletedStatus] [int] NULL DEFAULT ((0)),
 CONSTRAINT [PK_Doctors] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Expenses]    Script Date: 2016-09-26 10:23:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Expenses](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](200) NOT NULL,
	[Date] [nvarchar](50) NOT NULL,
	[Amount] [nvarchar](200) NOT NULL,
	[Practice_ID] [int] NOT NULL,
	[User_ID] [int] NOT NULL,
 CONSTRAINT [PK_Expenses] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Invoice]    Script Date: 2016-09-26 10:23:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoice](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [nvarchar](50) NOT NULL,
	[InvoiceSummary] [nvarchar](500) NOT NULL,
	[Total] [money] NOT NULL,
	[AmountPaid] [money] NOT NULL DEFAULT ((0)),
	[BalanceOwing] [money] NULL DEFAULT ((0)),
	[Medical_Aid_ID] [int] NOT NULL,
	[Patient_ID] [int] NOT NULL,
	[Doctor_ID] [int] NOT NULL,
	[PaidStatus] [int] NULL DEFAULT ((0)),
 CONSTRAINT [PK_Invoice] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Medical_Aid]    Script Date: 2016-09-26 10:23:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medical_Aid](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Cell_Number] [nvarchar](50) NOT NULL,
	[Fax_Number] [nvarchar](50) NOT NULL,
	[Email_Address] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[DeletedStatus] [int] NULL DEFAULT ((0)),
 CONSTRAINT [PK_Medical_Aid] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Medicine_Inventory]    Script Date: 2016-09-26 10:23:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medicine_Inventory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DrugName] [nvarchar](200) NOT NULL,
	[Description] [nvarchar](200) NOT NULL,
	[QuantityPurchased] [int] NOT NULL,
	[PurchaseDate] [nvarchar](50) NOT NULL,
	[QuantityInStock] [int] NOT NULL,
	[ExpiryDate] [nvarchar](50) NOT NULL,
	[DrugConcentration] [nvarchar](200) NOT NULL,
	[Practice_ID] [int] NOT NULL,
	[DeletedStatus] [int] NULL DEFAULT ((0)),
 CONSTRAINT [PK_Medicine_Inventory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Messages]    Script Date: 2016-09-26 10:23:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Messages](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Sender] [int] NOT NULL,
	[Receiver] [int] NOT NULL,
	[Subject] [nvarchar](200) NOT NULL,
	[Description] [nvarchar](200) NOT NULL,
	[Date] [nvarchar](50) NOT NULL,
	[ReadStatus] [int] NULL DEFAULT ((0)),
 CONSTRAINT [PK_Messages] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Patient]    Script Date: 2016-09-26 10:23:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Patient](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[ID_Number] [nvarchar](50) NOT NULL,
	[Gender] [char](1) NOT NULL,
	[DOB] [nvarchar](50) NOT NULL,
	[Cell_Number] [nvarchar](50) NOT NULL,
	[Street_Address] [nvarchar](50) NOT NULL,
	[Suburb] [nvarchar](50) NOT NULL,
	[City] [nvarchar](50) NOT NULL,
	[Country] [nvarchar](50) NOT NULL,
	[Medical_Aid_ID] [int] NOT NULL,
	[Doctor_ID] [int] NOT NULL,
	[User_ID] [int] NOT NULL,
	[Allergies] [nvarchar](500) NULL,
	[PreviousIllnesses] [nvarchar](500) NULL,
	[PreviousMedication] [nvarchar](500) NULL,
	[RiskFactors] [nvarchar](500) NULL,
	[SocialHistory] [nvarchar](500) NULL,
	[FamilyHistory] [nvarchar](500) NULL,
	[Email] [nvarchar](50) NULL,
	[DeletedStatus] [int] NULL DEFAULT ((0)),
 CONSTRAINT [PK_Patient] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Patient_Consultation]    Script Date: 2016-09-26 10:23:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patient_Consultation](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Patient_ID] [int] NOT NULL,
 CONSTRAINT [PK_Patient_Consultation] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Patient_Medical_Aid]    Script Date: 2016-09-26 10:23:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patient_Medical_Aid](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Scheme_Name] [nvarchar](50) NOT NULL,
	[Membership_Number] [nvarchar](50) NOT NULL,
	[Status] [bit] NOT NULL,
	[Registration_Date] [nvarchar](50) NOT NULL,
	[Deregistration_Date] [nvarchar](50) NOT NULL,
	[Patient_ID] [int] NOT NULL,
	[Medical_Aid_ID] [int] NOT NULL,
 CONSTRAINT [PK_Patient_Medical_Aid] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Practice]    Script Date: 2016-09-26 10:23:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Practice](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Phone_Number] [nvarchar](50) NOT NULL,
	[Fax_Number] [nvarchar](50) NOT NULL,
	[Street_Address] [nvarchar](200) NOT NULL,
	[Suburb] [nvarchar](50) NOT NULL,
	[City] [nvarchar](50) NOT NULL,
	[Country] [nvarchar](50) NOT NULL,
	[Latitude] [nvarchar](50) NOT NULL,
	[Longitude] [nvarchar](50) NOT NULL,
	[Trading_Times] [nvarchar](200) NOT NULL,
	[DeletedStatus] [int] NULL DEFAULT ((0)),
 CONSTRAINT [PK_Practice] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Prescription]    Script Date: 2016-09-26 10:23:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prescription](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [nvarchar](50) NOT NULL,
	[Patient_ID] [int] NOT NULL,
	[Doctor_ID] [int] NOT NULL,
 CONSTRAINT [PK_Prescription] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Prescription_DrugDetails]    Script Date: 2016-09-26 10:23:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prescription_DrugDetails](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Prescription_ID] [int] NOT NULL,
	[DrugName] [nvarchar](200) NOT NULL,
	[Strength] [nvarchar](15) NOT NULL,
	[IntakeRoute] [nvarchar](50) NOT NULL,
	[Frequency] [nvarchar](50) NOT NULL,
	[DispenseNumber] [int] NOT NULL,
	[RefillNumber] [int] NOT NULL,
 CONSTRAINT [PK_Prescription_DrugDetails] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Staff]    Script Date: 2016-09-26 10:23:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Staff](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[ID_Number] [nvarchar](50) NOT NULL,
	[Gender] [char](1) NOT NULL,
	[DOB] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[Street_Address] [nvarchar](50) NOT NULL,
	[Suburb] [nvarchar](50) NOT NULL,
	[City] [nvarchar](50) NOT NULL,
	[Country] [nvarchar](50) NOT NULL,
	[Employee_Type] [nvarchar](50) NOT NULL,
	[Practice_ID] [int] NOT NULL,
	[User_ID] [int] NOT NULL,
	[Email] [nvarchar](50) NULL,
	[DeletedStatus] [int] NULL DEFAULT ((0)),
 CONSTRAINT [PK_Staff] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Users]    Script Date: 2016-09-26 10:23:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Last_Login] [datetime] NOT NULL,
	[AccessLevel] [int] NOT NULL,
	[DeletedStatus] [int] NULL DEFAULT ((0)),
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Appointments]  WITH CHECK ADD  CONSTRAINT [FK_Appointments_Doctors] FOREIGN KEY([Doctor_ID])
REFERENCES [dbo].[Doctors] ([ID])
GO
ALTER TABLE [dbo].[Appointments] CHECK CONSTRAINT [FK_Appointments_Doctors]
GO
ALTER TABLE [dbo].[Appointments]  WITH CHECK ADD  CONSTRAINT [FK_Appointments_Patient] FOREIGN KEY([Patient_ID])
REFERENCES [dbo].[Patient] ([ID])
GO
ALTER TABLE [dbo].[Appointments] CHECK CONSTRAINT [FK_Appointments_Patient]
GO
ALTER TABLE [dbo].[Consultation]  WITH CHECK ADD  CONSTRAINT [FK_Consultation_Doctors] FOREIGN KEY([Doctor_ID])
REFERENCES [dbo].[Doctors] ([ID])
GO
ALTER TABLE [dbo].[Consultation] CHECK CONSTRAINT [FK_Consultation_Doctors]
GO
ALTER TABLE [dbo].[Consultation]  WITH CHECK ADD  CONSTRAINT [FK_Consultation_Patient] FOREIGN KEY([Patient_ID])
REFERENCES [dbo].[Patient] ([ID])
GO
ALTER TABLE [dbo].[Consultation] CHECK CONSTRAINT [FK_Consultation_Patient]
GO
ALTER TABLE [dbo].[Consultation]  WITH CHECK ADD  CONSTRAINT [FK_Consultation_Patient_Consultation] FOREIGN KEY([ID])
REFERENCES [dbo].[Patient_Consultation] ([ID])
GO
ALTER TABLE [dbo].[Consultation] CHECK CONSTRAINT [FK_Consultation_Patient_Consultation]
GO
ALTER TABLE [dbo].[Doctors]  WITH CHECK ADD  CONSTRAINT [FK_Doctors_Practice] FOREIGN KEY([Practice_ID])
REFERENCES [dbo].[Practice] ([ID])
GO
ALTER TABLE [dbo].[Doctors] CHECK CONSTRAINT [FK_Doctors_Practice]
GO
ALTER TABLE [dbo].[Doctors]  WITH CHECK ADD  CONSTRAINT [FK_Doctors_Users] FOREIGN KEY([User_ID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[Doctors] CHECK CONSTRAINT [FK_Doctors_Users]
GO
ALTER TABLE [dbo].[Expenses]  WITH CHECK ADD  CONSTRAINT [FK_Expenses_Practice] FOREIGN KEY([Practice_ID])
REFERENCES [dbo].[Practice] ([ID])
GO
ALTER TABLE [dbo].[Expenses] CHECK CONSTRAINT [FK_Expenses_Practice]
GO
ALTER TABLE [dbo].[Expenses]  WITH CHECK ADD  CONSTRAINT [FK_Expenses_Users] FOREIGN KEY([User_ID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[Expenses] CHECK CONSTRAINT [FK_Expenses_Users]
GO
ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD  CONSTRAINT [FK_Invoice_Doctors] FOREIGN KEY([Doctor_ID])
REFERENCES [dbo].[Doctors] ([ID])
GO
ALTER TABLE [dbo].[Invoice] CHECK CONSTRAINT [FK_Invoice_Doctors]
GO
ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD  CONSTRAINT [FK_Invoice_Patient] FOREIGN KEY([Patient_ID])
REFERENCES [dbo].[Patient] ([ID])
GO
ALTER TABLE [dbo].[Invoice] CHECK CONSTRAINT [FK_Invoice_Patient]
GO
ALTER TABLE [dbo].[Medicine_Inventory]  WITH CHECK ADD  CONSTRAINT [FK_Medicine_Inventory_Practice] FOREIGN KEY([Practice_ID])
REFERENCES [dbo].[Practice] ([ID])
GO
ALTER TABLE [dbo].[Medicine_Inventory] CHECK CONSTRAINT [FK_Medicine_Inventory_Practice]
GO
ALTER TABLE [dbo].[Patient]  WITH CHECK ADD  CONSTRAINT [FK_Patient_Doctors] FOREIGN KEY([Doctor_ID])
REFERENCES [dbo].[Doctors] ([ID])
GO
ALTER TABLE [dbo].[Patient] CHECK CONSTRAINT [FK_Patient_Doctors]
GO
ALTER TABLE [dbo].[Patient]  WITH CHECK ADD  CONSTRAINT [FK_Patient_Medical_Aid] FOREIGN KEY([Medical_Aid_ID])
REFERENCES [dbo].[Medical_Aid] ([ID])
GO
ALTER TABLE [dbo].[Patient] CHECK CONSTRAINT [FK_Patient_Medical_Aid]
GO
ALTER TABLE [dbo].[Patient]  WITH CHECK ADD  CONSTRAINT [FK_Patient_Users] FOREIGN KEY([User_ID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[Patient] CHECK CONSTRAINT [FK_Patient_Users]
GO
ALTER TABLE [dbo].[Patient_Medical_Aid]  WITH CHECK ADD  CONSTRAINT [FK_Patient_Medical_Aid_Medical_Aid] FOREIGN KEY([Medical_Aid_ID])
REFERENCES [dbo].[Medical_Aid] ([ID])
GO
ALTER TABLE [dbo].[Patient_Medical_Aid] CHECK CONSTRAINT [FK_Patient_Medical_Aid_Medical_Aid]
GO
ALTER TABLE [dbo].[Prescription]  WITH CHECK ADD  CONSTRAINT [FK_Prescription_Doctors] FOREIGN KEY([Doctor_ID])
REFERENCES [dbo].[Doctors] ([ID])
GO
ALTER TABLE [dbo].[Prescription] CHECK CONSTRAINT [FK_Prescription_Doctors]
GO
ALTER TABLE [dbo].[Prescription_DrugDetails]  WITH CHECK ADD  CONSTRAINT [FK_Prescription_DrugDetails_Prescription] FOREIGN KEY([Prescription_ID])
REFERENCES [dbo].[Prescription] ([ID])
GO
ALTER TABLE [dbo].[Prescription_DrugDetails] CHECK CONSTRAINT [FK_Prescription_DrugDetails_Prescription]
GO
ALTER TABLE [dbo].[Staff]  WITH CHECK ADD  CONSTRAINT [FK_Staff_Practice] FOREIGN KEY([Practice_ID])
REFERENCES [dbo].[Practice] ([ID])
GO
ALTER TABLE [dbo].[Staff] CHECK CONSTRAINT [FK_Staff_Practice]
GO
ALTER TABLE [dbo].[Staff]  WITH CHECK ADD  CONSTRAINT [FK_Staff_Users] FOREIGN KEY([User_ID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[Staff] CHECK CONSTRAINT [FK_Staff_Users]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_AccessLevel] FOREIGN KEY([AccessLevel])
REFERENCES [dbo].[AccessLevel] ([ID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_AccessLevel]
GO
/****** Object:  StoredProcedure [dbo].[CreateUser]    Script Date: 2016-09-26 10:23:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

INSERT [dbo].[AccessLevel] ([Level]) VALUES (N'Admin')
INSERT [dbo].[AccessLevel] ([Level]) VALUES (N'Doctor')
INSERT [dbo].[AccessLevel] ([Level]) VALUES (N'Patient')
INSERT [dbo].[AccessLevel] ([Level]) VALUES (N'Receptionist')
INSERT [dbo].[AccessLevel] ([Level]) VALUES (N'Nurse')
INSERT [dbo].[AccessLevel] ([Level]) VALUES (N'Assistant')
-----------------------------------------------------------------------------------------------------------------------------------------------------------

SET IDENTITY_INSERT [dbo].[Users] ON 
INSERT [dbo].[Users] ([ID], [Password], [Last_Login], [AccessLevel], [DeletedStatus]) VALUES (1, N'password',  CAST(N'2016-04-25 01:15:15' AS DateTime), 2, 0)
INSERT [dbo].[Users] ([ID], [Password], [Last_Login], [AccessLevel], [DeletedStatus]) VALUES (2, N'password',  CAST(N'2016-06-15 09:27:30' AS DateTime), 1, 0)
INSERT [dbo].[Users] ([ID], [Password], [Last_Login], [AccessLevel], [DeletedStatus]) VALUES (3, N'password',  CAST(N'2016-04-25 01:15:15' AS DateTime), 2, 0)
INSERT [dbo].[Users] ([ID], [Password], [Last_Login], [AccessLevel], [DeletedStatus]) VALUES (4, N'password',  CAST(N'2016-04-25 01:15:15' AS DateTime), 2, 0)
INSERT [dbo].[Users] ([ID], [Password], [Last_Login], [AccessLevel], [DeletedStatus]) VALUES (5, N'password',  CAST(N'2016-06-02 09:27:30' AS DateTime), 6, 0)
INSERT [dbo].[Users] ([ID], [Password], [Last_Login], [AccessLevel], [DeletedStatus]) VALUES (6, N'password',  CAST(N'2016-05-12 02:45:45' AS DateTime), 4, 0)
INSERT [dbo].[Users] ([ID], [Password], [Last_Login], [AccessLevel], [DeletedStatus]) VALUES (7, N'password',  CAST(N'2016-05-12 02:45:45' AS DateTime), 4, 0)
INSERT [dbo].[Users] ([ID], [Password], [Last_Login], [AccessLevel], [DeletedStatus]) VALUES (8, N'password',  CAST(N'2016-04-25 01:15:15' AS DateTime), 5, 0)
INSERT [dbo].[Users] ([ID], [Password], [Last_Login], [AccessLevel], [DeletedStatus]) VALUES (9, N'password',  CAST(N'2016-07-20 08:27:25' AS DateTime), 5, 0)
INSERT [dbo].[Users] ([ID], [Password], [Last_Login], [AccessLevel], [DeletedStatus]) VALUES (10, N'password', CAST(N'2016-07-20 08:27:25' AS DateTime), 5, 0)
INSERT [dbo].[Users] ([ID], [Password], [Last_Login], [AccessLevel], [DeletedStatus]) VALUES (11, N'password', CAST(N'2016-05-12 02:45:45' AS DateTime), 5, 0)
INSERT [dbo].[Users] ([ID], [Password], [Last_Login], [AccessLevel], [DeletedStatus]) VALUES (12, N'password', CAST(N'2016-06-15 09:27:30' AS DateTime), 6, 0)
INSERT [dbo].[Users] ([ID], [Password], [Last_Login], [AccessLevel], [DeletedStatus]) VALUES (13, N'password', CAST(N'2016-07-20 08:27:25' AS DateTime), 6, 0)
INSERT [dbo].[Users] ([ID], [Password], [Last_Login], [AccessLevel], [DeletedStatus]) VALUES (14, N'password', CAST(N'2016-04-25 01:15:15' AS DateTime), 3, 0)
INSERT [dbo].[Users] ([ID], [Password], [Last_Login], [AccessLevel], [DeletedStatus]) VALUES (15, N'password', CAST(N'2016-04-25 01:15:15' AS DateTime), 3, 0)
INSERT [dbo].[Users] ([ID], [Password], [Last_Login], [AccessLevel], [DeletedStatus]) VALUES (16, N'password', CAST(N'2016-04-25 01:15:15' AS DateTime), 3, 0)
INSERT [dbo].[Users] ([ID], [Password], [Last_Login], [AccessLevel], [DeletedStatus]) VALUES (17, N'password', CAST(N'2016-04-25 01:15:15' AS DateTime), 3, 0)
SET IDENTITY_INSERT [dbo].[Users] OFF
-----------------------------------------------------------------------------------------------------------------------------------------------------------

SET IDENTITY_INSERT [dbo].[Practice] ON
INSERT [dbo].[Practice] ([ID], [Name], [Phone_Number], [Fax_Number], [Street_Address], [Suburb], [City], [Country], [Latitude], [Longitude], [Trading_Times]) VALUES (1, N'Marble Towers Practice', N'0113339707', N'0118250000', N'13th Floor Marble Towers, Cnr Jeppe & Von Wielligh St', N'Newtown', N'Johannesburg', N'South Africa', N'-26.183226', N'27.994858', N'07:00 – 20:00 Monday to Friday, 08:00 – 13:00 Saturdays, Closed Sundays and public holidays')
INSERT [dbo].[Practice] ([ID], [Name], [Phone_Number], [Fax_Number], [Street_Address], [Suburb], [City], [Country], [Latitude], [Longitude], [Trading_Times]) VALUES (2, N'Life New Kensington Clinic ', N'0115384700', N'0118542156', N' Industry Road, Private Bag X7, Olifantsfontein, 1665', N'Olifantsfontein', N' Johannesburg', N'South Africa', N'-26.183226', N'27.994858', N'05:00 – 15:00 Monday to Saturdays, Closed Sundays')
INSERT [dbo].[Practice] ([ID], [Name], [Phone_Number], [Fax_Number], [Street_Address], [Suburb], [City], [Country], [Latitude], [Longitude], [Trading_Times]) VALUES (3, N'Zamokuhle Thembisa Private Hospital', N'0119232000', N'0118542156', N'128 Flint Mazibuko, 1632', N'Mthatha', N'Johannesburg', N'South Africa', N'-26.183226', N'27.994858', N'07:00 – 20:00 Monday to Friday , Closed Saturdays and Sundays')
INSERT [dbo].[Practice] ([ID], [Name], [Phone_Number], [Fax_Number], [Street_Address], [Suburb], [City], [Country], [Latitude], [Longitude], [Trading_Times]) VALUES (4, N'Netcare Rehabilitation Hospital', N'0116778590', N'0118278541', N'128 Flint Mazibuko, 1632', N'Newtown', N'Germiston', N'South Africa', N'-26.183226', N'27.994858', N'05:15 – 19:30 Monday to Thursday, 07:00 – 10:00 Saturdays, Closed Sundays')
INSERT [dbo].[Practice] ([ID], [Name], [Phone_Number], [Fax_Number], [Street_Address], [Suburb], [City], [Country], [Latitude], [Longitude], [Trading_Times]) VALUES (5, N'Sunshine Hospital', N'0114203224', N'0118542156', N'1522 Soma St', N'Benoni', N'Germiston', N'South Africa', N'-26.183226', N'27.994858', N'07:00 – 20:00 Monday to Friday, 08:00 – 13:00 Saturdays, Closed Sundays and public holidays')
INSERT [dbo].[Practice] ([ID], [Name], [Phone_Number], [Fax_Number], [Street_Address], [Suburb], [City], [Country], [Latitude], [Longitude], [Trading_Times]) VALUES (6, N'Little Company of Mary Hospital', N'0124243600', N'0118542156', N'50 George Storrar Dr, 0027', N'Pretoria', N'Johannesburg', N'South Africa', N'-26.183226', N'27.994858', N'07:00 – 20:00 Monday to Friday, 08:00 – 13:00 Saturdays, Closed Sundays and public holidays')
INSERT [dbo].[Practice] ([ID], [Name], [Phone_Number], [Fax_Number], [Street_Address], [Suburb], [City], [Country], [Latitude], [Longitude], [Trading_Times]) VALUES (7, N'Netcare Linmed Hospital', N'0117486201', N'0117486200', N'5 Hull Rd,1514', N'Benoni', N'Johannesburg', N'South Africa', N'-26.183226', N'27.994858', N'07:00 – 20:00 Monday to Friday, 08:00 – 13:00 Saturdays, Closed Sundays and public holidays')
SET IDENTITY_INSERT [dbo].[Practice] OFF

-----------------------------------------------------------------------------------------------------------------------------------------------------------

SET IDENTITY_INSERT [dbo].[Doctors] ON
INSERT [dbo].[Doctors] ([ID], [FirstName], [LastName], [Email], [Gender], [Address], [Practice_ID], [User_ID], [Job_Title], [DeletedStatus]) VALUES (1, N'Ana', N'Cruz', N'anacruz@gmail.com',	N'F', N'40 Moncgique Complex, Stonehaven Road, Paulshof', 1, 1, N'General Practitioner', 0)
INSERT [dbo].[Doctors] ([ID], [FirstName], [LastName], [Email], [Gender], [Address], [Practice_ID], [User_ID], [Job_Title], [DeletedStatus]) VALUES (2, N'Dr', N' Mbuyamba', N'mbuyamba@gmail.com',	N'M', N'13th Floor Marble Towers, Von Wielligh St', 2, 2, N'General Practitioner', 0)
INSERT [dbo].[Doctors] ([ID], [FirstName], [LastName], [Email], [Gender], [Address], [Practice_ID], [User_ID], [Job_Title], [DeletedStatus]) VALUES (3, N'Dipna', N'Mopapau', N'dipna@gmail.com', N'F', N'Marlin Ave, Lenasia, Johannesburg, 1821', 3, 3, N'Physio Therapist', 0)
INSERT [dbo].[Doctors] ([ID], [FirstName], [LastName], [Email], [Gender], [Address], [Practice_ID], [User_ID], [Job_Title], [DeletedStatus]) VALUES (4, N'Sammy', N'Mohadeo', N'mohadeo@gmail.com',	N'M', N'7 Hummingbird Complex, Lenasia', 4, 4, N'Oncologist', 0)
SET IDENTITY_INSERT [dbo].[Doctors] OFF
SET IDENTITY_INSERT [dbo].[Medical_Aid] ON 
-----------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT [dbo].[Medical_Aid] ([ID], [Name], [Cell_Number], [Fax_Number], [Email_Address], [Address], [DeletedStatus]) VALUES (5, N'Discovery Health Medical Scheme', N'0847134892', N'0115291533', N'discohealth@gmail.com', N'74571, Lynwood Ridge, 1', 0)
INSERT [dbo].[Medical_Aid] ([ID], [Name], [Cell_Number], [Fax_Number], [Email_Address], [Address], [DeletedStatus]) VALUES (8, N'Liberty Medical Scheme', N'0815987032', N'0860002163', N'liberty@hotmail.com', N'NULL74, Braamfontein, 2', 0)
INSERT [dbo].[Medical_Aid] ([ID], [Name], [Cell_Number], [Fax_Number], [Email_Address], [Address], [DeletedStatus]) VALUES (11, N'Netcare', N'0847135032', N'0112228888', N'netcare@live.com', N'2 Sunninghill Crescent, No 3 Eglin Road, 3', 0)
SET IDENTITY_INSERT [dbo].[Medical_Aid] OFF
SET IDENTITY_INSERT [dbo].[Patient] ON 
-----------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT [dbo].[Patient] ([ID], [FirstName], [LastName], [ID_Number], [Gender], [DOB], [Cell_Number], [Street_Address], [Suburb], [City], [Country], [Medical_Aid_ID], [Doctor_ID], [User_ID], [Allergies], [PreviousIllnesses], [PreviousMedication], [RiskFactors], [SocialHistory], [FamilyHistory], [Email]) VALUES (1, N'Joy', N'Maya', N'9507211237183', N'F', CAST(N'1995-07-21' AS Date), N'0721532589', N'123 Rivonia Road', N'Rivonia', N'Johannesburg', N'South Africa', 5, 1, 14, N'Lactose', N'Severe Headaches, Heart Attack', N'Abobotulinumtoxin A', N'Overweight, Tobacco Use', N'No social history record', N'cataracts, glaucoma', N'joy@hotmail.com')
INSERT [dbo].[Patient] ([ID], [FirstName], [LastName], [ID_Number], [Gender], [DOB], [Cell_Number], [Street_Address], [Suburb], [City], [Country], [Medical_Aid_ID], [Doctor_ID], [User_ID], [Allergies], [PreviousIllnesses], [PreviousMedication], [RiskFactors], [SocialHistory], [FamilyHistory], [Email]) VALUES (2, N'Jack', N'Daniels', N'401110272859', N'M', CAST(N'1940-10-11' AS Date), N'0821142589', N'18 Adonis street', N'Lenasia', N'Johannesburg', N'South Africa', 5, 2, 15, N'Balsam of Peru', N'Actinomycosis, Amebiasis, Bacillus cereus', N'Ablavar', N'High Blood Pressure', N'jj', N'Breast Cancer', N'Jack@gmail.com')
INSERT [dbo].[Patient] ([ID], [FirstName], [LastName], [ID_Number], [Gender], [DOB], [Cell_Number], [Street_Address], [Suburb], [City], [Country], [Medical_Aid_ID], [Doctor_ID], [User_ID], [Allergies], [PreviousIllnesses], [PreviousMedication], [RiskFactors], [SocialHistory], [FamilyHistory], [Email]) VALUES (3, N'Benny', N'Nkopane', N'1254773286524', N'M', CAST(N'1912-07-05' AS Date), N'0758321489', N'1 Sun Avn', N'Randburg', N'Johannesburg', N'South Africa', 8, 3, 16, N'Tetracycline, Dilantin', N' Balantidium coli', N'canagliflozin', N'High Blood Cholesterol', N'jj', N'Hernia', N'Benny@gmail.com')
INSERT [dbo].[Patient] ([ID], [FirstName], [LastName], [ID_Number], [Gender], [DOB], [Cell_Number], [Street_Address], [Suburb], [City], [Country], [Medical_Aid_ID], [Doctor_ID], [User_ID], [Allergies], [PreviousIllnesses], [PreviousMedication], [RiskFactors], [SocialHistory], [FamilyHistory], [Email]) VALUES (4, N'Sammy', N'Ndlovu', N'9401215423589', N'F', CAST(N'1994-07-21' AS Date), N'0201548993', N'Scorpio Drive', N'Kilany', N'Johannesburg', N'South Africa', 11, 4, 17, N'Penicillin', N'Trypanosoma cruzi, Haemophilus ducreyi', N'ustekinumab', N'Diabetes, High Blood Cholesterol', N'jj', N' Kidneys', N'Sammy@gmail.com')
SET IDENTITY_INSERT [dbo].[Patient] OFF
SET IDENTITY_INSERT [dbo].[Patient_Medical_Aid] ON 
-----------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT [dbo].[Patient_Medical_Aid] ([ID], [Scheme_Name], [Membership_Number], [Status], [Registration_Date], [Deregistration_Date], [Patient_ID], [Medical_Aid_ID]) VALUES (1, N'Executive Plan', N'2541', 1, CAST(N'2016-02-11' AS Date), CAST(N'2017-02-11' AS Date), 1, 5)
INSERT [dbo].[Patient_Medical_Aid] ([ID], [Scheme_Name], [Membership_Number], [Status], [Registration_Date], [Deregistration_Date], [Patient_ID], [Medical_Aid_ID]) VALUES (2, N'Hospital Plan', N'4255', 1, CAST(N'2016-05-03' AS Date), CAST(N'2017-05-03' AS Date), 2, 5)
INSERT [dbo].[Patient_Medical_Aid] ([ID], [Scheme_Name], [Membership_Number], [Status], [Registration_Date], [Deregistration_Date], [Patient_ID], [Medical_Aid_ID]) VALUES (3, N'Hospital Plan', N'4222', 1, CAST(N'2016-04-18' AS Date), CAST(N'2017-04-18' AS Date), 3, 8)
INSERT [dbo].[Patient_Medical_Aid] ([ID], [Scheme_Name], [Membership_Number], [Status], [Registration_Date], [Deregistration_Date], [Patient_ID], [Medical_Aid_ID]) VALUES (4, N'Executive Plan', N'4244', 1, CAST(N'2016-05-22' AS Date), CAST(N'2017-05-20' AS Date), 4, 11)
SET IDENTITY_INSERT [dbo].[Patient_Medical_Aid] OFF
SET IDENTITY_INSERT [dbo].[Prescription] ON 
-----------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT [dbo].[Prescription] ([ID], [Date], [Patient_ID], [Doctor_ID]) VALUES (1, CAST(N'2016-02-12' AS Date), 1, 1)
INSERT [dbo].[Prescription] ([ID], [Date], [Patient_ID], [Doctor_ID]) VALUES (2, CAST(N'2016-05-03' AS Date), 2, 2)
INSERT [dbo].[Prescription] ([ID], [Date], [Patient_ID], [Doctor_ID]) VALUES (3, CAST(N'2016-04-18' AS Date), 3, 3)
INSERT [dbo].[Prescription] ([ID], [Date], [Patient_ID], [Doctor_ID]) VALUES (4, CAST(N'2016-05-30' AS Date), 4, 2)
INSERT [dbo].[Prescription] ([ID], [Date], [Patient_ID], [Doctor_ID]) VALUES (5, CAST(N'2016-06-29' AS Date), 1, 2)
INSERT [dbo].[Prescription] ([ID], [Date], [Patient_ID], [Doctor_ID]) VALUES (6, CAST(N'2016-06-30' AS Date), 2, 4)
INSERT [dbo].[Prescription] ([ID], [Date], [Patient_ID], [Doctor_ID]) VALUES (7, CAST(N'2016-03-07' AS Date), 3, 3)
INSERT [dbo].[Prescription] ([ID], [Date], [Patient_ID], [Doctor_ID]) VALUES (8, CAST(N'2016-07-12' AS Date), 4, 1)
SET IDENTITY_INSERT [dbo].[Prescription] OFF

-----------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO Appointments VALUES (1, '2016-02-12 08:27:25', 'Stomach pains', 1, 3);
INSERT INTO Appointments VALUES (0, '2016-02-14 02:45:45', 'Sona', 2, 2);
INSERT INTO Appointments VALUES (1, '2016-03-02 09:27:30', 'Family Planning', 3, 1);
INSERT INTO Appointments VALUES (0, '2016-08-04 08:27:25', 'HIV Test', 4, 4);
INSERT INTO Appointments VALUES (1, '2016-04-15 01:15:15', 'Loops', 1, 3);
INSERT INTO Appointments VALUES (0, '2016-05-05 08:27:25', 'Stitching', 2, 4);
INSERT INTO Appointments VALUES (1, '2016-05-30 02:45:45', 'Lump Removal', 3, 4);
INSERT INTO Appointments VALUES (2, '2016-03-06 09:27:30', 'Abscess Drainage', 4, 3);
INSERT INTO Appointments VALUES (2, '2016-06-17 08:27:25', 'Pap Smear', 3, 2);
INSERT INTO Appointments VALUES (2, '2016-06-29 01:15:15', 'Circumcision', 4, 1);
INSERT INTO Appointments VALUES (2, '2016-07-29 01:15:15', 'Allergies', 2, 1);
INSERT INTO Appointments VALUES (2, '2016-08-29 01:15:15', 'Alopecia areata', 4, 1);
INSERT INTO Appointments VALUES (2, '2016-09-29 01:15:15', 'Kidney disease', 3, 1);
INSERT INTO Appointments VALUES (2, '2016-10-29 01:15:15', 'Lactose intolerance', 2, 1);
INSERT INTO Appointments VALUES (2, '2016-09-29 01:15:15', 'Kidney disease', 3, 1);
INSERT INTO Appointments VALUES (1, '2016-10-29 01:15:15', 'Lactose intolerance', 2, 1);
INSERT INTO Appointments VALUES (1, '2016-09-29 01:15:15', 'Kidney disease', 3, 1);
INSERT INTO Appointments VALUES (0, '2016-10-29 01:15:15', 'Lactose intolerance', 2, 1);
INSERT INTO Appointments VALUES (0, '2016-10-29 01:15:15', 'Migraine', 1, 1);
INSERT INTO Appointments VALUES (2, '2016-10-24 01:15:15', 'Pregnancy Test', 3, 4);
INSERT INTO Appointments VALUES (2, '2016-10-27 01:15:15', 'ECG', 4, 4);
-----------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO Patient_Consultation VALUES (1);
INSERT INTO Patient_Consultation VALUES (2);
INSERT INTO Patient_Consultation VALUES (1);
INSERT INTO Patient_Consultation VALUES (1);
INSERT INTO Patient_Consultation VALUES (1);
-----------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO Consultation VALUES (1, 1, '2016-08-03 20:29:53','blood in urine and skin lesions','cutaneous infections, lung infections and bloodstream infections', 'Patient has high temperature', 'Glanders', 'No test conducted', 'Sulfadiazine and ciprofloxacin pills', 1, 1, 0);
INSERT INTO Consultation VALUES (1, 1, '2016-08-04 20:29:53','blood in urine and skin lesions','cutaneous infections, lung infections and bloodstream infections', 'Patient has high temperature', 'Glanders', 'No test conducted', 'Sulfadiazine and ciprofloxacin pills', 1, 1, 0);
INSERT INTO Consultation VALUES (1, 1, '2016-08-05 20:29:53','blood in urine and skin lesions','cutaneous infections, lung infections and bloodstream infections', 'Patient has high temperature', 'Glanders', 'No test conducted', 'Sulfadiazine and ciprofloxacin pills', 1, 1, 0);
INSERT INTO Consultation VALUES (2, 2, '2016-09-03 20:29:53','Depression','Impulsive behavior, obsessive thoughts and compulsions', 'Patient has suicidal thoughts.', 'Depression', 'No test conducted', 'Psychotherapy recommended', 2, 1, 0);
INSERT INTO Consultation VALUES (1, 4, '2016-09-03 20:29:53','Headache pain and weakness',' Intermittent or irregular fever of variable duration, headache, weakness, profuse sweating, chills', 'Recurrent fevers, Joint pain and fatigue', 'Brucellosis', 'No test conducted', 'Tetracycline plus streptomycin', 5, 1, 0);

-----------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO Expenses VALUES ('Bought office lights', '2016-07-27', '200', 1, 6);
INSERT INTO Expenses VALUES ('Bought office lights', '2016-07-27', '200', 2, 2);
INSERT INTO Expenses VALUES ('Bought office lights', '2016-10-05', '200', 3, 1);
-----------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO Invoice ([Date], [InvoiceSummary], [Total], [AmountPaid],[BalanceOwing],[Medical_Aid_ID],[Patient_ID],[Doctor_ID],[PaidStatus]) VALUES ('2016-02-27', 'Stomach pains',120, 0, 120,1, 1, 1, 0);
INSERT INTO Invoice VALUES ('2016-03-27', 'Back Pain',650, 0, 650, 2, 2, 2, 0);
INSERT INTO Invoice VALUES ('2016-04-27', 'HIV Test',170, 0, 170, 3, 3, 3, 0);
INSERT INTO Invoice VALUES ('2016-10-12', 'Scan',550, 550, 0, 4, 4, 4, 1);
INSERT INTO Invoice VALUES ('2016-10-06', 'Back Pain',650, 50, 600, 2, 1, 2, 0);
INSERT INTO Invoice VALUES ('2016-10-06', 'Back Pain',650, 150, 500, 2, 1, 2, 0);
INSERT INTO Invoice VALUES ('2016-10-05', 'HIV Test',170, 0, 170, 3, 2, 3, 0);
INSERT INTO Invoice VALUES ('2016-10-05', 'Scan',550, 550, 0, 4, 3, 4, 1);
-----------------------------------------------------------------------------------------------------------------------------------------------------------


INSERT INTO Medicine_Inventory VALUES ('1Acetaminophen','Acetaminophen is a pain reliever and a fever reducer.', 400, '2016-05-27', 300, '2016-05-27', '1000', 1, 0);
INSERT INTO Medicine_Inventory VALUES ('2Acetaminophen','Acetaminophen is a pain reliever and a fever reducer.', 400, '2016-05-27', 300, '2016-05-27', '1000', 1, 0);
INSERT INTO Medicine_Inventory VALUES ('3Acetaminophen','Acetaminophen is a pain reliever and a fever reducer.', 400, '2016-05-27', 300, '2016-05-27', '1000', 1, 0);
INSERT INTO Medicine_Inventory VALUES ('4Acetaminophen','Acetaminophen is a pain reliever and a fever reducer.', 400, '2016-05-27', 300, '2016-05-27', '1000', 1, 0);
INSERT INTO Medicine_Inventory VALUES ('5Acetaminophen','Acetaminophen is a pain reliever and a fever reducer.', 400, '2016-05-27', 300, '2016-05-27', '1000', 1, 0);
INSERT INTO Medicine_Inventory VALUES ('6Acetaminophen','Acetaminophen is a pain reliever and a fever reducer.', 400, '2016-05-27', 300, '2016-05-27', '1000', 1, 0);
INSERT INTO Medicine_Inventory VALUES ('7Acetaminophen','Acetaminophen is a pain reliever and a fever reducer.', 400, '2016-05-27', 300, '2016-05-27', '1000', 1, 0);
-----------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO Staff VALUES ('John', 'Cannon', '9105141427182', 'M', '1991-05-14', '0811471478', '123 Rivonia Road', 'Rivonia', 'Johannesburg', 'South Africa','Assistant', 1, 5,'john@yahoo.com', 0);
INSERT INTO Staff VALUES ('Reuben', 'Arbuthnot', '9102141427182', 'M', '1991-05-14', '0825471478', '123 Rivonia Road', 'Rivonia', 'Johannesburg', 'South Africa','Receptionist', 1, 6,'reuben@yahoo.com', 0);
INSERT INTO Staff VALUES ('Edward', 'Piers', '9104141428182', 'M', '1991-05-14', '0712589452', '123 Rivonia Road', 'Rivonia', 'Johannesburg', 'South Africa','Receptionist', 2, 7,'edward@yahoo.com', 0);
INSERT INTO Staff VALUES ('James', 'Laura', '9112141427182', 'M', '1991-05-14', '0825879654', '123 Rivonia Road', 'Rivonia', 'Johannesburg', 'South Africa','Nurse', 1, 8,'james@yahoo.com', 0);
INSERT INTO Staff VALUES ('Creighton', 'Neil', '9101141427182', 'M', '1991-05-14', '0824587453', '123 Rivonia Road', 'Rivonia', 'Johannesburg', 'South Africa','Nurse', 2, 9,'creighton@yahoo.com', 0);
INSERT INTO Staff VALUES ('Jane', 'Roger', '9110141427182', 'F', '1991-05-14', '0828752145', '123 Rivonia Road', 'Rivonia', 'Johannesburg', 'South Africa','Nurse', 2, 10,'jane@yahoo.com', 0);
INSERT INTO Staff VALUES ('John Quincy', 'Yehuda', '9103141427182', 'M', '1991-05-14', '0825877458', '123 Rivonia Road', 'Rivonia', 'Johannesburg', 'South Africa','Nurse', 3, 11,'johnquincy@yahoo.com', 0);
INSERT INTO Staff VALUES ('Samuel', 'Isaac', '9106141427182', 'M', '1991-05-14', '0821471478', '123 Rivonia Road', 'Rivonia', 'Johannesburg', 'South Africa','Assistant', 4, 12,'samuel@yahoo.com', 0);
INSERT INTO Staff VALUES ('Scott', 'Margaret', '9109141427182', 'M', '1991-05-14', '0821471478', '123 Rivonia Road', 'Rivonia', 'Johannesburg', 'South Africa','Assistant', 5, 13,'scott@yahoo.com', 0);
-----------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO Prescription_DrugDetails VALUES (1,'Adderall', '10 mg ','Mouth','Daily', 14, 0);
INSERT INTO Prescription_DrugDetails VALUES (2,'Cymbalta', '10 mg ','Mouth','Daily', 14, 0);
INSERT INTO Prescription_DrugDetails VALUES (3,'Lexapro', '10 mg ','Mouth','Daily', 14, 0);
INSERT INTO Prescription_DrugDetails VALUES (4,'Acetaminophen', '10 mg ','Mouth','Daily', 14, 0);
INSERT INTO Prescription_DrugDetails VALUES (5,'Adderall', '10 mg ','Mouth','Daily', 14, 0);
INSERT INTO Prescription_DrugDetails VALUES (6,'Cymbalta', '10 mg ','Mouth','Daily', 14, 0);
INSERT INTO Prescription_DrugDetails VALUES (7,'Lexapro', '10 mg ','Mouth','Daily', 14, 0);
INSERT INTO Prescription_DrugDetails VALUES (8,'Acetaminophen', '10 mg ','Mouth','Daily', 14, 0);

INSERT INTO [Messages] VALUES ('6', '2','1Meeting at 3pm','Here is the message', '2016-05-14', 0);
INSERT INTO [Messages] VALUES ('6', '2','2Meeting at 3pm','Here is the message', '2016-06-14', 1);
INSERT INTO [Messages] VALUES ('6', '2','3Meeting at 3pm','Here is the message', '2016-07-14', 0);
INSERT INTO [Messages] VALUES ('6', '2','4Meeting at 3pm','Here is the message', '2016-08-14', 1);
INSERT INTO [Messages] VALUES ('6', '7','1Meeting at 3pm','Here is the message', '2016-05-14', 0);
INSERT INTO [Messages] VALUES ('6', '7','2Meeting at 3pm','Here is the message', '2016-06-14', 1);
INSERT INTO [Messages] VALUES ('2', '2','Meeting','Here is the message', '2016-08-14', 0);
INSERT INTO [Messages] VALUES ('2', '7','Meeting','Here is the message', '2016-05-14', 0);
INSERT INTO [Messages] VALUES ('2', '5','Meeting','Here is the message', '2016-06-14', 0);
GO

/****** Objects:  StoredProcedures ******/

CREATE PROCEDURE [CreateUser] 
		@AccessLevel INT
AS
BEGIN
SET NOCOUNT ON;
	INSERT INTO [Users]
	(
		[Password], 
		[Last_Login],
		[AccessLevel]
	)
	OUTPUT
		[inserted].[ID]
	VALUES   
	(
		'p4ssworD',
		SYSDATETIME(),
		@AccessLevel
	)
END
GO
------------------------------------------

CREATE PROCEDURE [dbo].[Login] 
		@Email NVARCHAR(50),
		@Password NVARCHAR(50)
AS
BEGIN

SET NOCOUNT ON;

BEGIN TRANSACTION [Login]
BEGIN TRY

IF EXISTS 
(
	SELECT        
		[D].[Email], 
		[U].[ID],
		[U].[Password], 
		[U].[AccessLevel]
	FROM            
		[Doctors] AS [D]
	INNER JOIN
        [Users] as [U]
	ON [D].[User_ID] = [U].[ID]
	WHERE
	   [D].Email = @Email AND [U].[Password] = @Password
)
BEGIN
	SELECT        
		[D].[Email], 
		[U].[ID],
		[U].[Password], 
		[U].[AccessLevel]
	FROM            
		[Doctors] AS [D]
	INNER JOIN
        [Users] as [U]
	ON [D].[User_ID] = [U].[ID]
	WHERE
	   [D].Email = @Email AND [U].[Password] = @Password
END

IF EXISTS 
(
	SELECT        
		[P].[Email], 
		[U].[ID],
		[U].[Password], 
		[U].[AccessLevel]
	FROM            
		[Patient] AS [P]
	INNER JOIN
        [Users] as [U]
	ON [P].[User_ID] = [U].[ID]
	WHERE
	   [P].[Email] = @Email AND [U].[Password] = @Password
)
BEGIN
	SELECT        
		[P].[Email], 
		[U].[ID],
		[U].[Password], 
		[U].[AccessLevel]
	FROM            
		[Patient] AS [P]
	INNER JOIN
        [Users] as [U]
	ON [P].[User_ID] = [U].[ID]
	WHERE
	   [P].[Email] = @Email AND [U].[Password] = @Password
END

IF EXISTS
(
	SELECT        
		[S].[Email], 
		[U].[ID],
		[U].[Password], 
		[U].[AccessLevel]
	FROM            
		[Staff] AS [S]
	INNER JOIN
        [Users] as [U]
	ON [S].[User_ID] = [U].[ID]
	WHERE
	   [S].Email = @Email AND [U].[Password] = @Password
)
BEGIN
	SELECT        
		[S].[Email], 
		[U].[ID],
		[U].[Password], 
		[U].[AccessLevel]
	FROM            
		[Staff] AS [S]
	INNER JOIN
        [Users] as [U]
	ON [S].[User_ID] = [U].[ID]
	WHERE
	   [S].Email = @Email AND [U].[Password] = @Password
END

END TRY

BEGIN CATCH
	ROLLBACK TRANSACTION [Login]
END CATCH
COMMIT TRANSACTION [Login]
END
GO
-----------------------------------------------------------------------------------
CREATE PROCEDURE [GetUserDetailsByUser_ID] --Get logged in User Details
		@User_ID INT
AS
BEGIN
SET NOCOUNT ON;
BEGIN TRANSACTION [GetUserDetailsByUser_ID]
BEGIN TRY
IF EXISTS 
(
	SELECT        
		[D].[ID], 
		[D].[FirstName],
		[D].[LastName],
		[D].[Email],
		[D].[Practice_ID],
		[U].[ID] AS 'User_ID',
		[U].[AccessLevel]

	FROM	[Doctors] AS [D]
	INNER JOIN	[Users] as [U]
	ON    [D].[User_ID] = [U].[ID]
	WHERE [U].[ID] = @User_ID
)
BEGIN
	SELECT        
		[D].[ID], 
		[D].[FirstName],
		[D].[LastName],
		[D].[Email],
		[D].[Practice_ID],
		[U].[ID] AS 'User_ID',
		[U].[AccessLevel]
	FROM	[Doctors] AS [D]
	INNER JOIN	[Users] as [U]
	ON    [D].[User_ID] = [U].[ID]
	WHERE [U].[ID] = @User_ID
END

IF EXISTS
(
	SELECT        
		[S].[ID], 
		[S].[FirstName],
		[S].[LastName],
		[S].[Email],
		[S].[Practice_ID],
		[U].[ID] AS 'User_ID',
		[U].[AccessLevel]
	FROM            
		[Staff] AS [S]
	INNER JOIN
        [Users] as [U]
	ON [S].[User_ID] = [U].[ID]
	WHERE
	   [U].[ID] = @User_ID
)
BEGIN
	SELECT        
		[S].[ID], 
		[S].[FirstName],
		[S].[LastName],
		[S].[Email],
		[S].[Practice_ID],
		[U].[ID] AS 'User_ID',
		[U].[AccessLevel]
	FROM            
		[Staff] AS [S]
	INNER JOIN
        [Users] as [U]
	ON [S].[User_ID] = [U].[ID]
	WHERE
	   [U].[ID] = @User_ID
END

END TRY

BEGIN CATCH
	ROLLBACK TRANSACTION [GetUserDetailsByUser_ID]
END CATCH
COMMIT TRANSACTION [GetUserDetailsByUser_ID]
END
GO

CREATE PROCEDURE [Log_LastLoginTime]
			@ID INT, 
			@Last_Login datetime
AS
BEGIN
	SET NOCOUNT ON;
	UPDATE [Users]
	SET                
		   [Users].Last_Login = @Last_Login
	FROM   [Users] WHERE [Users].ID = @ID 
END
GO
--*AccessLevel----------------------------------------

CREATE PROCEDURE [GetAllAccessLevel] 
AS
BEGIN
	SET NOCOUNT ON;
	SELECT
		[ID],        
		[Level]			
	FROM [AccessLevel] WHERE [Level] != 'Patient'
END
GO

CREATE PROCEDURE [GetAccessLevelById] 
		@ID INT
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 
	   [ID]
      ,[Level]				
  FROM [dbo].[AccessLevel]
  WHERE [ID] = @ID
END
GO
--*GetAllInvoices----------------------------------------

CREATE PROCEDURE [GetAllInvoices] 
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 
	   Invoice.[ID]
      ,Invoice.[Date]
	  ,Invoice.[InvoiceSummary]
      ,Invoice.[Total]
	  ,Invoice.[BalanceOwing]
	  ,Invoice.[PaidStatus]
      ,Invoice.[Medical_Aid_ID]
	  ,Patient.[ID] AS 'Patient_ID'
	  ,Patient.[FirstName] AS 'Patient_FirstName'
	  ,Patient.[LastName] AS 'Patient_LastName'
	  ,Patient.[Email] AS 'Patient_Email'
	  ,Doctors.[ID] AS 'Doctor_ID'
	  ,Doctors.[FirstName] AS 'Doctor_FirstName'
	  ,Doctors.[LastName] AS 'Doctor_LastName'
	  ,Doctors.[Email] AS 'Doctor_Email'
	FROM [dbo].[Invoice]
	INNER JOIN [Patient] on [Patient].ID = Invoice.Patient_ID
	INNER JOIN [Doctors] on [Doctors].ID = Invoice.Doctor_ID
	ORDER BY Invoice.[ID] Desc
END
GO
--------------------------------------------

CREATE PROCEDURE [GetInvoiceByDoctorId] 
		@ID	INT
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 
	   [ID]
      ,[Date]
      ,[Total]
      ,[Medical_Aid_ID]
      ,[Patient_ID]
      ,[Doctor_ID]
	FROM  [DoConnect].[dbo].[Invoice]
	WHERE [Doctor_ID] = @ID
END
GO
-----------------------------------------
CREATE PROCEDURE [GetInvoiceById] 
		@ID	INT
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 
	   Invoice.ID
      ,Invoice.[Date]
	  ,Invoice.InvoiceSummary
      ,Invoice.Total
	  ,Invoice.AmountPaid 
	  ,Invoice.BalanceOwing
	  ,Invoice.PaidStatus
      ,Invoice.Medical_Aid_ID
	  ,Patient.ID AS 'Patient_ID'
	  ,Patient.FirstName AS 'Patient_FirstName'
	  ,Patient.LastName AS 'Patient_LastName'
	  ,Patient.Email AS 'Patient_Email'
	  ,Patient.Street_Address AS 'Patient_Street_Address'
	  ,Patient.Suburb AS 'Patient_Suburb'
	  ,Patient.City	AS 'Patient_City'
	  ,Patient.Country AS 'Patient_Country'
	  ,Patient.Cell_Number AS 'Patient_Phone_Number'
	  ,Doctors.ID AS 'Doctor_ID'
	  ,Doctors.FirstName AS 'Doctor_FirstName'
	  ,Doctors.LastName AS 'Doctor_LastName'
	  ,Doctors.Email AS 'Doctor_Email'
	  ,Practice.Name AS 'Practice_Name'
	  ,Practice.Street_Address AS 'Practice_Street_Address'
	  ,Practice.Suburb AS 'Practice_Suburb'
	  ,Practice.City	AS 'Practice_City'
	  ,Practice.Country AS 'Practice_Country'
	  ,Practice.Phone_Number AS 'Practice_Phone_Number'
	  ,Medical_Aid.Name AS 'Medical_Aid_Name'
	  ,Medical_Aid.[Address] AS 'Medical_Aid_Address'
	  ,Medical_Aid.Cell_Number AS 'Medical_Aid_Cell_Number'
	FROM [dbo].[Invoice]
	INNER JOIN [Patient] on [Patient].ID = Invoice.Patient_ID
	INNER JOIN [Doctors] on [Doctors].ID = Invoice.Doctor_ID
	INNER JOIN [Practice] on [Practice].ID = Doctors.Practice_ID
	INNER JOIN [Medical_Aid] on [Medical_Aid].ID = Patient.Medical_Aid_ID
	WHERE Invoice.[ID] = @ID
END
GO
-----------------------------------------

CREATE PROCEDURE [GetInvoiceByMedAidId] 
		@ID	INT
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 
	   [ID]
      ,[Date]
      ,[Total]
      ,[Medical_Aid_ID]
      ,[Patient_ID]
      ,[Doctor_ID]
	FROM 
	   [DoConnect].[dbo].[Invoice]
	WHERE
	   [Medical_Aid_ID] = @ID
END
GO
------------------------------------------

CREATE PROCEDURE [GetInvoiceByPatientId] 
		@ID	INT
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 
	   [ID]
      ,[Date]
      ,[Total]
      ,[Medical_Aid_ID]
      ,[Patient_ID]
      ,[Doctor_ID]
	FROM 
	   [DoConnect].[dbo].[Invoice]
	WHERE
	   [Patient_ID] = @ID
END
GO

CREATE PROCEDURE [GetAllDiagnosisByPatientID] 
		@ID	INT
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 
	   [Consultation].[Diagnosis]
      ,[Patient].ID AS 'Patient_ID'
	FROM  [Consultation]
	INNER JOIN [Patient] ON [Patient].ID = [Consultation].Patient_ID
	WHERE [Patient].ID = @ID
END
GO

CREATE PROCEDURE [InsertInvoice]
		@Date             nvarchar (50),
		@InvoiceSummary   nvarchar (500),
		@Total            money,
		@AmountPaid       money,
		@BalanceOwing     money,
		@PaidStatus       int,
		@Medical_Aid_ID   int,
		@Patient_ID       int,
		@Doctor_ID        int
AS
BEGIN
SET NOCOUNT ON;
	INSERT INTO [Invoice]
	(
		[Date],          
		[InvoiceSummary],
		[Total],      
		[AmountPaid],  
		[BalanceOwing], 
		[PaidStatus],    
		[Medical_Aid_ID],
		[Patient_ID],   
		[Doctor_ID]   
	)
	OUTPUT
		[inserted].[ID]
	VALUES
	(
		@Date           ,
		@InvoiceSummary ,
		@Total          ,
		@AmountPaid     ,
		@BalanceOwing   ,
		@PaidStatus     ,
		@Medical_Aid_ID ,
		@Patient_ID     ,
		@Doctor_ID      
	)
END
GO

CREATE PROCEDURE [DeleteInvoice]
		@ID           int
AS
BEGIN
SET NOCOUNT ON;
	DELETE FROM [Invoice] WHERE ID = @ID;
END
GO


--*Expenses----------------------------------------

CREATE PROCEDURE [dbo].[GetAllExpenses]
AS
BEGIN

SET NOCOUNT ON;
	SELECT        
		Expenses.[ID]
		,Expenses.[Description]
		,Expenses.[Date]
		,Expenses.[Amount]
		,Expenses.[User_ID]
		,Practice.[ID] AS 'Practice_ID'
		,Practice.[Name] AS 'Practice_Name'	
	FROM [dbo].[Expenses]
	INNER JOIN [Practice] on [Practice].ID = Expenses.Practice_ID
	ORDER BY [Expenses].[ID] Desc	
END
GO

CREATE PROCEDURE [dbo].[GetAllExpensesUsersDoc]
				@User_ID int
AS
BEGIN
SET NOCOUNT ON;
	SELECT        
		 Expenses.[ID]
		,Expenses.[User_ID]
		,CONCAT(Doctors.[FirstName],' ',Doctors.[LastName],': ',Doctors.[Email]) AS 'DoctorFullName'	
		FROM [dbo].[Expenses]
		INNER JOIN [Doctors] on [Doctors].[User_ID] = Expenses.[User_ID]
		WHERE [Doctors].[User_ID]  = @User_ID
		ORDER BY [Expenses].[ID] Desc	
END
GO

CREATE PROCEDURE [dbo].[GetAllExpensesUsersStaff]
				@User_ID int
AS
BEGIN
SET NOCOUNT ON;
	SELECT        
		 Expenses.[ID]
		,Expenses.[User_ID]
		,CONCAT(Staff.[FirstName],' ',Staff.[LastName],': ',Staff.[Email]) AS 'StaffFullName'		
		FROM [dbo].[Expenses]
		INNER JOIN [Staff] on [Staff].[User_ID] = Expenses.[User_ID]
		WHERE Staff.[User_ID]  = @User_ID
		ORDER BY [Expenses].[ID] Desc	
END
GO

CREATE PROCEDURE [dbo].[GetExpenseByID]
				@ID int
AS
BEGIN
SET NOCOUNT ON;
	SELECT        
		 Expenses.[ID]
		,Expenses.[Description]
		,Expenses.[Date]
		,Expenses.[Amount]
		,Expenses.[User_ID]
		,Practice.[ID] AS 'Practice_ID'
		,Practice.[Name] AS 'Practice_Name'	
	FROM [dbo].[Expenses]
	INNER JOIN [Practice] on [Practice].ID = Expenses.Practice_ID
	WHERE Expenses.[ID] = @ID
END
GO

CREATE PROCEDURE [dbo].[GetPracticeIDByUser_ID] 
		@User_ID int
AS
BEGIN
SET NOCOUNT ON;
BEGIN TRANSACTION [GetPracticeIDByUser_ID]
BEGIN TRY

IF EXISTS 
(
	SELECT        
		[D].[User_ID], 
		[P].[ID]
	FROM [Doctors] AS [D]
	INNER JOIN [Practice] as [P] ON [D].[Practice_ID] = [P].[ID]
	WHERE [D].[User_ID] = @User_ID
)
BEGIN
	SELECT        
		[D].[User_ID], 
		[P].[ID]
	FROM [Doctors] AS [D]
	INNER JOIN [Practice] as [P] ON [D].[Practice_ID] = [P].[ID]
	WHERE [D].[User_ID] = @User_ID
END

IF EXISTS 
(
	SELECT        
		[S].[User_ID], 
		[P].[ID]
	FROM [Staff] AS [S]
	INNER JOIN [Practice] as [P] ON [S].[Practice_ID] = [P].[ID]
	WHERE [S].[User_ID] = @User_ID
)
BEGIN
	SELECT        
		[S].[User_ID], 
		[P].[ID]
	FROM [Staff] AS [S]
	INNER JOIN [Practice] as [P] ON [S].[Practice_ID] = [P].[ID]
	WHERE [S].[User_ID] = @User_ID
END
END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION [GetPracticeIDByUser_ID]
END CATCH
END
GO

CREATE PROCEDURE [InsertExpense]
		@Description nvarchar(200),
		@Date nvarchar(50),
		@Amount nvarchar(200),
		@Practice_ID int,
		@User_ID int
AS
BEGIN
SET NOCOUNT ON;
	INSERT INTO [Expenses]
	(
		[Description],
		[Date],
		[Amount],
		[Practice_ID],
		[User_ID]  
	)
	OUTPUT
		[inserted].[ID]
	VALUES
	(
		@Description,
		@Date,
		@Amount,
		@Practice_ID,
		@User_ID  
	)
END
GO

CREATE PROCEDURE [dbo].[UpdateExpense] 
	   @ID INT,
       @Description NVARCHAR(200),
       @Amount NVARCHAR(200)
AS
BEGIN
SET NOCOUNT ON;
	UPDATE  [Expenses]
	SET 
			[Description] = @Description,
			[Amount] = @Amount
			FROM   [Expenses] WHERE ID = @ID 
END
GO

CREATE PROCEDURE [DeleteExpense]
		@ID           int
AS
BEGIN
SET NOCOUNT ON;
	DELETE FROM [Expenses] WHERE ID = @ID;
END
GO
---*Appointments------------------------------------------

CREATE PROCEDURE [dbo].[GetAllAppointments] 
AS
BEGIN
	SET NOCOUNT ON;
	SELECT  Appointments.ID AS 'Appointments_ID',
			Appointments.App_Status AS 'Appointments_App_Status', 
			Appointments.Date_Time AS 'Appointments_Date_Time', 
			Appointments.Details AS 'Appointments_Details',
			Patient.ID AS 'Patient_ID', 
			Patient.FirstName AS 'Patient_FirstName', 
			Patient.LastName AS 'Patient_LastName', 
			Patient.Cell_Number AS 'Patient_Cell_Number',		
			Patient.Email  AS 'Patient_Email', 
			Doctors.Email AS 'Doctors_Email', 
			Doctors.FirstName AS 'Doctors_FirstName', 
			Doctors.LastName AS 'Doctors_LastName',
			Doctors.ID AS 'Doctors_ID', 
			Doctors.Job_Title AS 'Doctors_Job_Title' ,
			Practice.ID AS 'Practice_ID',        
			Practice.Name AS 'Practice_Name', 
			Practice.Phone_Number AS 'Practice_Phone_Number', 
			Practice.Fax_Number AS 'Practice_Fax_Number', 
			CONCAT(Practice.Street_Address, Practice.Suburb, Practice.City, Practice.Country) AS 'Practice_Address'
	FROM    Appointments 
			INNER JOIN Patient ON Appointments.Patient_ID = Patient.ID 
			INNER JOIN Doctors ON Appointments.Doctor_ID = Doctors.ID
			INNER JOIN Practice ON Doctors.Practice_ID = Practice.ID WHERE Patient.DeletedStatus != 1
	ORDER BY Appointments.Date_Time Desc
END
GO
-------------------------------------------

CREATE PROCEDURE [dbo].[GetAppointmentById] 
		@AppId INT
AS
BEGIN
	SET NOCOUNT ON;
	SELECT  Appointments.ID AS 'Appointments_ID',
			Appointments.App_Status AS 'Appointments_App_Status', 
			Appointments.Date_Time AS 'Appointments_Date_Time', 
			Appointments.Details AS 'Appointments_Details',
			Patient.ID AS 'Patient_ID', 
			Patient.FirstName AS 'Patient_FirstName', 
			Patient.LastName AS 'Patient_LastName', 
			Patient.Cell_Number AS 'Patient_Cell_Number',		
			Patient.Email  AS 'Patient_Email', 
			Doctors.Email AS 'Doctors_Email', 
			Doctors.FirstName AS 'Doctors_FirstName', 
			Doctors.LastName AS 'Doctors_LastName',
			Doctors.ID AS 'Doctors_ID', 
			Doctors.Job_Title AS 'Doctors_Job_Title' ,
			Practice.ID AS 'Practice_ID',        
			Practice.Name AS 'Practice_Name', 
			Practice.Phone_Number AS 'Practice_Phone_Number', 
			Practice.Fax_Number AS 'Practice_Fax_Number', 
			CONCAT(Practice.Street_Address, Practice.Suburb, Practice.City, Practice.Country) AS 'Practice_Address'
	FROM    Appointments 
			INNER JOIN Patient ON Appointments.Patient_ID = Patient.ID 
			INNER JOIN Doctors ON Appointments.Doctor_ID = Doctors.ID
			INNER JOIN Practice ON Doctors.Practice_ID = Practice.ID
	WHERE Appointments.ID = @AppId AND Patient.DeletedStatus != 1
END
GO
------------------------------------------

CREATE PROCEDURE [InsertAppointment]
		@App_Status int,
		@Date_Time  nvarchar (50),
		@Details    nvarchar (50),
		@Patient_ID int,
		@Doctor_ID  int
AS
BEGIN
SET NOCOUNT ON;
	INSERT INTO [Appointments]
	(
		[App_Status],
		[Date_Time],
		[Details],
		[Patient_ID],
		[Doctor_ID]
	)
	OUTPUT
		[inserted].[ID]
	VALUES
	(
		@App_Status,
		@Date_Time,
		@Details,
		@Patient_ID,
		@Doctor_ID
	)
END
GO
---------------------------------------------
CREATE PROCEDURE [dbo].[UpdateAppointment] 
		@ID			int,
		@App_Status int,
		@Date_Time  nvarchar(50),
		@Details    nvarchar(50),
		@Patient_ID int,
		@Doctor_ID  int
AS
BEGIN 
      SET NOCOUNT ON 
		UPDATE       [Appointments]
		SET                
		 App_Status = @App_Status	
		,Date_Time = @Date_Time 
		,Details = @Details   	
		,Patient_ID = @Patient_ID	
		,Doctor_ID = @Doctor_ID 
	  FROM   [Appointments] WHERE ID = @ID   
END
GO
------------------------------------------------------
CREATE PROCEDURE [dbo].[DeleteAppointment] 
		@ID   INT
AS 
BEGIN 
     SET NOCOUNT ON 
	 DELETE [Appointments] FROM [Appointments] WHERE  [Appointments].ID = @ID
END
GO
------------------------------------------------------

CREATE PROCEDURE [NewUpdateDoctor] 
	@FirstName NVARCHAR(50),
	@LastName NVARCHAR(50),
	@Gender CHAR(1),
	@Address NVARCHAR(50),
	@PracticeID INT,
	@UserID INT,
	@JobTitle NVARCHAR(50)
AS
BEGIN
SET NOCOUNT ON;
	MERGE [Doctors] AS TARGET
	USING
	(
		SELECT
			@FirstName,
			@LastName,
			@Gender,
			@Address,
			@PracticeID,
			@UserID,
			@JobTitle
	)
	AS
	[SOURCE]
	(
		[FirstName], 
		[LastName], 
		[Gender], 
		[Address], 
		[Practice_ID], 
		[User_ID], 
		[Job_Title]
	)
	ON
	[TARGET].[User_ID] = [SOURCE].[User_ID]
	WHEN MATCHED THEN
	UPDATE
	SET
		[FirstName] = @FirstName, 
		[LastName] = @LastName, 
		[Gender] = @Gender, 
		[Address] = @Address, 
		[Practice_ID] = @PracticeID, 
		[User_ID] = @UserID, 
		[Job_Title] = @JobTitle
	WHEN NOT MATCHED THEN
	INSERT
	(
		[FirstName], 
		[LastName], 
		[Gender], 
		[Address], 
		[Practice_ID], 
		[User_ID], 
		[Job_Title]
	)
	VALUES        
	(
		@FirstName,
		@LastName,
		@Gender,
		@Address,
		@PracticeID,
		@UserID,
		@JobTitle
	);
END
GO
--*Staff---------------------------------------
CREATE PROCEDURE [GetAllStaff]
AS
BEGIN
	SET NOCOUNT ON;
	SELECT        
		Staff.ID,
		Staff.FirstName, 
		Staff.LastName, 
		Staff.ID_Number, 
		Staff.Gender, 
		Staff.DOB, 
		Staff.Phone, 
		Staff.Street_Address, 
		Staff.Suburb, 
		Staff.City, 
		Staff.Country, 
		Staff.Employee_Type, 
		Staff.Practice_ID, 
		Staff.[User_ID],
		Staff.Email, 
		Practice.ID AS 'PRACTICE_ID', 
		Practice.Name AS 'PRACTICE_Name'
	FROM	Practice 
	INNER JOIN Staff ON Practice.ID = Staff.Practice_ID	 WHERE Staff.DeletedStatus = 0 ORDER BY Staff.ID Desc
END
GO
-------------------------------------------

CREATE PROCEDURE [GetAllStaffById] 
		@ID INT
AS
BEGIN
	SET NOCOUNT ON;
	SELECT        
		Staff.ID,
		Staff.FirstName, 
		Staff.LastName, 
		Staff.ID_Number, 
		Staff.Gender, 
		Staff.DOB, 
		Staff.Phone, 
		Staff.Street_Address, 
		Staff.Suburb, 
		Staff.City, 
		Staff.Country, 
		Staff.Employee_Type, 
		Staff.Practice_ID, 
		Staff.[User_ID],
		Staff.Email, 
		Practice.ID AS 'PRACTICE_ID', 
		Practice.Name AS 'PRACTICE_Name'
	FROM	Practice 
	INNER JOIN Staff ON Practice.ID = Staff.Practice_ID
	WHERE Staff.[ID] = @ID AND Staff.DeletedStatus = 0
END
GO
------------------------------------------
CREATE PROCEDURE [GetNewUserID]
AS
BEGIN
	SET NOCOUNT ON;
	SELECT  TOP 1      
		ID,
		[Password], 
		Last_Login, 
		AccessLevel
	FROM Users ORDER BY ID DESC 
END
GO

CREATE PROCEDURE [InsertStaff]
		@FirstName		nvarchar(50),
		@LastName		nvarchar(50),
		@ID_Number		nvarchar(50),
		@Gender			char    (1) ,
		@DOB			nvarchar (50),
		@Phone			nvarchar (50),
		@Street_Address	nvarchar (50),
		@Suburb			nvarchar (50),
		@City			nvarchar (50),
		@Country		nvarchar (50),
		@Employee_Type	nvarchar (50),
		@Practice_ID	int,
		@User_ID	int,
		@Email			nvarchar (50)		
AS
BEGIN
SET NOCOUNT ON;
	INSERT INTO [Staff]
	(
		[FirstName],
		[LastName],
		[ID_Number],
		[Gender],
		[DOB],
		[Phone],
		[Street_Address],
		[Suburb],
		[City],
		[Country],
		[Employee_Type],
		[Practice_ID],
		[User_ID],
		[Email]
	)
	OUTPUT
		[inserted].[ID]
	VALUES   
	(
		@FirstName		,
		@LastName		,
		@ID_Number		,
		@Gender			,
		@DOB			,
		@Phone			,
		@Street_Address	,
		@Suburb			,
		@City			,
		@Country		,
		@Employee_Type	,
		@Practice_ID	,
		@User_ID,
		@Email			
	)
END
GO
-----------------------------------------------

CREATE PROCEDURE [dbo].[UpdateStaff] 
		@ID				int,
		@FirstName		nvarchar(50),
		@LastName		nvarchar(50),
		@ID_Number		nvarchar(50),
		@Gender			char    (1) ,
		@DOB			nvarchar (50),
		@Phone			nvarchar (50),
		@Street_Address	nvarchar (50),
		@Suburb			nvarchar (50),
		@City			nvarchar (50),
		@Country		nvarchar (50),
		@Employee_Type	nvarchar (50),
		@Practice_ID	int,
		@Email			nvarchar (50)

AS
BEGIN 
      SET NOCOUNT ON 
		UPDATE       [Staff]
		SET                
		 FirstName =	  @FirstName		
		,LastName =		  @LastName		
		,ID_Number =	  @ID_Number		
		,Gender =		  @Gender			
		,DOB =			  @DOB			
		,Phone =		  @Phone			
		,Street_Address = @Street_Address	
		,Suburb =		  @Suburb			
		,City =			  @City			
		,Country =		  @Country		
		,Employee_Type =  @Employee_Type	
		,Practice_ID =	  @Practice_ID	
		,Email =		  @Email

		FROM   [Staff] WHERE ID    = @ID     
END
GO	

CREATE PROCEDURE [dbo].[DeleteEmployee] 
		@User_ID int
AS
BEGIN
SET NOCOUNT ON;
	BEGIN TRANSACTION [DeleteEmployee]
		BEGIN TRY
			IF EXISTS 
			(
				SELECT [Staff].ID FROM [Staff]
				WHERE [Staff].[User_ID] = @User_ID
			)
			BEGIN
				UPDATE [Staff]
				SET    [DeletedStatus] = 1
				FROM   [Staff] WHERE [Staff].[User_ID] = @User_ID
			END

			IF EXISTS 
			(
				SELECT [Doctors].ID FROM [Doctors]
				WHERE [Doctors].[User_ID] = @User_ID
			)
			BEGIN
				UPDATE [Doctors]
				SET    [DeletedStatus] = 1
				FROM   [Doctors] WHERE [Doctors].[User_ID] = @User_ID
	
			END
		END TRY	
		BEGIN CATCH
			ROLLBACK TRANSACTION [DeleteEmployee]
		END CATCH
	COMMIT TRANSACTION [DeleteEmployee]
END
GO

--*MedicalAid----------------------------------
--*Doctors------------------------------------
CREATE PROCEDURE [GetAllDoctors]
AS
BEGIN
	SET NOCOUNT ON;
	SELECT  Doctors.*, CONCAT([FirstName],' ',[LastName],': ',[Email]) AS 'DoctorFullName'			
	FROM    Doctors WHERE Doctors.DeletedStatus = 0 ORDER BY DoctorFullName Asc
END
GO
--*Patients------------------------------------
CREATE PROCEDURE [GetAllPatients]
AS
BEGIN
	SET NOCOUNT ON;
	SELECT
		 [ID]
		,[FirstName]
		,[LastName]
		,[ID_Number]      
		,[Cell_Number]      
		,[User_ID]
		,[Email]
		,[Medical_Aid_ID]
		,CONCAT([FirstName],' ', [LastName],': ',[Email]) AS 'PatientFullName'			
  FROM [dbo].[Patient] WHERE Patient.DeletedStatus = 0
  ORDER BY ID Desc
END
GO

CREATE PROCEDURE [GetAllPatientsForInvoice]
AS
BEGIN
	SET NOCOUNT ON;
	SELECT
		 [Patient].[ID]
		,[Patient].[FirstName]
		,[Patient].[LastName]
		,[Patient].[ID_Number]      
		,[Patient].[Cell_Number]      
		,[Patient].[User_ID]
		,[Patient].[Email]
		,[Patient].[Medical_Aid_ID]
		,CONCAT([Patient].[FirstName],' ', [Patient].[LastName],': ',[Patient].[Email]) AS 'PatientFullName'			
  FROM [dbo].[Patient] INNER JOIN Consultation ON Consultation.Patient_ID = Patient.ID WHERE Patient.DeletedStatus = 0
  ORDER BY PatientFullName Asc
END
GO
--------------------------------------------

CREATE PROCEDURE [GetPatientById] 
		@ID INT
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 
	   patient.[ID]
      ,patient.[FirstName]
      ,patient.[LastName]
      ,patient.[ID_Number]
      ,patient.[Gender]
      ,patient.[DOB]
      ,patient.[Cell_Number]
      ,patient.[Street_Address]
      ,patient.[Suburb]
      ,patient.[City]
      ,patient.[Country]
	  ,patient.[Allergies]
      ,patient.[PreviousIllnesses]
      ,patient.[PreviousMedication]
      ,patient.[RiskFactors]
      ,patient.[SocialHistory]
      ,patient.[FamilyHistory]                
      ,patient.[Medical_Aid_ID]
      ,patient.[Doctor_ID]
      ,patient.[User_ID]
	  ,patient.[Email]

      ,patient_Medical_Aid.[ID]					
      ,patient_Medical_Aid.[Scheme_Name]			
      ,patient_Medical_Aid.[Membership_Number]	
      ,patient_Medical_Aid.[Status]				
      ,patient_Medical_Aid.[Registration_Date]	
      ,patient_Medical_Aid.[Deregistration_Date]	
      ,patient_Medical_Aid.[Patient_ID]			
      ,patient_Medical_Aid.[Medical_Aid_ID]	
      
      ,prescription_DrugDetails.[ID] AS 'Prescription_DrugDetails_ID'				
      ,prescription_DrugDetails.[Prescription_ID] 	
      ,prescription_DrugDetails.[DrugName] 			
      ,prescription_DrugDetails.[Strength] 			
      ,prescription_DrugDetails.[IntakeRoute] 		
      ,prescription_DrugDetails.[Frequency] 		
      ,prescription_DrugDetails.[DispenseNumber] 	
      ,prescription_DrugDetails.[RefillNumber] 	
      
      ,prescription.[ID] AS 'Prescription_ID'
      ,prescription.[Date] 			
      ,prescription.[Patient_ID] 	
      ,prescription.[Doctor_ID] 	AS 'Prescribing_Doctor_ID'					
  FROM [dbo].[Patient] patient
  LEFT OUTER JOIN  [dbo].[Patient_Medical_Aid] patient_Medical_Aid
  ON	patient.[ID] = patient_Medical_Aid.[Patient_ID]
  LEFT OUTER JOIN  [dbo].Prescription prescription
  ON	patient.[ID] = prescription.[Patient_ID]
  LEFT OUTER JOIN  [dbo].Prescription_DrugDetails prescription_DrugDetails
  ON	prescription.[ID] = prescription_DrugDetails.[Prescription_ID]
  WHERE patient.[ID] = @ID AND Patient.DeletedStatus = 0
END
GO
------------------------------------------

CREATE PROCEDURE [dbo].[NewUpdatePatient] 

	    @FirstName NVARCHAR(50),
		@LastName NVARCHAR(50),
		@ID_Number NVARCHAR(50),
		@Gender CHAR(1),
		@DOB NVARCHAR(50),
		@Cell_Number NVARCHAR(50),
		@Street_Address NVARCHAR(50),
		@Suburb NVARCHAR(50),
		@City NVARCHAR(50),
		@Country NVARCHAR(50),
		@Medical_Aid_ID INT,
		@Doctor_ID INT,
		@User_ID INT
AS
BEGIN
	SET NOCOUNT ON;
    MERGE [Patient] AS TARGET
	USING
	(
		SELECT
		    @FirstName,
			@LastName,
			@ID_Number,
			@Gender,
			@DOB,
			@Cell_Number,
			@Street_Address,
			@Suburb,
			@City,
			@Country,
			@Medical_Aid_ID,
			@Doctor_ID,
			@User_ID
	)
	AS
    [SOURCE]
	(
       [FirstName]
      ,[LastName]
      ,[ID_Number]
      ,[Gender]
      ,[DOB]
      ,[Cell_Number]
      ,[Street_Address]
      ,[Suburb]
      ,[City]
      ,[Country]
      ,[Medical_Aid_ID]
      ,[Doctor_ID]
      ,[User_ID]
	)
	ON
		[TARGET].[User_ID] = [SOURCE].[User_ID]
	WHEN MATCHED THEN
	UPDATE
	SET
	   [FirstName] = @FirstName
      ,[LastName] = @LastName
      ,[ID_Number] = @ID_Number
      ,[Gender] = @Gender
      ,[DOB] = @DOB
      ,[Cell_Number] = @Cell_Number
      ,[Street_Address] = @Street_Address
      ,[Suburb] = @Suburb
      ,[City] = @City
      ,[Country] = @Country
	WHEN NOT MATCHED THEN
	INSERT
	(
       [FirstName]
      ,[LastName]
      ,[ID_Number]
      ,[Gender]
      ,[DOB]
      ,[Cell_Number]
      ,[Street_Address]
      ,[Suburb]
      ,[City]
      ,[Country]
      ,[Medical_Aid_ID]
      ,[Doctor_ID]
      ,[User_ID]
	)
	VALUES        
	(
		@FirstName,
		@LastName,
		@ID_Number,
		@Gender,
		@DOB,
		@Cell_Number,
		@Street_Address,
		@Suburb,
		@City,
		@Country,
		@Medical_Aid_ID,
		@Doctor_ID,
		@User_ID
	);
END
GO

-------------------------------------------------------------
CREATE PROCEDURE [GetMedicalRecord] 
		@ID INT
AS
BEGIN
	SET NOCOUNT ON;
	SELECT   Patient.ID
			,Patient.FirstName
			,Patient.LastName
			,Patient.ID_Number
			,Patient.Gender
			,Patient.DOB
			,Patient.Cell_Number
			,Patient.Street_Address
			,Patient.Suburb
			,Patient.City
			,Patient.Country
			,Patient.Medical_Aid_ID
			,Patient.Doctor_ID
			,Patient.[User_ID]
			,Patient.Allergies
			,Patient.PreviousIllnesses
			,Patient.PreviousMedication
			,Patient.RiskFactors
			,Patient.SocialHistory
			,Patient.FamilyHistory
			,Patient.Email
			,Patient_Medical_Aid.ID AS 'Patient_Medical_Aid_ID'
			,Patient_Medical_Aid.Scheme_Name
			,Patient_Medical_Aid.Membership_Number
			,Patient_Medical_Aid.[Status]
			,Patient_Medical_Aid.Registration_Date
			,Patient_Medical_Aid.Deregistration_Date
			,Patient_Medical_Aid.Patient_ID
			,Patient_Medical_Aid.Medical_Aid_ID AS 'Patient_Medical_Aid_Medical_Aid_ID'
			,Medical_Aid.Name
FROM         Medical_Aid 
			 INNER JOIN Patient ON Medical_Aid.ID = Patient.Medical_Aid_ID 
			 INNER JOIN Patient_Medical_Aid ON Medical_Aid.ID = Patient_Medical_Aid.Medical_Aid_ID
WHERE        Patient.ID = @ID AND Patient_Medical_Aid.Patient_ID = @ID AND Patient.DeletedStatus = 0
END
GO

CREATE PROCEDURE [InsertMedicalRecord]--InsertPaient
		@Doctor_ID                             int,
		@User_ID							   int,
		@FirstName                             nvarchar(50),
		@LastName                              nvarchar(50),
		@Email                                 nvarchar(50),
		@ID_Number                             nvarchar(50),
		@Cell_Number                           nvarchar(50),
		@DOB                                   nvarchar(50),
		@Gender                                char(1),
		@Street_Address                        nvarchar(50),
		@Suburb                                nvarchar(50),
		@City                                  nvarchar(50),
		@Country                               nvarchar(50),
		@Patient_Medical_Aid_Medical_Aid_ID    int,		
		@Allergies                             nvarchar(500),
		@PreviousIllnesses                     nvarchar(500),
		@PreviousMedication                    nvarchar(500),
		@RiskFactors                           nvarchar(500),
		@SocialHistory                         nvarchar(500),
		@FamilyHistory                         nvarchar(500)
		
AS
BEGIN
SET NOCOUNT ON;
	INSERT INTO [Patient]
	(		
		 [FirstName]
		,[LastName]		
		,[ID_Number]
		,[Gender]
		,[DOB]
		,[Cell_Number]		
		,[Street_Address]
		,[Suburb]
		,[City]
		,[Country]
		,[Medical_Aid_ID]
		,[Doctor_ID]
		,[User_ID]
		,[Allergies]
		,[PreviousIllnesses]
		,[PreviousMedication]
		,[RiskFactors]
		,[SocialHistory]
		,[FamilyHistory]
		,[Email]		
	)
	OUTPUT
		[inserted].[ID]
	VALUES   
	(
		 @FirstName                          
		,@LastName                  
		,@ID_Number
		,@Gender 
		,@DOB                         
		,@Cell_Number                        
		,@Street_Address                     
		,@Suburb                             
		,@City                               
		,@Country                            
		,@Patient_Medical_Aid_Medical_Aid_ID 
		,@Doctor_ID   
		,@User_ID                       
		,@Allergies                          
		,@PreviousIllnesses                  
		,@PreviousMedication                 
		,@RiskFactors                        
		,@SocialHistory                      
		,@FamilyHistory  
		,@Email                    
	)
END
GO

CREATE PROCEDURE [InsertPatient_Medical_Aid]
			@Patient_ID                            int,
			@Patient_Medical_Aid_Medical_Aid_ID    int,
			@Scheme_Name                           nvarchar(50),
			@Membership_Number                     nvarchar(50),
			@Registration_Date                     nvarchar(50),
			@Deregistration_Date                   nvarchar(50),
			@Status                                bit
AS
BEGIN
SET NOCOUNT ON;
	INSERT INTO [Patient_Medical_Aid]
		(
		     [Scheme_Name]
			,[Membership_Number]
			,[Status]
			,[Registration_Date]
			,[Deregistration_Date]
			,[Patient_ID]
			,[Medical_Aid_ID]
		)
		OUTPUT
			[inserted].[ID]
		VALUES   
		(
			@Scheme_Name,
			@Membership_Number,
			@Status,
			@Registration_Date,
			@Deregistration_Date,
			@Patient_ID,
			@Patient_Medical_Aid_Medical_Aid_ID
		)
END
GO

CREATE PROCEDURE [dbo].[UpdateMedicalRecord] 
			@Patient_ID           int,
			@FirstName           nvarchar(50),
			@LastName            nvarchar(50),
			@Email               nvarchar(50),
			@ID_Number           nvarchar(50),
			@Cell_Number         nvarchar(50),
			@DOB                 nvarchar(50),
			@Gender              nvarchar(50),
			@Street_Address      nvarchar(50),
			@Suburb              nvarchar(50),
			@City                nvarchar(50),
			@Country             nvarchar(50),
			@Patient_Medical_Aid_Medical_Aid_ID       int,
			@Scheme_Name         nvarchar(50),
			@Membership_Number   nvarchar(50),
			@Registration_Date   nvarchar(50),
			@Deregistration_Date nvarchar(50),
			@Allergies           nvarchar(50),
			@PreviousIllnesses   nvarchar(50),
			@PreviousMedication  nvarchar(50),
			@RiskFactors         nvarchar(50),
			@SocialHistory       nvarchar(50),
			@FamilyHistory       nvarchar(50)		
AS
BEGIN 
      SET NOCOUNT ON 
		UPDATE       [Patient]
		SET                       
		  FirstName            = @FirstName           
		 ,LastName             = @LastName            
		 ,Email                = @Email               
		 ,ID_Number            = @ID_Number           
		 ,Cell_Number          = @Cell_Number         
		 ,DOB                  = @DOB                 
		 ,Gender               = @Gender              
		 ,Street_Address       = @Street_Address      
		 ,Suburb               = @Suburb              
		 ,City                 = @City                
		 ,Country              = @Country             
		 ,Medical_Aid_ID = @Patient_Medical_Aid_Medical_Aid_ID		 
		 ,Allergies            = @Allergies           
		 ,PreviousIllnesses    = @PreviousIllnesses   
		 ,PreviousMedication   = @PreviousMedication  
		 ,RiskFactors          = @RiskFactors         
		 ,SocialHistory        = @SocialHistory       
		 ,FamilyHistory        = @FamilyHistory       
		FROM   [Patient] WHERE ID = @Patient_ID   
		
		UPDATE       [Patient_Medical_Aid]
		SET                       
		 Scheme_Name          = @Scheme_Name        
		,Membership_Number    = @Membership_Number   
		,Registration_Date    = @Registration_Date   
		,Deregistration_Date  = @Deregistration_Date  
		,Medical_Aid_ID		= @Patient_Medical_Aid_Medical_Aid_ID
	    FROM   [Patient_Medical_Aid] WHERE Patient_ID = @Patient_ID   
END
GO	

CREATE PROCEDURE [dbo].[DeletePatient] 
			@ID        int		
AS
BEGIN 
    SET NOCOUNT ON 
		UPDATE  [Patient]
	SET        [Patient].DeletedStatus = 1 WHERE Patient.ID = @ID		  
END
GO	
--------------------------------------------------------------------------------------------------

CREATE PROCEDURE [GetConsultationNotes] 
		@ID INT
AS
BEGIN
	SET NOCOUNT ON;
	SELECT        
	 Patient.ID							AS 'Patient_ID'
	,Patient.FirstName					AS 'Patient_FirstName'
	,Patient.LastName					AS 'Patient_LastName'
	,Doctors.FirstName					AS 'Doctors_FirstName'
	,Doctors.LastName					AS 'Doctors_LastName'
	,Doctors.Email						AS 'Doctors_Email'
	,Doctors.ID							AS 'Doctors_ID'
	,Consultation.ID					AS 'Consultation_ID'
	,Consultation.Patient_ID		    AS 'Consultation_Patient_ID'
	,Consultation.Doctor_ID			    AS 'Consultation_Doctor_ID'
	,Consultation.[Date]			    AS 'Consultation_Date'
	,Consultation.ReasonForConsultation AS 'Consultation_ReasonForConsultation'
	,Consultation.Symptoms			    AS 'Consultation_Symptoms'
	,Consultation.ClinicalFindings	    AS 'Consultation_ClinicalFindings'
	,Consultation.Diagnosis			    AS 'Consultation_Diagnosis'
	,Consultation.TestResultSummary	    AS 'Consultation_TestResultSummary'
	,Consultation.TreatmentPlan		    AS 'Consultation_TreatmentPlan'
	,Consultation.Presciption_ID	    AS 'Consultation_Presciption_ID'
	,Consultation.Referral_ID		    AS 'Consultation_Referral_ID'
	,Patient_Consultation.ID		    AS 'Patient_Consultation_ID'
	,Patient_Consultation.Patient_ID    AS 'Patient_Consultation_Patient_ID'
	FROM	Consultation INNER JOIN
			Doctors ON Consultation.Doctor_ID = Doctors.ID INNER JOIN
			Patient ON Consultation.Patient_ID = Patient.ID INNER JOIN
			Patient_Consultation ON Consultation.ID = Patient_Consultation.ID
	WHERE Patient.ID = @ID AND Patient.DeletedStatus = 0 AND [Consultation].DeletedStatus = 0 ORDER BY Consultation.[Date] Desc
END
GO
------------------------------------------
CREATE PROCEDURE [InsertPatient_Consultation]
		--@ID				 int,
		@Patient_ID		 int
		
AS
BEGIN
SET NOCOUNT ON;
	INSERT INTO [Patient_Consultation]
	(
		--[ID],
		[Patient_ID]
	)
	OUTPUT
		[inserted].[ID]
	VALUES   
	(
		--@ID,
		@Patient_ID
	)
END
GO

CREATE PROCEDURE [InsertConsultationNote]
		@Patient_ID				 int,
		@Doctor_ID				 int,
		@ReasonForConsultation	 nvarchar(50),
		@Symptoms				 nvarchar(50),
		@ClinicalFindings		 nvarchar(50),
		@Diagnosis				 nvarchar(50),
		@TestResultSummary		 nvarchar(50),
		@TreatmentPlan			 nvarchar(50),
		@Presciption_ID			 int,
		@Referral_ID			 int
AS
BEGIN
SET NOCOUNT ON;
	INSERT INTO [Consultation]
	(
		[Patient_ID],
		[Doctor_ID],
		[Date],
		[ReasonForConsultation],
		[Symptoms],
		[ClinicalFindings],
		[Diagnosis],
		[TestResultSummary],
		[TreatmentPlan],
		[Presciption_ID],
		[Referral_ID]
	)
	OUTPUT
		[inserted].[ID]
	VALUES   
	(
		@Patient_ID				,
		@Doctor_ID				,
		SYSDATETIME()			,
		@ReasonForConsultation	,
		@Symptoms				,
		@ClinicalFindings		,
		@Diagnosis				,
		@TestResultSummary		,
		@TreatmentPlan			,
		@Presciption_ID			,
		@Referral_ID
	)
END
GO

CREATE PROCEDURE [dbo].[UpdateConsultationNote] 
		@ID								int,
		@ReasonForConsultation		 nvarchar(200),
		@Symptoms					 nvarchar(200),
		@ClinicalFindings			 nvarchar(200),
		@Diagnosis					 nvarchar(200),
		@TestResultSummary			 nvarchar(200),
		@TreatmentPlan				 nvarchar(200)
AS
BEGIN 
      SET NOCOUNT ON 
		UPDATE       [Consultation]
		SET                
		 ReasonForConsultation		=@ReasonForConsultation	
		,Symptoms					=@Symptoms				
		,ClinicalFindings			=@ClinicalFindings		
		,Diagnosis					=@Diagnosis				
		,TestResultSummary			=@TestResultSummary		
		,TreatmentPlan				=@TreatmentPlan			
		FROM   [Consultation] WHERE [Consultation].ID = @ID;  
END
GO	

CREATE PROCEDURE [dbo].[DeleteConsultation] 
			@ID        int		
AS
BEGIN 
    SET NOCOUNT ON 
		UPDATE [Consultation]
		SET    [Consultation].DeletedStatus = 1		
		FROM   [Consultation] WHERE [Consultation].ID = @ID;  
END
GO

--*Prescription---------------------------------------
CREATE PROCEDURE [GetPrescription]
		@ID INT		
AS
BEGIN
	SET NOCOUNT ON;
	SELECT        
		 Patient.ID AS 'Patient_ID'
		,Patient.FirstName AS 'Patient_FirstName'
		,Patient.LastName AS 'Patient_LastName'
		,Patient.DOB AS 'Patient_DOB'
		,Doctors.ID AS 'Doctors_ID'
		,Doctors.FirstName AS 'Doctors_FirstName'
		,Doctors.LastName AS 'Doctors_LastName'
		,Prescription_DrugDetails.ID AS 'Prescription_DrugDetails_ID'
		,Prescription_DrugDetails.Prescription_ID AS 'Prescription_DrugDetails_Prescription_ID'
		,Prescription_DrugDetails.DrugName AS 'Prescription_DrugDetails_DrugName'
		,Prescription_DrugDetails.Strength AS 'Prescription_DrugDetails_Strength'
		,Prescription_DrugDetails.IntakeRoute AS 'Prescription_DrugDetails_IntakeRoute'
		,Prescription_DrugDetails.Frequency AS 'Prescription_DrugDetails_Frequency'
		,Prescription_DrugDetails.DispenseNumber AS 'Prescription_DrugDetails_DispenseNumber'
		,Prescription_DrugDetails.RefillNumber AS 'Prescription_DrugDetails_RefillNumber'
		,Prescription.ID AS 'Prescription_ID'
		,Prescription.[Date] AS 'Prescription_Date'		
		,Consultation.ClinicalFindings AS 'Consultation_ClinicalFindings'
		,Consultation.Diagnosis AS 'Consultation_Diagnosis'
FROM     Consultation INNER JOIN
        Doctors ON Consultation.Doctor_ID = Doctors.ID INNER JOIN
        Patient ON Consultation.Patient_ID = Patient.ID INNER JOIN
        Prescription ON Prescription.ID = Consultation.Presciption_ID INNER JOIN
        Prescription_DrugDetails ON Consultation.Presciption_ID = Prescription_DrugDetails.Prescription_ID
		WHERE  Patient.ID = @ID AND Patient.DeletedStatus = 0 ORDER BY Prescription.ID Desc
END
GO

CREATE PROCEDURE [InsertPrescription]
		@Patient_ID				 int,
		@Doctor_ID				 int
AS
BEGIN
SET NOCOUNT ON;
	INSERT INTO [Prescription]
	(
		[Date],
		[Patient_ID],
		[Doctor_ID]
	)
	OUTPUT
		[inserted].[ID]
	VALUES   
	(
		SYSDATETIME(),
		@Patient_ID,
		@Doctor_ID				
	)
END
GO

CREATE PROCEDURE [InsertPrescription_DrugDetails]
		@Prescription_ID int,
		@DrugName		 nvarchar(200),
		@Strength		 nvarchar(15),
		@IntakeRoute	 nvarchar(50),
		@Frequency		 nvarchar(50),
		@DispenseNumber	 int,
		@RefillNumber	 int,
		@Consultation_ID int
AS
BEGIN
SET NOCOUNT ON;
	INSERT INTO [Prescription_DrugDetails]
	(		
		[Prescription_ID],
		[DrugName],
		[Strength],		
		[IntakeRoute],	
		[Frequency],	
		[DispenseNumber],
		[RefillNumber]
	)
	OUTPUT
		[inserted].[ID]
	VALUES   
	(
		@Prescription_ID,
		@DrugName		,
		@Strength		,
		@IntakeRoute	,
		@Frequency		,
		@DispenseNumber	,
		@RefillNumber	
	)

	UPDATE     [Consultation]
		SET                
		Consultation.Presciption_ID	= @Prescription_ID	
		FROM   [Consultation] WHERE Consultation.ID = @Consultation_ID    
END
GO

CREATE PROCEDURE [dbo].[UpdatePrescription] 
		@Prescription_ID int,
		@DrugName		 nvarchar(200),
		@Strength		 nvarchar(15),
		@IntakeRoute	 nvarchar(50),
		@Frequency		 nvarchar(50),
		@DispenseNumber	 int,
		@RefillNumber	 int,
		@Diagnosis		 nvarchar(200)
AS
BEGIN 
      SET NOCOUNT ON 
		UPDATE       [Prescription_DrugDetails]
		SET                
		 DrugName		 = @DrugName		
		,Strength		 = @Strength		
		,IntakeRoute	 = @IntakeRoute	
		,Frequency		 = @Frequency		
		,DispenseNumber	 = @DispenseNumber	
		,RefillNumber	 = @RefillNumber	
		FROM   [Prescription_DrugDetails] WHERE Prescription_DrugDetails.Prescription_ID = @Prescription_ID 
		
		UPDATE       [Consultation]
		SET                
		 Diagnosis		 = @Diagnosis	
		FROM   [Consultation] WHERE Consultation.Presciption_ID = @Prescription_ID    
END
GO	

CREATE PROCEDURE [dbo].[DeletePrescription] 
			@ID        int		
AS
BEGIN 
    SET NOCOUNT ON 
			
		
		IF EXISTS 
		(
			SELECT [Prescription_DrugDetails].Prescription_ID FROM [Prescription_DrugDetails]
			WHERE [Prescription_DrugDetails].Prescription_ID = @ID
		)
		BEGIN
			DELETE  [Prescription_DrugDetails] WHERE [Prescription_DrugDetails].Prescription_ID = @ID
			DELETE  [Prescription] WHERE [Prescription].ID = @ID
		END	  
END
GO	

--*Practices----------------------------------------

CREATE PROCEDURE [GetAllPractices] 
AS
BEGIN
	SET NOCOUNT ON;
	SELECT
		[ID],        
		[Name], 
		[Phone_Number], 
		[Fax_Number], 
		[Street_Address], 
		[Suburb], 
		[City], 
		[Country], 
		[Longitude], 
		[Latitude], 
		[Trading_Times]		
	FROM [Practice] WHERE [Practice].DeletedStatus = 0
END
GO
-------------------------------------------
CREATE PROCEDURE [GetPracticeById] 
		@ID INT
AS
BEGIN
	SET NOCOUNT ON;
	SELECT
		[ID],        
		[Name], 
		[Phone_Number], 
		[Fax_Number], 
		[Street_Address], 
		[Suburb], 
		[City], 
		[Country], 
		[Longitude], 
		[Latitude], 
		[Trading_Times]		
	FROM  [Practice]
	WHERE [ID] = @ID AND [Practice].DeletedStatus = 0
END
GO
------------------------------------------

CREATE PROCEDURE [dbo].[UpdatePractice] 
		@ID INT,
		@Name NVARCHAR(50),
		@Phone_Number NVARCHAR(50),
		@Fax_Number NVARCHAR(50),
		@Street_Address NVARCHAR(100),
		@Suburb NVARCHAR(50),
		@City NVARCHAR(50),
		@Country NVARCHAR(50),
		@Latitude NVARCHAR(50),
		@Longitude NVARCHAR(50),
		@Trading_Times NVARCHAR(100)
AS
BEGIN
	SET NOCOUNT ON;
    MERGE [Practice] AS TARGET
	USING
	(
		SELECT
			@ID,
			@Name,
			@Phone_Number,
			@Fax_Number,
			@Street_Address,
			@Suburb,
			@City,
			@Country,
			@Latitude,
			@Longitude,
			@Trading_Times
	)
	AS
    [SOURCE]
	(
		[ID],
      	[Name],
		[Phone_Number],
      	[Fax_Number],
      	[Street_Address],
      	[Suburb],
        [City],
        [Country],
        [Latitude],
        [Longitude],
        [Trading_Times]
	)
	ON
		[TARGET].[ID] = [SOURCE].[ID]
	WHEN MATCHED THEN
	UPDATE
	SET
      	[Name] = @Name,
		[Phone_Number] = @Phone_Number,
      	[Fax_Number] = @Fax_Number,
      	[Street_Address] = @Street_Address,
      	[Suburb] = @Suburb,
        [City] = @City,
        [Country] = @Country,
        [Latitude] = @Latitude,
        [Longitude] = @Longitude,
        [Trading_Times] = @Trading_Times
	WHEN NOT MATCHED THEN
	INSERT
	(
      	[Name],
		[Phone_Number],
      	[Fax_Number],
      	[Street_Address],
      	[Suburb],
        [City],
        [Country],
        [Latitude],
        [Longitude],
        [Trading_Times]
	)
	VALUES        
	(
		@Name,
		@Phone_Number,
		@Fax_Number,
		@Street_Address,
		@Suburb,
		@City,
		@Country,
		@Latitude,
		@Longitude,
		@Trading_Times
	);
END
GO

CREATE PROCEDURE [InsertPractice]
		@Name		   NVARCHAR (50),       
		@Phone_Number  NVARCHAR (50),
		@Fax_Number    NVARCHAR (50),
		@Street_Address NVARCHAR (100),
		@Suburb        NVARCHAR (50),
		@City          NVARCHAR (50),  
		@Country	   NVARCHAR (50),  
		@Latitude      NVARCHAR (50),
		@Longitude     NVARCHAR (50),
		@Trading_Times NVARCHAR (100)
AS
BEGIN
SET NOCOUNT ON;
	INSERT INTO [Practice]
	(
		[Name],			
		[Phone_Number] ,	
		[Fax_Number], 	
		[Street_Address],
		[Suburb], 		
		[City], 			
		[Country] ,		
		[Latitude] ,		
		[Longitude] ,	
		[Trading_Times] 
	)
	OUTPUT
		[inserted].[ID]
	VALUES   
	(
		@Name, 
		@Phone_Number,
		@Fax_Number,
		@Street_Address,
		@Suburb ,
		@City,
		@Country,
		@Latitude,
		@Longitude,
		@Trading_Times 
	)
END
GO
-----------------------------------------------
CREATE PROCEDURE [DeletePractice]
       @ID   INT
AS 
BEGIN 
     SET NOCOUNT ON 
     UPDATE [Practice]
	 SET                
			[Practice].[DeletedStatus] = 1	
     FROM   [Practice] WHERE  [Practice].ID = @ID
END
GO
--*Medicine_Inventory-----------------------------------------

CREATE PROCEDURE [GetAllMedicine_Inventory]
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 
	     [Medicine_Inventory].ID				 
		,[Medicine_Inventory].DrugName			 
		,[Medicine_Inventory].[Description]	 
		,[Medicine_Inventory].QuantityPurchased 
		,[Medicine_Inventory].PurchaseDate		 
		,[Medicine_Inventory].QuantityInStock	 
		,[Medicine_Inventory].ExpiryDate		 
		,[Medicine_Inventory].DrugConcentration 
		,[Medicine_Inventory].Practice_ID
		,[Practice].Name AS 'PracticeName'
	FROM [Medicine_Inventory] INNER JOIN  [Practice] ON [Practice].ID = [Medicine_Inventory].Practice_ID WHERE [Medicine_Inventory].[DeletedStatus] = 0 ORDER BY [Medicine_Inventory].ID Desc
END
GO

CREATE PROCEDURE [GetMedicine_InventoryById] 
		@ID INT
AS
BEGIN
	SET NOCOUNT ON;
	SELECT
		 [Medicine_Inventory].ID				 
		,[Medicine_Inventory].DrugName			 
		,[Medicine_Inventory].[Description]	 
		,[Medicine_Inventory].QuantityPurchased 
		,[Medicine_Inventory].PurchaseDate		 
		,[Medicine_Inventory].QuantityInStock	 
		,[Medicine_Inventory].ExpiryDate		 
		,[Medicine_Inventory].DrugConcentration 
		,[Medicine_Inventory].Practice_ID
		,[Practice].Name AS 'PracticeName'
	FROM [Medicine_Inventory] INNER JOIN  [Practice] ON [Practice].ID = [Medicine_Inventory].Practice_ID  WHERE [Medicine_Inventory].[DeletedStatus] = 0 AND [Medicine_Inventory].ID = @ID ORDER BY ID Desc
END
GO

CREATE PROCEDURE [dbo].[InsertMedicine_Inventory] 
		@DrugName NVARCHAR(200),
        @Description NVARCHAR(200), 
	    @QuantityPurchased INT,
        @PurchaseDate nvarchar(50),
        @QuantityInStock INT,
        @ExpiryDate nvarchar(50),
        @DrugConcentration NVARCHAR(200),
	    @Practice_ID INT
AS
BEGIN 
      SET NOCOUNT ON 
		INSERT INTO [Medicine_Inventory]
		( 
		    [DrugName]			
		   ,[Description]	
		   ,[QuantityPurchased]
		   ,[PurchaseDate]		
		   ,[QuantityInStock]	
		   ,[ExpiryDate]		
		   ,[DrugConcentration]
		   ,[Practice_ID]		
		)
		OUTPUT
			[inserted].[ID]
		VALUES
		(
		   @DrugName,
		   @Description,
		   @QuantityPurchased,
		   @PurchaseDate,
		   @QuantityInStock,
		   @ExpiryDate,
		   @DrugConcentration,
		   @Practice_ID
		)
END
GO

CREATE PROCEDURE [UpdateMedicine_Inventory] 
	   @ID INT,
       @DrugName NVARCHAR(200),
       @Description NVARCHAR(200),
       @QuantityInStock INT,
       @DrugConcentration NVARCHAR(200)
AS
BEGIN 
SET NOCOUNT ON 
	UPDATE       [Medicine_Inventory]	
	SET    
	   DrugName			 = @DrugName
	  ,[Description]	 = @Description
	  ,QuantityInStock	 = @QuantityInStock
	  ,DrugConcentration = @DrugConcentration
	   FROM   [Medicine_Inventory] WHERE [Medicine_Inventory].ID = @ID
END
GO

CREATE PROCEDURE [UpdateMedicine_InventoryQuantityInStock] 
	   @ID INT,
       @QuantityInStock INT
AS
BEGIN 
SET NOCOUNT ON 
	UPDATE       [Medicine_Inventory]
	SET    
	  QuantityInStock	 = @QuantityInStock
	FROM   [Medicine_Inventory] WHERE [Medicine_Inventory].ID = @ID;  
END
GO

CREATE PROCEDURE [dbo].[DeleteMedicine_Inventory] 
		@ID					int
AS
BEGIN 
      SET NOCOUNT ON 
		UPDATE       [Medicine_Inventory]
		SET                
		[DeletedStatus] = 1
		FROM   [Medicine_Inventory] WHERE [Medicine_Inventory].ID = @ID;  
END
GO
--------------------------------------------

CREATE PROCEDURE [GetMedical_Aid]
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 
	     ID
		,Name
		,Cell_Number
		,Fax_Number
		,Email_Address
		,[Address]
	FROM [Medical_Aid] WHERE [DeletedStatus] = 0 ORDER BY Name Asc
END
GO

CREATE PROCEDURE [GetAllMedicalAids]
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 
	     ID
		,Name
		,Cell_Number
		,Fax_Number
		,Email_Address
		,[Address]
	FROM [Medical_Aid] WHERE [DeletedStatus] = 0 ORDER BY ID Desc
END
GO

CREATE PROCEDURE [GetMedicalAidById] 
		@ID INT
AS
BEGIN
	SET NOCOUNT ON;
	SELECT
		 ID
		,Name
		,Cell_Number
		,Fax_Number
		,Email_Address
		,[Address]
	FROM [Medical_Aid] WHERE [DeletedStatus] = 0 AND ID = @ID ORDER BY ID Desc
END
GO

CREATE PROCEDURE [dbo].[UpdateMedicalAid] 
		@ID					int,
		@Name				nvarchar (50),
		@Cell_Number		nvarchar (50),
		@Fax_Number			nvarchar (50),
		@Email_Address		nvarchar (50),
		@Address			nvarchar (50)
AS
BEGIN 
      SET NOCOUNT ON 
		UPDATE       [Medical_Aid]
		SET                
		 Name				=@Name			
		,Cell_Number		=@Cell_Number	
		,Fax_Number			=@Fax_Number		
		,Email_Address		=@Email_Address	
		,[Address]			=@Address		
		FROM   [Medical_Aid] WHERE [Medical_Aid].ID = @ID;  
END
GO

CREATE PROCEDURE [InsertMedicalAid]
		@Name				nvarchar (50),
		@Cell_Number		nvarchar (50),
		@Fax_Number			nvarchar (50),
		@Email_Address		nvarchar (50),
		@Address			nvarchar (50)
AS
BEGIN
SET NOCOUNT ON;
	INSERT INTO [Medical_Aid]
	(
		[Name],
		[Cell_Number],
		[Fax_Number],
		[Email_Address],
		[Address]
	)
	OUTPUT
		[inserted].[ID]
	VALUES
	(
		@Name			 ,
		@Cell_Number	 ,
		@Fax_Number		 ,
		@Email_Address	 ,
		@Address
	)		 
END
GO

CREATE PROCEDURE [dbo].[DeleteMedicalAid] 
		@ID					int
AS
BEGIN 
      SET NOCOUNT ON 
		UPDATE       [Medical_Aid]
		SET                
		 [DeletedStatus] = 1
		FROM   [Medical_Aid] WHERE [Medical_Aid].ID = @ID;  
END
GO

--Messages--------------------------------------------------------------
CREATE PROCEDURE [GetAllMessages]
		@Receiver		int
AS
BEGIN
SET NOCOUNT ON;
	BEGIN TRANSACTION [GetAllMessages]
		BEGIN TRY
			IF EXISTS 
			(
				SELECT 
					 [Messages].ID
					,[Messages].Sender
					,[Messages].Receiver
					,[Messages].[Subject]
					,[Messages].[Description]
					,[Messages].[Date]
					,[Messages].[ReadStatus]
					,[Staff].Email 	  AS 'ReceiverEmail'
				FROM [Messages] 
				INNER JOIN Staff ON Staff.[User_ID] = [Messages].Receiver WHERE [Messages].Receiver = @Receiver
			)
			BEGIN
				SELECT 
					 [Messages].ID
					,[Messages].Sender
					,[Messages].Receiver
					,[Messages].[Subject]
					,[Messages].[Description]
					,[Messages].[Date]
					,[Messages].[ReadStatus]
					,[Staff].Email 	 AS 'ReceiverEmail'
				FROM [Messages]
				INNER JOIN Staff ON Staff.[User_ID] = [Messages].Receiver WHERE [Messages].Receiver = @Receiver ORDER BY [Messages].ID Desc
			END
			IF EXISTS 
			(
				SELECT 
					 [Messages].ID
					,[Messages].Sender
					,[Messages].Receiver
					,[Messages].[Subject]
					,[Messages].[Description]
					,[Messages].[Date]
					,[Messages].[ReadStatus]
					,[Doctors].Email 	AS 'ReceiverEmail'
				FROM [Messages]
				INNER JOIN [Doctors] ON [Doctors].[User_ID] = [Messages].Receiver WHERE [Messages].Receiver = @Receiver
			)
			BEGIN
				SELECT 
					 [Messages].ID
					,[Messages].Sender
					,[Messages].Receiver
					,[Messages].[Subject]
					,[Messages].[Description]
					,[Messages].[Date]
					,[Messages].[ReadStatus]
					,[Doctors].Email 	AS 'ReceiverEmail'
				FROM [Messages]
				INNER JOIN [Doctors] ON [Doctors].[User_ID] = [Messages].Receiver WHERE [Messages].Receiver = @Receiver ORDER BY [Messages].ID Desc
			END

			IF EXISTS 
			(
				SELECT 
					 [Messages].ID
					,[Messages].Sender
					,[Messages].Receiver
					,[Messages].[Subject]
					,[Messages].[Description]
					,[Messages].[Date]
					,[Messages].[ReadStatus]
					,[Patient].Email AS 'ReceiverEmail'
				FROM [Messages] 
				INNER JOIN [Patient] ON [Patient].[User_ID] = [Messages].Receiver WHERE [Messages].Receiver = @Receiver
			)
			BEGIN
				SELECT 
					 [Messages].ID
					,[Messages].Sender
					,[Messages].Receiver
					,[Messages].[Subject]
					,[Messages].[Description]
					,[Messages].[Date]
					,[Messages].[ReadStatus]
					,[Patient].Email AS 'ReceiverEmail'
				FROM [Messages] 
				INNER JOIN [Patient] ON [Patient].[User_ID] = [Messages].Receiver WHERE [Messages].Receiver = @Receiver ORDER BY [Messages].ID Desc
			END
		END TRY	
		BEGIN CATCH
			ROLLBACK TRANSACTION [GetAllMessages]
		END CATCH
	COMMIT TRANSACTION [GetAllMessages]
END
GO

CREATE PROCEDURE [GetMessageSender]
		@Sender		int
AS
BEGIN
SET NOCOUNT ON;
	BEGIN TRANSACTION [GetMessageSender]
		BEGIN TRY
			IF EXISTS 
			(
				SELECT 
					 [Messages].Sender
					,[Staff].Email 	  AS 'SenderEmail'
				FROM [Messages] 
				INNER JOIN Staff ON Staff.[User_ID] = [Messages].Sender WHERE [Messages].Sender = @Sender
			)
			BEGIN
				SELECT 
					 [Messages].Sender
					,[Staff].Email 	 AS 'SenderEmail'
				FROM [Messages]
				INNER JOIN Staff ON Staff.[User_ID] = [Messages].Sender WHERE [Messages].Sender = @Sender ORDER BY [Messages].ID Desc
			END
			IF EXISTS 
			(
				SELECT 
					 [Messages].Sender
					,[Doctors].Email 	AS 'SenderEmail'
				FROM [Messages]
				INNER JOIN [Doctors] ON [Doctors].[User_ID] = [Messages].Sender WHERE [Messages].Sender = @Sender
			)
			BEGIN
				SELECT 
					 [Messages].Sender
					,[Doctors].Email 	AS 'SenderEmail'
				FROM [Messages]
				INNER JOIN [Doctors] ON [Doctors].[User_ID] = [Messages].Sender WHERE [Messages].Sender = @Sender ORDER BY [Messages].ID Desc
			END

			IF EXISTS 
			(
				SELECT 
					 [Messages].Sender
					,[Patient].Email AS 'SenderEmail'
				FROM [Messages] 
				INNER JOIN [Patient] ON [Patient].[User_ID] = [Messages].Sender WHERE [Messages].Sender = @Sender
			)
			BEGIN
				SELECT 
					 [Messages].Sender
					,[Patient].Email AS 'SenderEmail'
				FROM [Messages] 
				INNER JOIN [Patient] ON [Patient].[User_ID] = [Messages].Sender WHERE [Messages].Sender = @Sender ORDER BY [Messages].ID Desc
			END
		END TRY	
		BEGIN CATCH
			ROLLBACK TRANSACTION [GetMessageSender]
		END CATCH
	COMMIT TRANSACTION [GetMessageSender]
END
GO

CREATE PROCEDURE [dbo].[NumOfUnReadMessages]
				 @Receiver		int
AS
BEGIN
SET NOCOUNT ON;
	BEGIN TRANSACTION [NumOfUnReadMessages]
		BEGIN TRY
			IF EXISTS 
			(
				SELECT 
					 [Messages].ID
				FROM [Messages] 
				INNER JOIN Staff ON Staff.[User_ID] = [Messages].Receiver WHERE [Messages].Receiver = @Receiver GROUP BY [Messages].ID
			)
			BEGIN
				SELECT 
					 [Messages].ID
					,[Messages].ReadStatus
				FROM [Messages]
				INNER JOIN Staff ON Staff.[User_ID] = [Messages].Receiver WHERE [Messages].Receiver = @Receiver GROUP BY [Messages].ID, [Messages].ReadStatus  ORDER BY [Messages].ID Desc  
			END
			IF EXISTS 
			(
				SELECT 
					 [Messages].ID
				FROM [Messages]
				INNER JOIN [Doctors] ON [Doctors].[User_ID] = [Messages].Receiver WHERE [Messages].Receiver = @Receiver
			)
			BEGIN
				SELECT 
					  [Messages].ID
					 ,[Messages].ReadStatus
				FROM [Messages]
				INNER JOIN [Doctors] ON [Doctors].[User_ID] = [Messages].Receiver WHERE [Messages].Receiver = @Receiver GROUP BY [Messages].ID, [Messages].ReadStatus ORDER BY [Messages].ID Desc
			END

			IF EXISTS 
			(
				SELECT 
					 [Messages].ID
				FROM [Messages] 
				INNER JOIN [Patient] ON [Patient].[User_ID] = [Messages].Receiver WHERE [Messages].Receiver = @Receiver
			)
			BEGIN
				SELECT 
					  [Messages].ID
					 ,[Messages].ReadStatus
				FROM [Messages] 
				INNER JOIN [Patient] ON [Patient].[User_ID] = [Messages].Receiver WHERE [Messages].Receiver = @Receiver GROUP BY [Messages].ID, [Messages].ReadStatus ORDER BY [Messages].ID Desc
			END
		END TRY	
		BEGIN CATCH
			ROLLBACK TRANSACTION [NumOfUnReadMessages]
		END CATCH
	COMMIT TRANSACTION [NumOfUnReadMessages]
END
GO

CREATE PROCEDURE [GetAllSentMessages]
		@Sender		int
AS
BEGIN
SET NOCOUNT ON;
	BEGIN TRANSACTION [GetAllSentMessages]
		BEGIN TRY
			IF EXISTS 
			(
				SELECT 
					 [Messages].ID
					,[Messages].Sender
					,[Messages].Receiver
					,[Messages].[Subject]
					,[Messages].[Description]
					,[Messages].[Date]
					,[Staff].Email 	  AS 'SenderEmail'
				FROM [Messages] 
				INNER JOIN Staff ON Staff.[User_ID] = [Messages].Sender	 WHERE [Messages].Sender = @Sender	
			)
			BEGIN
				SELECT 
					 [Messages].ID
					,[Messages].Sender
					,[Messages].Receiver
					,[Messages].[Subject]
					,[Messages].[Description]
					,[Messages].[Date]
					,[Staff].Email 	 AS 'SenderEmail'
				FROM [Messages]
				INNER JOIN Staff ON Staff.[User_ID] = [Messages].Sender WHERE [Messages].Sender = @Sender ORDER BY [Messages].ID Desc
			END
			IF EXISTS 
			(
				SELECT 
					 [Messages].ID
					,[Messages].Sender
					,[Messages].Receiver
					,[Messages].[Subject]
					,[Messages].[Description]
					,[Messages].[Date]
					,[Doctors].Email 	AS 'SenderEmail'
				FROM [Messages]
				INNER JOIN [Doctors] ON [Doctors].[User_ID] = [Messages].Sender WHERE [Messages].Sender = @Sender
			)
			BEGIN
				SELECT 
					 [Messages].ID
					,[Messages].Sender
					,[Messages].Receiver
					,[Messages].[Subject]
					,[Messages].[Description]
					,[Messages].[Date]
					,[Doctors].Email 	AS 'SenderEmail'
				FROM [Messages]
				INNER JOIN [Doctors] ON [Doctors].[User_ID] = [Messages].Sender WHERE [Messages].Sender = @Sender ORDER BY [Messages].ID Desc
			END

			IF EXISTS 
			(
				SELECT 
					 [Messages].ID
					,[Messages].Sender
					,[Messages].Receiver
					,[Messages].[Subject]
					,[Messages].[Description]
					,[Messages].[Date]
					,[Patient].Email AS 'SenderEmail'
				FROM [Messages] 
				INNER JOIN [Patient] ON [Patient].[User_ID] = [Messages].Sender WHERE [Messages].Sender = @Sender
			)
			BEGIN
				SELECT 
					 [Messages].ID
					,[Messages].Sender
					,[Messages].Receiver
					,[Messages].[Subject]
					,[Messages].[Description]
					,[Messages].[Date]
					,[Patient].Email AS 'SenderEmail'
				FROM [Messages] 
				INNER JOIN [Patient] ON [Patient].[User_ID] = [Messages].Sender WHERE [Messages].Sender = @Sender ORDER BY [Messages].ID Desc
			END
		END TRY	
		BEGIN CATCH
			ROLLBACK TRANSACTION [GetAllSentMessages]
		END CATCH
	COMMIT TRANSACTION [GetAllSentMessages]
END
GO

CREATE PROCEDURE [GetMessageReceiver]
		@Receiver		int
AS
BEGIN
SET NOCOUNT ON;
	BEGIN TRANSACTION [GetMessageReceiver]
		BEGIN TRY
			IF EXISTS 
			(
				SELECT 
					 [Messages].Receiver
					,[Staff].Email 	  AS 'ReceiverEmail'
				FROM [Messages] 
				INNER JOIN Staff ON Staff.[User_ID] = [Messages].Receiver WHERE [Messages].Receiver = @Receiver
			)
			BEGIN
				SELECT 
					 [Messages].Receiver
					,[Staff].Email 	 AS 'ReceiverEmail'
				FROM [Messages]
				INNER JOIN Staff ON Staff.[User_ID] = [Messages].Receiver WHERE [Messages].Receiver = @Receiver ORDER BY [Messages].ID Desc
			END
			IF EXISTS 
			(
				SELECT 
					 [Messages].Receiver
					,[Doctors].Email 	AS 'ReceiverEmail'
				FROM [Messages]
				INNER JOIN [Doctors] ON [Doctors].[User_ID] = [Messages].Receiver WHERE [Messages].Receiver = @Receiver
			)
			BEGIN
				SELECT 
					 [Messages].Receiver
					,[Doctors].Email 	AS 'ReceiverEmail'
				FROM [Messages]
				INNER JOIN [Doctors] ON [Doctors].[User_ID] = [Messages].Receiver WHERE [Messages].Receiver = @Receiver ORDER BY [Messages].ID Desc
			END

			IF EXISTS 
			(
				SELECT 
					 [Messages].Receiver
					,[Patient].Email AS 'ReceiverEmail'
				FROM [Messages] 
				INNER JOIN [Patient] ON [Patient].[User_ID] = [Messages].Receiver WHERE [Messages].Receiver = @Receiver
			)
			BEGIN
				SELECT 
					 [Messages].Sender
					,[Patient].Email AS 'ReceiverEmail'
				FROM [Messages] 
				INNER JOIN [Patient] ON [Patient].[User_ID] = [Messages].Receiver WHERE [Messages].Receiver = @Receiver ORDER BY [Messages].ID Desc
			END
		END TRY	
		BEGIN CATCH
			ROLLBACK TRANSACTION [GetMessageReceiver]
		END CATCH
	COMMIT TRANSACTION [GetMessageReceiver]
END
GO
-------------------------------------------------------------------
CREATE PROCEDURE [GetMessageById]
		@ID		INT
AS
BEGIN
SET NOCOUNT ON;
	BEGIN TRANSACTION [GetMessageById]
		BEGIN TRY
			IF EXISTS 
			(
				SELECT 
					 [Messages].ID
					,[Messages].Sender
					,[Messages].Receiver
					,[Messages].[Subject]
					,[Messages].[Description]
					,[Messages].[Date]
					,[Staff].Email 	  AS 'ReceiverEmail'
				FROM [Messages] 
				INNER JOIN Staff ON Staff.[User_ID] = [Messages].Receiver WHERE [Messages].ID = @ID
			)
			BEGIN
				SELECT 
					 [Messages].ID
					,[Messages].Sender
					,[Messages].Receiver
					,[Messages].[Subject]
					,[Messages].[Description]
					,[Messages].[Date]
					,[Staff].Email 	 AS 'ReceiverEmail'
				FROM [Messages]
				INNER JOIN Staff ON Staff.[User_ID] = [Messages].Receiver WHERE [Messages].ID = @ID ORDER BY [Messages].ID Desc
			END
			IF EXISTS 
			(
				SELECT 
					 [Messages].ID
					,[Messages].Sender
					,[Messages].Receiver
					,[Messages].[Subject]
					,[Messages].[Description]
					,[Messages].[Date]
					,[Doctors].Email 	AS 'ReceiverEmail'
				FROM [Messages]
				INNER JOIN [Doctors] ON [Doctors].[User_ID] = [Messages].Receiver WHERE [Messages].ID = @ID
			)
			BEGIN
				SELECT 
					 [Messages].ID
					,[Messages].Sender
					,[Messages].Receiver
					,[Messages].[Subject]
					,[Messages].[Description]
					,[Messages].[Date]
					,[Doctors].Email 	AS 'ReceiverEmail'
				FROM [Messages]
				INNER JOIN [Doctors] ON [Doctors].[User_ID] = [Messages].Receiver WHERE [Messages].ID = @ID ORDER BY [Messages].ID Desc
			END

			IF EXISTS 
			(
				SELECT 
					 [Messages].ID
					,[Messages].Sender
					,[Messages].Receiver
					,[Messages].[Subject]
					,[Messages].[Description]
					,[Messages].[Date]
					,[Patient].Email AS 'ReceiverEmail'
				FROM [Messages] 
				INNER JOIN [Patient] ON [Patient].[User_ID] = [Messages].Receiver WHERE [Messages].ID = @ID
			)
			BEGIN
				SELECT 
					 [Messages].ID
					,[Messages].Sender
					,[Messages].Receiver
					,[Messages].[Subject]
					,[Messages].[Description]
					,[Messages].[Date]
					,[Patient].Email AS 'ReceiverEmail'
				FROM [Messages] 
				INNER JOIN [Patient] ON [Patient].[User_ID] = [Messages].Receiver WHERE [Messages].ID = @ID ORDER BY [Messages].ID Desc
			END
		END TRY	
		BEGIN CATCH
			ROLLBACK TRANSACTION [GetMessageById]
		END CATCH
	COMMIT TRANSACTION [GetMessageById]
END
GO

CREATE PROCEDURE [dbo].[Update_MessageRead] 
		@ID			int
AS
BEGIN 
      SET NOCOUNT ON 
		UPDATE [Messages]
		SET    [Messages].ReadStatus = 0
	    FROM   [Messages] WHERE [Messages].ID = @ID   
END
GO

CREATE PROCEDURE [InsertMessage]
		@Sender			int,
		@Receiver		int,
		@Subject		nvarchar (200),
		@Description	nvarchar (200),
		@Date			nvarchar (50)
AS
BEGIN
SET NOCOUNT ON;
	INSERT INTO [Messages]
	(
		 [Sender]		
		,[Receiver]		
		,[Subject]		
		,[Description]	
		,[Date]			
	)
	OUTPUT
		[inserted].[ID]
	VALUES
	(
		@Sender		 ,
		@Receiver	 ,
		@Subject	 ,
		@Description ,
		@Date		
	)		 
END
GO

CREATE PROCEDURE [dbo].[DeleteMessage] 
		@ID					int
AS
BEGIN 
      SET NOCOUNT ON               
	  DELETE FROM [Messages] WHERE [Messages].ID = @ID;
END
GO

--#region Dashboard
CREATE PROCEDURE [GetRevenueSummary_Today] 
		@Practice_ID INT
AS
BEGIN
	SET NOCOUNT ON;
	SELECT
		Practice.ID AS 'Practice_ID'
	   ,Practice.Name AS 'Practice_Name'
	   ,Invoice.[Date]
	   ,Invoice.Patient_ID
	   ,Invoice.Total
	   ,Invoice.AmountPaid
	   ,Invoice.BalanceOwing
	FROM [Doctors] 
	INNER JOIN [Practice] ON [Practice].ID = [Doctors].Practice_ID
	INNER JOIN [Invoice] ON [Invoice].Doctor_ID = [Doctors].ID
	WHERE [Practice].ID = @Practice_ID AND [Invoice].[Date] = GETDATE();
END
GO

CREATE PROCEDURE [GetExpenses_Today] 
		@Practice_ID INT
AS
BEGIN
	SET NOCOUNT ON;
	SELECT
	     Expenses.Amount
	FROM [Practice]
	INNER JOIN [Expenses] ON [Expenses].Practice_ID = [Practice].ID
	WHERE [Practice].ID = @Practice_ID AND [Expenses].[Date] = GETDATE();
END
GO

CREATE PROCEDURE [GetRevenueSummary_Week] 
		@Practice_ID INT
AS
BEGIN
	SET NOCOUNT ON;
	SELECT
		Practice.ID AS 'Practice_ID'
	   ,Practice.Name AS 'Practice_Name'
	   ,Invoice.[Date]
	   ,Invoice.Patient_ID
	   ,Invoice.Total
	   ,Invoice.AmountPaid
	   ,Invoice.BalanceOwing
	FROM [Doctors] 
	INNER JOIN [Practice] ON [Practice].ID = [Doctors].Practice_ID
	INNER JOIN [Invoice] ON [Invoice].Doctor_ID = [Doctors].ID
	WHERE [Practice].ID = @Practice_ID AND [Invoice].[Date] >= dateadd(day, 1-datepart(dw, getdate()), CONVERT(date,getdate())) AND [Invoice].[Date] <  dateadd(day, 8-datepart(dw, getdate()), CONVERT(date,getdate()))
END
GO

CREATE PROCEDURE [GetExpenses_Week] 
		@Practice_ID INT
AS
BEGIN
	SET NOCOUNT ON;
	SELECT
		 Expenses.Amount
	FROM [Practice]
	INNER JOIN [Expenses] ON [Expenses].Practice_ID = [Practice].ID
	WHERE [Practice].ID = @Practice_ID AND [Expenses].[Date] >= dateadd(day, 1-datepart(dw, getdate()), CONVERT(date,getdate())) AND [Expenses].[Date] <  dateadd(day, 8-datepart(dw, getdate()), CONVERT(date,getdate()))
END
GO

CREATE PROCEDURE [GetRevenueSummary_Month] 
		@Practice_ID INT
AS
BEGIN
	SET NOCOUNT ON;
	SELECT
		Practice.ID AS 'Practice_ID'
	   ,Practice.Name AS 'Practice_Name'
	   ,Invoice.[Date]
	   ,Invoice.Patient_ID
	   ,Invoice.Total
	   ,Invoice.AmountPaid
	   ,Invoice.BalanceOwing
	FROM [Doctors] 
	INNER JOIN [Practice] ON [Practice].ID = [Doctors].Practice_ID
	INNER JOIN [Invoice] ON [Invoice].Doctor_ID = [Doctors].ID
	WHERE [Practice].ID = @Practice_ID 
	AND [Invoice].[Date] >= DATEADD(MONTH, DATEDIFF(MONTH, 0, GETDATE()), 0) AND [Invoice].[Date] < DATEADD(MONTH, DATEDIFF(MONTH, 0, GETDATE())+1, 0);
END
GO

CREATE PROCEDURE [GetExpenses_Month] 
		@Practice_ID INT
AS
BEGIN
	SET NOCOUNT ON;
	SELECT
		 Expenses.Amount
	FROM [Practice] 
	INNER JOIN [Expenses] ON [Expenses].Practice_ID = [Practice].ID
	WHERE [Practice].ID = @Practice_ID AND [Expenses].[Date] >= DATEADD(MONTH, DATEDIFF(MONTH, 0, GETDATE()), 0) AND [Expenses].[Date] < DATEADD(MONTH, DATEDIFF(MONTH, 0, GETDATE())+1, 0);
END
GO
--#region Consultation Stats
CREATE PROCEDURE [Consulations_Visits_4LastMonth] 
		@Practice_ID INT
AS
BEGIN
	SET NOCOUNT ON;
	SELECT
		 [Consultation].[Date]
		,[Practice].ID
	FROM [Practice] 
	INNER JOIN [Doctors] ON [Doctors].Practice_ID = [Practice].ID
	INNER JOIN [Consultation] ON [Consultation].Doctor_ID = [Doctors].ID
	WHERE [Practice].ID = @Practice_ID AND DATEPART(m, [Consultation].[Date]) = DATEPART(m, DATEADD(m, -4, getdate())) AND DATEPART(yyyy, [Consultation].[Date]) = DATEPART(yyyy, DATEADD(m, -4, getdate()))
END
GO

CREATE PROCEDURE [Consulations_Visits_3LastMonth] 
		@Practice_ID INT
AS
BEGIN
	SET NOCOUNT ON;
	SELECT
		 [Consultation].[Date]
		,[Practice].ID
	FROM [Practice] 
	INNER JOIN [Doctors] ON [Doctors].Practice_ID = [Practice].ID
	INNER JOIN [Consultation] ON [Consultation].Doctor_ID = [Doctors].ID
	WHERE [Practice].ID = @Practice_ID AND DATEPART(m, [Consultation].[Date]) = DATEPART(m, DATEADD(m, -3, getdate())) AND DATEPART(yyyy, [Consultation].[Date]) = DATEPART(yyyy, DATEADD(m, -3, getdate()))
END
GO

CREATE PROCEDURE [Consulations_Visits_2LastMonth] 
		@Practice_ID INT
AS
BEGIN
	SET NOCOUNT ON;
	SELECT
		 [Consultation].[Date]
		,[Practice].ID
	FROM [Practice] 
	INNER JOIN [Doctors] ON [Doctors].Practice_ID = [Practice].ID
	INNER JOIN [Consultation] ON [Consultation].Doctor_ID = [Doctors].ID
	WHERE [Practice].ID = @Practice_ID AND DATEPART(m, [Consultation].[Date]) = DATEPART(m, DATEADD(m, -2, getdate())) AND DATEPART(yyyy, [Consultation].[Date]) = DATEPART(yyyy, DATEADD(m, -2, getdate()))
	GROUP BY [Consultation].[Date], [Consultation].[Date], [Practice].ID
END
GO

CREATE PROCEDURE [Consulations_Visits_LastMonth] 
		@Practice_ID INT
AS
BEGIN
	SET NOCOUNT ON;
	SELECT
		 [Consultation].[Date]
		,[Practice].ID
	FROM [Practice] 
	INNER JOIN [Doctors] ON [Doctors].Practice_ID = [Practice].ID
	INNER JOIN [Consultation] ON [Consultation].Doctor_ID = [Doctors].ID
	WHERE [Practice].ID = @Practice_ID AND DATEPART(m, [Consultation].[Date]) = DATEPART(m, DATEADD(m, -1, getdate())) AND DATEPART(yyyy, [Consultation].[Date]) = DATEPART(yyyy, DATEADD(m, -1, getdate()))
END
GO

CREATE PROCEDURE [Consulations_Visits_CurrentMonth] 
		@Practice_ID INT
AS
BEGIN
	SET NOCOUNT ON;
	SELECT
		 [Consultation].[Date]
		,[Practice].ID
	FROM [Practice] 
	INNER JOIN [Doctors] ON [Doctors].Practice_ID = [Practice].ID
	INNER JOIN [Consultation] ON [Consultation].Doctor_ID = [Doctors].ID
	WHERE [Practice].ID = @Practice_ID AND DATEPART(m, [Consultation].[Date]) = DATEPART(m, DATEADD(m, 0, getdate())) AND DATEPART(yyyy, [Consultation].[Date]) = DATEPART(yyyy, DATEADD(m, 0, getdate()))
END
GO
--#region Appointment Stats
CREATE PROCEDURE [Appointments_Visits_4LastMonth] 
		@Practice_ID INT
AS
BEGIN
	SET NOCOUNT ON;
	SELECT
		 [Appointments].[Date_Time]
		,[Practice].ID
	FROM [Practice] 
	INNER JOIN [Doctors] ON [Doctors].Practice_ID = [Practice].ID
	INNER JOIN [Appointments] ON [Appointments].Doctor_ID = [Doctors].ID
	WHERE [Practice].ID = @Practice_ID AND DATEPART(m, [Appointments].[Date_Time]) = DATEPART(m, DATEADD(m, -4, getdate())) AND DATEPART(yyyy, [Appointments].[Date_Time]) = DATEPART(yyyy, DATEADD(m, -4, getdate()))
END
GO

CREATE PROCEDURE [Appointments_Visits_3LastMonth] 
		@Practice_ID INT
AS
BEGIN
	SET NOCOUNT ON;
	SELECT
		 [Appointments].[Date_Time]
		,[Practice].ID
	FROM [Practice] 
	INNER JOIN [Doctors] ON [Doctors].Practice_ID = [Practice].ID
	INNER JOIN [Appointments] ON [Appointments].Doctor_ID = [Doctors].ID
	WHERE [Practice].ID = @Practice_ID AND DATEPART(m, [Appointments].[Date_Time]) = DATEPART(m, DATEADD(m, -3, getdate())) AND DATEPART(yyyy, [Appointments].[Date_Time]) = DATEPART(yyyy, DATEADD(m, -3, getdate()))
END
GO

CREATE PROCEDURE [Appointments_Visits_2LastMonth] 
		@Practice_ID INT
AS
BEGIN
	SET NOCOUNT ON;
	SELECT
		 [Appointments].[Date_Time]
		,[Practice].ID
	FROM [Practice] 
	INNER JOIN [Doctors] ON [Doctors].Practice_ID = [Practice].ID
	INNER JOIN [Appointments] ON [Appointments].Doctor_ID = [Doctors].ID
	WHERE [Practice].ID = @Practice_ID AND DATEPART(m, [Appointments].[Date_Time]) = DATEPART(m, DATEADD(m, -2, getdate())) AND DATEPART(yyyy, [Appointments].[Date_Time]) = DATEPART(yyyy, DATEADD(m, -2, getdate()))
END
GO

CREATE PROCEDURE [Appointments_Visits_LastMonth] 
		@Practice_ID INT
AS
BEGIN
	SET NOCOUNT ON;
	SELECT
		 [Appointments].[Date_Time]
		,[Practice].ID
	FROM [Practice] 
	INNER JOIN [Doctors] ON [Doctors].Practice_ID = [Practice].ID
	INNER JOIN [Appointments] ON [Appointments].Doctor_ID = [Doctors].ID
	WHERE [Practice].ID = @Practice_ID AND DATEPART(m, [Appointments].[Date_Time]) = DATEPART(m, DATEADD(m, -1, getdate())) AND DATEPART(yyyy, [Appointments].[Date_Time]) = DATEPART(yyyy, DATEADD(m, -1, getdate()))
END
GO

CREATE PROCEDURE [Appointments_Visits_CurrentMonth] 
		@Practice_ID INT
AS
BEGIN
	SET NOCOUNT ON;
	SELECT
		 [Appointments].[Date_Time]
		,[Practice].ID
	FROM [Practice] 
	INNER JOIN [Doctors] ON [Doctors].Practice_ID = [Practice].ID
	INNER JOIN [Appointments] ON [Appointments].Doctor_ID = [Doctors].ID
	WHERE [Practice].ID = @Practice_ID AND DATEPART(m, [Appointments].[Date_Time]) = DATEPART(m, DATEADD(m, 0, getdate())) AND DATEPART(yyyy, [Appointments].[Date_Time]) = DATEPART(yyyy, DATEADD(m, 0, getdate()))
END
GO

CREATE PROCEDURE [dbo].[GetPendingAppointmentsByPracticeID] 
		@Practice_ID INT
AS
BEGIN
SET NOCOUNT ON;
	SELECT        
		[Appointments].[ID] AS 'Appointments_ID', 		
		[Appointments].[App_Status] AS 'Appointments_App_Status', 
		[Appointments].[Date_Time] AS 'Appointments_Date_Time',
		[Appointments].[Details] AS 'Appointments_Details',
		CONCAT([Patient].[FirstName],' ',[Patient].[LastName]) AS 'Patient_FirstName',
		CONCAT([Doctors].[FirstName],' ',[Doctors].[LastName]) AS 'Doctors_FirstName',
		Practice.Name AS 'Practice_Name'
	FROM [Practice] 
	INNER JOIN [Doctors] ON [Doctors].Practice_ID = [Practice].ID
	INNER JOIN [Appointments] ON [Appointments].Doctor_ID = [Doctors].ID
	INNER JOIN [Patient] ON [Patient].ID = [Appointments].Patient_ID
	WHERE [Practice].ID = @Practice_ID AND [Appointments].App_Status = 2 ORDER BY [Appointments].[Date_Time] DESC
END
GO

CREATE PROCEDURE [dbo].[GetAppovedAppointmentsByPracticeID] 
		@Practice_ID INT
AS
BEGIN
SET NOCOUNT ON;
	SELECT        
		[Appointments].[ID] AS 'Appointments_ID', 		
		[Appointments].[App_Status] AS 'Appointments_App_Status', 
		[Appointments].[Date_Time] AS 'Appointments_Date_Time',
		[Appointments].[Details] AS 'Appointments_Details',
		CONCAT([Patient].[FirstName],' ',[Patient].[LastName]) AS 'Patient_FirstName',
		CONCAT([Doctors].[FirstName],' ',[Doctors].[LastName]) AS 'Doctors_FirstName',
		Practice.Name AS 'Practice_Name'
	FROM [Practice] 
	INNER JOIN [Doctors] ON [Doctors].Practice_ID = [Practice].ID
	INNER JOIN [Appointments] ON [Appointments].Doctor_ID = [Doctors].ID
	INNER JOIN [Patient] ON [Patient].ID = [Appointments].Patient_ID
	WHERE [Practice].ID = @Practice_ID AND [Appointments].App_Status = 1 ORDER BY [Appointments].[Date_Time] DESC
END
GO

CREATE PROCEDURE [dbo].[GetRejectedAppointmentsByPracticeID] 
		@Practice_ID INT
AS
BEGIN
SET NOCOUNT ON;
	SELECT        
		[Appointments].[ID] AS 'Appointments_ID', 		
		[Appointments].[App_Status] AS 'Appointments_App_Status', 
		[Appointments].[Date_Time] AS 'Appointments_Date_Time',
		[Appointments].[Details] AS 'Appointments_Details',
		CONCAT([Patient].[FirstName],' ',[Patient].[LastName]) AS 'Patient_FirstName',
		CONCAT([Doctors].[FirstName],' ',[Doctors].[LastName]) AS 'Doctors_FirstName',
		Practice.Name AS 'Practice_Name'
	FROM [Practice] 
	INNER JOIN [Doctors] ON [Doctors].Practice_ID = [Practice].ID
	INNER JOIN [Appointments] ON [Appointments].Doctor_ID = [Doctors].ID
	INNER JOIN [Patient] ON [Patient].ID = [Appointments].Patient_ID
	WHERE [Practice].ID = @Practice_ID AND [Appointments].App_Status = 0 ORDER BY [Appointments].[Date_Time] DESC
END
GO

CREATE PROCEDURE [dbo].[AppoveOrRejectAppointment] 
		@ID			int,
		@App_Status int
AS
BEGIN 
      SET NOCOUNT ON 
		UPDATE       [Appointments]
		SET   App_Status = @App_Status
	  FROM   [Appointments] WHERE [Appointments].ID = @ID   
END
GO

CREATE PROCEDURE [dbo].[GetLoggedinUserProfile]
		@User_ID INT
AS
BEGIN
SET NOCOUNT ON;
BEGIN TRANSACTION [GetLoggedinUserProfile]
BEGIN TRY
IF EXISTS 
(
	SELECT        
		[D].[FirstName],
		[D].[LastName],
		[D].[Email],
		[D].[Gender],
		[D].[Address],
		[D].[Job_Title],
		[P].[Name]			  AS 'Practice_Name',
		[P].[Phone_Number] 	  AS 'Practice_Phone_Number',
		[P].[Fax_Number]	  AS 'Practice_Fax_Number',
		[P].[Street_Address]  AS 'Practice_Street_Address',
		[P].[Suburb]		  AS 'Practice_Suburb',
		[P].[City]			  AS 'Practice_City',
		[P].[Country] 		  AS 'Practice_Country',
		[U].[ID]			  AS 'User_ID',
		[U].[AccessLevel]
	FROM		[Doctors] AS [D]
	INNER JOIN	[Users] as [U] ON [D].[User_ID] = [U].[ID]
	INNER JOIN	[Practice] as [P] ON [P].[ID] = [D].[Practice_ID] WHERE [U].[ID] = @User_ID
)
BEGIN
	SELECT        
		[D].[FirstName],
		[D].[LastName],
		[D].[Email],
		[D].[Gender],
		[D].[Address],
		[D].[Job_Title],
		[P].[Name]			  AS 'Practice_Name',
		[P].[Phone_Number] 	  AS 'Practice_Phone_Number',
		[P].[Fax_Number]	  AS 'Practice_Fax_Number',
		[P].[Street_Address]  AS 'Practice_Street_Address',
		[P].[Suburb]		  AS 'Practice_Suburb',
		[P].[City]			  AS 'Practice_City',
		[P].[Country] 		  AS 'Practice_Country',
		[U].[ID]			  AS 'User_ID',
		[U].[AccessLevel]
	FROM		[Doctors] AS [D]
	INNER JOIN	[Users] as [U] ON [D].[User_ID] = [U].[ID]
	INNER JOIN	[Practice] as [P] ON [P].[ID] = [D].[Practice_ID] WHERE [U].[ID] = @User_ID
END

IF EXISTS
(
	SELECT        
		[S].[FirstName],
		[S].[LastName],
		[S].[ID_Number],
		[S].[Gender],
		[S].[DOB],
		[S].[Phone],
		[S].[Street_Address],
		[S].[Suburb],
		[S].[City],
		[S].[Country],
		[S].[Employee_Type],
		[S].[Email],
		[P].[Name]			  AS 'Practice_Name',
		[P].[Phone_Number] 	  AS 'Practice_Phone_Number',
		[P].[Fax_Number]	  AS 'Practice_Fax_Number',
		[P].[Street_Address]  AS 'Practice_Street_Address',
		[P].[Suburb]		  AS 'Practice_Suburb',
		[P].[City]			  AS 'Practice_City',
		[P].[Country] 		  AS 'Practice_Country',
		[U].[ID]			  AS 'User_ID',
		[U].[AccessLevel]
		FROM		[Staff] AS [S]
	    INNER JOIN	[Users] as [U] ON [S].[User_ID] = [U].[ID]
	    INNER JOIN	[Practice] as [P] ON [P].[ID] = [S].[Practice_ID] WHERE [U].[ID] = @User_ID
)
BEGIN
	SELECT        
		[S].[FirstName],
		[S].[LastName],
		[S].[ID_Number],
		[S].[Gender],
		[S].[DOB],
		[S].[Phone],
		[S].[Street_Address],
		[S].[Suburb],
		[S].[City],
		[S].[Country],
		[S].[Employee_Type],
		[S].[Email],
		[P].[Name]			  AS 'Practice_Name',
		[P].[Phone_Number] 	  AS 'Practice_Phone_Number',
		[P].[Fax_Number]	  AS 'Practice_Fax_Number',
		[P].[Street_Address]  AS 'Practice_Street_Address',
		[P].[Suburb]		  AS 'Practice_Suburb',
		[P].[City]			  AS 'Practice_City',
		[P].[Country] 		  AS 'Practice_Country',
		[U].[ID]			  AS 'User_ID',
		[U].[AccessLevel]
		FROM		[Staff] AS [S]
	    INNER JOIN	[Users] as [U] ON [S].[User_ID] = [U].[ID]
	    INNER JOIN	[Practice] as [P] ON [P].[ID] = [S].[Practice_ID] WHERE [U].[ID] = @User_ID
END

END TRY

BEGIN CATCH
	ROLLBACK TRANSACTION [GetLoggedinUserProfile]
END CATCH
COMMIT TRANSACTION [GetLoggedinUserProfile]
END
GO

CREATE PROCEDURE [dbo].[UpdateProfileStaff]
		@User_ID		INT,
		@FirstName		nvarchar (50),
		@LastName		nvarchar (50),
		@ID_Number		nvarchar (50),
		@Gender			char      (1),
		@DOB			nvarchar (50),
		@Phone			nvarchar (50),
		@Street_Address	nvarchar (50),
		@Suburb			nvarchar (50),
		@City			nvarchar (50),
		@Country		nvarchar (50)
AS
BEGIN 
      SET NOCOUNT ON 
		UPDATE       [Staff]
		SET                
		 FirstName =	  @FirstName		
		,LastName =		  @LastName		
		,ID_Number =	  @ID_Number		
		,Gender =		  @Gender			
		,DOB =			  @DOB			
		,Phone =		  @Phone			
		,Street_Address = @Street_Address	
		,Suburb =		  @Suburb			
		,City =			  @City			
		,Country =		  @Country
		FROM   [Staff] WHERE [Staff].[User_ID] = @User_ID     
END
GO

CREATE PROCEDURE [dbo].[UpdateProfileDoctor]
		@User_ID		INT,
		@FirstName		nvarchar (50),
		@LastName		nvarchar (50),
		@Gender			char      (1),		
		@Address		nvarchar (50)
AS
BEGIN 
      SET NOCOUNT ON 
		UPDATE       [Doctors]
		SET                
		 FirstName =	  @FirstName		
		,LastName =		  @LastName			
		,Gender =		  @Gender		
		,[Address] =	  @Address
		FROM   [Doctors] WHERE [Doctors].[User_ID] = @User_ID     
END
GO

CREATE PROCEDURE [dbo].[GetPassword]
		@User_ID INT
AS
BEGIN
SET NOCOUNT ON;
BEGIN TRANSACTION
	SELECT
		 [U].[ID] AS 'User_ID',
		 [U].[Password]
	FROM [Users] AS [U] WHERE [U].[ID] = @User_ID
END
GO

CREATE PROCEDURE [dbo].[UpdatePassword]
		@User_ID		INT,
		@Password		nvarchar (50)
AS
BEGIN 
      SET NOCOUNT ON 
		UPDATE       [Users]
		SET                
		[Password] =	  @Password
		FROM [Users] AS [U] WHERE [U].[ID] = @User_ID   
END
GO

CREATE PROCEDURE [dbo].[MedicineInventoryStockCount]
		@Practice_ID INT
AS
BEGIN
SET NOCOUNT ON;
BEGIN TRANSACTION
	SELECT
		 [Medicine_Inventory].[DrugName]
		,[Medicine_Inventory].[QuantityInStock]
	FROM [Medicine_Inventory] 
	INNER JOIN [Practice] ON [Practice].ID = [Medicine_Inventory].[Practice_ID] WHERE [Practice].ID = @Practice_ID
END
GO

USE [master]
GO
ALTER DATABASE [DoConnect] SET  READ_WRITE 
GO
