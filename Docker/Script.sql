-- Guestbook DB
USE [master]
GO
CREATE DATABASE [Guestbook]
GO
USE [Guestbook]
GO
CREATE TABLE [dbo].[Comments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Comment] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Comments] ON 

INSERT [dbo].[Comments] ([Id], [Comment]) VALUES (1, N'First message')
INSERT [dbo].[Comments] ([Id], [Comment]) VALUES (2, N'Hello')
SET IDENTITY_INSERT [dbo].[Comments] OFF

-- Payroll DB
USE [master]
GO
CREATE DATABASE [Payroll]
GO
USE [Payroll]
GO
CREATE TABLE [dbo].[Person](
	[PersonId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](30) NULL,
	[LastName] [varchar](50) NULL,
	[SSN] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[PersonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE TABLE [dbo].[Salary](
	[SalaryId] [int] IDENTITY(1,1) NOT NULL,
	[PersonId] [int] NOT NULL,
	[MonthlySalary] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SalaryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE VIEW [dbo].[SalaryView]
AS
SELECT        dbo.Person.PersonId, dbo.Person.FirstName, dbo.Person.LastName, dbo.Person.SSN, dbo.Salary.SalaryId, dbo.Salary.PersonId AS Expr1, dbo.Salary.MonthlySalary
FROM            dbo.Person INNER JOIN
                         dbo.Salary ON dbo.Person.PersonId = dbo.Salary.PersonId
GO
SET IDENTITY_INSERT [dbo].[Person] ON 
INSERT [dbo].[Person] ([PersonId], [FirstName], [LastName], [SSN]) VALUES (1, N'Matti', N'Meikäläinen', N'220180-305F')
INSERT [dbo].[Person] ([PersonId], [FirstName], [LastName], [SSN]) VALUES (2, N'Anna', N'Anttila', N'130780-194X')
INSERT [dbo].[Person] ([PersonId], [FirstName], [LastName], [SSN]) VALUES (3, N'Kalle', N'Kekkonen', N'251180-2590')
INSERT [dbo].[Person] ([PersonId], [FirstName], [LastName], [SSN]) VALUES (4, N'Liisa', N'Jussila', N'170280-696N')
SET IDENTITY_INSERT [dbo].[Person] OFF
SET IDENTITY_INSERT [dbo].[Salary] ON 
INSERT [dbo].[Salary] ([SalaryId], [PersonId], [MonthlySalary]) VALUES (1, 1, 1000)
INSERT [dbo].[Salary] ([SalaryId], [PersonId], [MonthlySalary]) VALUES (2, 2, 2000)
INSERT [dbo].[Salary] ([SalaryId], [PersonId], [MonthlySalary]) VALUES (3, 3, 3000)
INSERT [dbo].[Salary] ([SalaryId], [PersonId], [MonthlySalary]) VALUES (4, 4, 4000)
SET IDENTITY_INSERT [dbo].[Salary] OFF
ALTER TABLE [dbo].[Salary]  WITH CHECK ADD  CONSTRAINT [FK_Salary_Person] FOREIGN KEY([PersonId])
REFERENCES [dbo].[Person] ([PersonId])
GO
ALTER TABLE [dbo].[Salary] CHECK CONSTRAINT [FK_Salary_Person]
GO
