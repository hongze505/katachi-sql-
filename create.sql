USE [katachidb]
GO
/****** 物件:  Table [dbo].[Categories]    指令碼日期: 2026/5/15 下午 03:11:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 物件:  Table [dbo].[day_template_exercises]    指令碼日期: 2026/5/15 下午 03:11:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[day_template_exercises](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[day_template_id] [int] NOT NULL,
	[ex_key] [varchar](20) NOT NULL,
	[sort_order] [int] NOT NULL,
	[created_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 物件:  Table [dbo].[day_templates]    指令碼日期: 2026/5/15 下午 03:11:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[day_templates](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[total_days] [int] NOT NULL,
	[day_number] [int] NOT NULL,
	[day_name] [nvarchar](50) NOT NULL,
	[target_groups] [nvarchar](255) NOT NULL,
	[exercise_count] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_day_template] UNIQUE NONCLUSTERED 
(
	[total_days] ASC,
	[day_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 物件:  Table [dbo].[equipment]    指令碼日期: 2026/5/15 下午 03:11:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[equipment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 物件:  Table [dbo].[exercise_equipment]    指令碼日期: 2026/5/15 下午 03:11:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[exercise_equipment](
	[ex_key] [varchar](20) NOT NULL,
	[equipment_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ex_key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 物件:  Table [dbo].[exercise_goals]    指令碼日期: 2026/5/15 下午 03:11:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[exercise_goals](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ex_key] [varchar](20) NOT NULL,
	[goal] [nvarchar](20) NOT NULL,
	[sets] [int] NOT NULL,
	[reps] [nvarchar](20) NOT NULL,
	[rest_seconds] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_exercise_goal] UNIQUE NONCLUSTERED 
(
	[ex_key] ASC,
	[goal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 物件:  Table [dbo].[exercise_group_pct]    指令碼日期: 2026/5/15 下午 03:11:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[exercise_group_pct](
	[ex_key] [varchar](20) NOT NULL,
	[group_key] [nvarchar](10) NOT NULL,
	[pct] [tinyint] NOT NULL,
 CONSTRAINT [pk_egp] PRIMARY KEY CLUSTERED 
(
	[ex_key] ASC,
	[group_key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 物件:  Table [dbo].[exercises]    指令碼日期: 2026/5/15 下午 03:11:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[exercises](
	[ex_key] [varchar](20) NOT NULL,
	[name_zh] [nvarchar](100) NOT NULL,
 CONSTRAINT [pk_exercises] PRIMARY KEY CLUSTERED 
(
	[ex_key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 物件:  Table [dbo].[foods]    指令碼日期: 2026/5/15 下午 03:11:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[foods](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[name_en] [nvarchar](100) NULL,
	[calories] [decimal](7, 2) NOT NULL,
	[protein] [decimal](7, 2) NOT NULL,
	[carbs] [decimal](7, 2) NOT NULL,
	[fat] [decimal](7, 2) NOT NULL,
	[unit] [nvarchar](20) NULL,
	[created_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 物件:  Table [dbo].[muscle_groups]    指令碼日期: 2026/5/15 下午 03:11:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[muscle_groups](
	[group_key] [nvarchar](10) NOT NULL,
 CONSTRAINT [pk_muscle_groups] PRIMARY KEY CLUSTERED 
(
	[group_key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 物件:  Table [dbo].[muscles]    指令碼日期: 2026/5/15 下午 03:11:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[muscles](
	[muscle_key] [varchar](30) NOT NULL,
	[group_key] [nvarchar](10) NOT NULL,
 CONSTRAINT [pk_muscles] PRIMARY KEY CLUSTERED 
(
	[muscle_key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 物件:  Table [dbo].[nutrition_records]    指令碼日期: 2026/5/15 下午 03:11:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nutrition_records](
	[record_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[food_id] [int] NOT NULL,
	[grams] [decimal](7, 2) NOT NULL,
	[record_date] [date] NOT NULL,
	[created_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[record_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 物件:  Table [dbo].[OrderItems]    指令碼日期: 2026/5/15 下午 03:11:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItems](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductCode] [nvarchar](100) NOT NULL,
	[ProductName] [nvarchar](200) NOT NULL,
	[OptionText] [nvarchar](300) NOT NULL,
	[UnitPrice] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Subtotal] [int] NOT NULL,
	[ImageUrl] [nvarchar](500) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 物件:  Table [dbo].[Orders]    指令碼日期: 2026/5/15 下午 03:11:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderNumber] [nvarchar](50) NOT NULL,
	[RecipientName] [nvarchar](100) NOT NULL,
	[RecipientPhone] [nvarchar](50) NOT NULL,
	[RecipientEmail] [nvarchar](100) NOT NULL,
	[RecipientAddress] [nvarchar](300) NOT NULL,
	[Subtotal] [int] NOT NULL,
	[Shipping] [int] NOT NULL,
	[MemberDiscount] [int] NOT NULL,
	[CouponDiscount] [int] NOT NULL,
	[Total] [int] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
	[user_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 物件:  Table [dbo].[ProductOptions]    指令碼日期: 2026/5/15 下午 03:11:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductOptions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[SortOrder] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 物件:  Table [dbo].[ProductOptionValues]    指令碼日期: 2026/5/15 下午 03:11:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductOptionValues](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductOptionId] [int] NOT NULL,
	[Text] [nvarchar](100) NOT NULL,
	[Price] [int] NULL,
	[OriginalPrice] [int] NULL,
	[ImageUrl] [nvarchar](300) NULL,
	[SortOrder] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 物件:  Table [dbo].[Products]    指令碼日期: 2026/5/15 下午 03:11:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductCode] [nvarchar](100) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Subtitle] [nvarchar](200) NULL,
	[Description] [nvarchar](max) NULL,
	[Price] [int] NOT NULL,
	[OriginalPrice] [int] NULL,
	[Rating] [decimal](2, 1) NULL,
	[ImageUrl] [nvarchar](300) NULL,
	[IsActive] [bit] NOT NULL,
	[Stock] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** 物件:  Table [dbo].[training_items]    指令碼日期: 2026/5/15 下午 03:11:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[training_items](
	[item_id] [int] IDENTITY(1,1) NOT NULL,
	[session_id] [int] NOT NULL,
	[ex_key] [varchar](20) NOT NULL,
	[weight_kg] [decimal](5, 1) NOT NULL,
	[sets] [tinyint] NOT NULL,
	[reps] [tinyint] NOT NULL,
	[sort_order] [tinyint] NOT NULL,
	[is_deleted] [bit] NOT NULL,
 CONSTRAINT [pk_items] PRIMARY KEY CLUSTERED 
(
	[item_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 物件:  Table [dbo].[training_sessions]    指令碼日期: 2026/5/15 下午 03:11:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[training_sessions](
	[session_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[session_date] [date] NOT NULL,
 CONSTRAINT [pk_sessions] PRIMARY KEY CLUSTERED 
(
	[session_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [uq_user_date] UNIQUE NONCLUSTERED 
(
	[user_id] ASC,
	[session_date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 物件:  Table [dbo].[training_sets]    指令碼日期: 2026/5/15 下午 03:11:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[training_sets](
	[set_id] [int] IDENTITY(1,1) NOT NULL,
	[item_id] [int] NOT NULL,
	[set_index] [tinyint] NOT NULL,
	[is_done] [bit] NOT NULL,
 CONSTRAINT [pk_sets] PRIMARY KEY CLUSTERED 
(
	[set_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [uq_item_set] UNIQUE NONCLUSTERED 
(
	[item_id] ASC,
	[set_index] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 物件:  Table [dbo].[user_goals]    指令碼日期: 2026/5/15 下午 03:11:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_goals](
	[goal_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[group_key] [nvarchar](10) NOT NULL,
	[month] [char](7) NOT NULL,
	[monthly_target] [tinyint] NOT NULL,
 CONSTRAINT [pk_user_goals] PRIMARY KEY CLUSTERED 
(
	[goal_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [uq_user_group_month] UNIQUE NONCLUSTERED 
(
	[user_id] ASC,
	[group_key] ASC,
	[month] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** 物件:  Table [dbo].[users]    指令碼日期: 2026/5/15 下午 03:11:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[email] [nvarchar](255) NOT NULL,
	[password_hash] [nvarchar](255) NOT NULL,
	[username] [nvarchar](100) NOT NULL,
	[age] [tinyint] NULL,
	[height_cm] [decimal](5, 1) NULL,
	[weight_kg] [decimal](5, 1) NULL,
	[gender] [nvarchar](10) NULL,
	[activity] [nvarchar](20) NULL,
	[created_at] [datetime] NOT NULL,
	[profile_updated_at] [datetime] NULL,
	[tdee] [int] NULL,
 CONSTRAINT [pk_users] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[day_template_exercises] ADD  DEFAULT ((0)) FOR [sort_order]
GO
ALTER TABLE [dbo].[day_template_exercises] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[day_templates] ADD  DEFAULT ((6)) FOR [exercise_count]
GO
ALTER TABLE [dbo].[foods] ADD  DEFAULT (N'100g') FOR [unit]
GO
ALTER TABLE [dbo].[foods] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[nutrition_records] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_Status]  DEFAULT (N'待處理') FOR [Status]
GO
ALTER TABLE [dbo].[ProductOptions] ADD  DEFAULT ((0)) FOR [SortOrder]
GO
ALTER TABLE [dbo].[ProductOptionValues] ADD  DEFAULT ((0)) FOR [SortOrder]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT ((0)) FOR [Stock]
GO
ALTER TABLE [dbo].[training_items] ADD  DEFAULT ((0)) FOR [is_deleted]
GO
ALTER TABLE [dbo].[training_sets] ADD  DEFAULT ((0)) FOR [is_done]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[day_template_exercises]  WITH CHECK ADD  CONSTRAINT [FK_dte_exercise] FOREIGN KEY([ex_key])
REFERENCES [dbo].[exercises] ([ex_key])
GO
ALTER TABLE [dbo].[day_template_exercises] CHECK CONSTRAINT [FK_dte_exercise]
GO
ALTER TABLE [dbo].[day_template_exercises]  WITH CHECK ADD  CONSTRAINT [FK_dte_template] FOREIGN KEY([day_template_id])
REFERENCES [dbo].[day_templates] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[day_template_exercises] CHECK CONSTRAINT [FK_dte_template]
GO
ALTER TABLE [dbo].[exercise_equipment]  WITH CHECK ADD  CONSTRAINT [fk_ee_equip] FOREIGN KEY([equipment_id])
REFERENCES [dbo].[equipment] ([id])
GO
ALTER TABLE [dbo].[exercise_equipment] CHECK CONSTRAINT [fk_ee_equip]
GO
ALTER TABLE [dbo].[exercise_equipment]  WITH CHECK ADD  CONSTRAINT [fk_ee_ex] FOREIGN KEY([ex_key])
REFERENCES [dbo].[exercises] ([ex_key])
GO
ALTER TABLE [dbo].[exercise_equipment] CHECK CONSTRAINT [fk_ee_ex]
GO
ALTER TABLE [dbo].[exercise_goals]  WITH CHECK ADD  CONSTRAINT [FK_exercise_goals_exercise] FOREIGN KEY([ex_key])
REFERENCES [dbo].[exercises] ([ex_key])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[exercise_goals] CHECK CONSTRAINT [FK_exercise_goals_exercise]
GO
ALTER TABLE [dbo].[exercise_group_pct]  WITH CHECK ADD  CONSTRAINT [fk_egp_ex] FOREIGN KEY([ex_key])
REFERENCES [dbo].[exercises] ([ex_key])
GO
ALTER TABLE [dbo].[exercise_group_pct] CHECK CONSTRAINT [fk_egp_ex]
GO
ALTER TABLE [dbo].[exercise_group_pct]  WITH CHECK ADD  CONSTRAINT [fk_egp_group] FOREIGN KEY([group_key])
REFERENCES [dbo].[muscle_groups] ([group_key])
GO
ALTER TABLE [dbo].[exercise_group_pct] CHECK CONSTRAINT [fk_egp_group]
GO
ALTER TABLE [dbo].[muscles]  WITH CHECK ADD  CONSTRAINT [fk_muscles_group] FOREIGN KEY([group_key])
REFERENCES [dbo].[muscle_groups] ([group_key])
GO
ALTER TABLE [dbo].[muscles] CHECK CONSTRAINT [fk_muscles_group]
GO
ALTER TABLE [dbo].[nutrition_records]  WITH CHECK ADD  CONSTRAINT [FK_nutrition_food] FOREIGN KEY([food_id])
REFERENCES [dbo].[foods] ([id])
GO
ALTER TABLE [dbo].[nutrition_records] CHECK CONSTRAINT [FK_nutrition_food]
GO
ALTER TABLE [dbo].[nutrition_records]  WITH CHECK ADD  CONSTRAINT [FK_nutrition_user] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([user_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[nutrition_records] CHECK CONSTRAINT [FK_nutrition_user]
GO
ALTER TABLE [dbo].[OrderItems]  WITH CHECK ADD  CONSTRAINT [FK_OrderItems_Orders] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
GO
ALTER TABLE [dbo].[OrderItems] CHECK CONSTRAINT [FK_OrderItems_Orders]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Users] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Users]
GO
ALTER TABLE [dbo].[ProductOptions]  WITH CHECK ADD  CONSTRAINT [FK_ProductOptions_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[ProductOptions] CHECK CONSTRAINT [FK_ProductOptions_Products]
GO
ALTER TABLE [dbo].[ProductOptionValues]  WITH CHECK ADD  CONSTRAINT [FK_ProductOptionValues_ProductOptions] FOREIGN KEY([ProductOptionId])
REFERENCES [dbo].[ProductOptions] ([Id])
GO
ALTER TABLE [dbo].[ProductOptionValues] CHECK CONSTRAINT [FK_ProductOptionValues_ProductOptions]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
ALTER TABLE [dbo].[training_items]  WITH CHECK ADD  CONSTRAINT [fk_items_ex] FOREIGN KEY([ex_key])
REFERENCES [dbo].[exercises] ([ex_key])
GO
ALTER TABLE [dbo].[training_items] CHECK CONSTRAINT [fk_items_ex]
GO
ALTER TABLE [dbo].[training_items]  WITH CHECK ADD  CONSTRAINT [fk_items_session] FOREIGN KEY([session_id])
REFERENCES [dbo].[training_sessions] ([session_id])
GO
ALTER TABLE [dbo].[training_items] CHECK CONSTRAINT [fk_items_session]
GO
ALTER TABLE [dbo].[training_sessions]  WITH CHECK ADD  CONSTRAINT [fk_sessions_user] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [dbo].[training_sessions] CHECK CONSTRAINT [fk_sessions_user]
GO
ALTER TABLE [dbo].[training_sets]  WITH CHECK ADD  CONSTRAINT [fk_sets_item] FOREIGN KEY([item_id])
REFERENCES [dbo].[training_items] ([item_id])
GO
ALTER TABLE [dbo].[training_sets] CHECK CONSTRAINT [fk_sets_item]
GO
ALTER TABLE [dbo].[user_goals]  WITH CHECK ADD  CONSTRAINT [fk_goals_group] FOREIGN KEY([group_key])
REFERENCES [dbo].[muscle_groups] ([group_key])
GO
ALTER TABLE [dbo].[user_goals] CHECK CONSTRAINT [fk_goals_group]
GO
ALTER TABLE [dbo].[user_goals]  WITH CHECK ADD  CONSTRAINT [fk_goals_user] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [dbo].[user_goals] CHECK CONSTRAINT [fk_goals_user]
GO
ALTER TABLE [dbo].[exercise_group_pct]  WITH CHECK ADD  CONSTRAINT [chk_pct] CHECK  (([pct]>=(1) AND [pct]<=(100)))
GO
ALTER TABLE [dbo].[exercise_group_pct] CHECK CONSTRAINT [chk_pct]
GO
ALTER TABLE [dbo].[user_goals]  WITH CHECK ADD  CONSTRAINT [chk_target] CHECK  (([monthly_target]>=(5)))
GO
ALTER TABLE [dbo].[user_goals] CHECK CONSTRAINT [chk_target]
GO
