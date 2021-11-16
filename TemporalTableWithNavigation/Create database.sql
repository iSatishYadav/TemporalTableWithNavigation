CREATE DATABASE TemporalTableWithNavigation;;
GO

USE TemporalTableWithNavigation;
GO

CREATE TABLE [dbo].[Statuses]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [Description] NVARCHAR(10) NOT NULL    
)
GO

CREATE TABLE [dbo].[Employees] (
    [EmployeeId]   UNIQUEIDENTIFIER                            NOT NULL,
    [Name]         NVARCHAR (100)                              NULL,
    [Position]     NVARCHAR (100)                              NULL,
    [Department]   NVARCHAR (100)                              NULL,
    [Address]      NVARCHAR (1024)                             NULL,
    [AnnualSalary] DECIMAL (10, 2)                             NOT NULL,
    [PeriodEnd]    DATETIME2 (7) GENERATED ALWAYS AS ROW END   NOT NULL,
    [PeriodStart]  DATETIME2 (7) GENERATED ALWAYS AS ROW START NOT NULL,
    [StatusId] INT NOT NULL, 
    CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED ([EmployeeId] ASC), 
    CONSTRAINT [FK_Employees_Statuses] FOREIGN KEY ([StatusId]) REFERENCES [Statuses]([Id]),
    PERIOD FOR SYSTEM_TIME ([PeriodStart], [PeriodEnd])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[dbo].[EmployeeHistory], DATA_CONSISTENCY_CHECK=ON));
GO