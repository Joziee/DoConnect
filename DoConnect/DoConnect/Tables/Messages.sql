﻿CREATE TABLE [dbo].[Messages](
	[ID]			INT IDENTITY(1,1) NOT NULL,
	[Sender]		NVARCHAR(200) NOT NULL,
	[Receiver]		NVARCHAR(200) NOT NULL,
	[Subject]		NVARCHAR(200) NOT NULL,
	[Description]	NVARCHAR(200) NOT NULL,
	[Date]			DATE NOT NULL,
	CONSTRAINT [PK_Messages] PRIMARY KEY CLUSTERED ([ID] ASC)
 );