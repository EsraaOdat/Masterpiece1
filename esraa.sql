USE [StoreManagementDB]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 11/22/2024 5:27:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[admin_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NULL,
	[email] [varchar](max) NULL,
	[img] [nvarchar](max) NULL,
	[password] [nvarchar](max) NULL,
	[passwordHash] [varbinary](max) NULL,
	[passwordSalt] [varbinary](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[admin_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 11/22/2024 5:27:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[cart_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[created_at] [datetime] NULL,
	[status] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[cart_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart_Item]    Script Date: 11/22/2024 5:27:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart_Item](
	[cart_item_id] [int] IDENTITY(1,1) NOT NULL,
	[cart_id] [int] NULL,
	[product_id] [int] NULL,
	[quantity] [int] NULL,
	[StoreId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[cart_item_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 11/22/2024 5:27:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[category_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
	[image] [nvarchar](255) NULL,
	[description] [text] NULL,
	[created_at] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Colors]    Script Date: 11/22/2024 5:27:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Colors](
	[ColorID] [int] IDENTITY(1,1) NOT NULL,
	[ColorName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ColorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 11/22/2024 5:27:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[comment_id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NULL,
	[comment] [nvarchar](max) NULL,
	[status] [int] NULL,
	[date] [date] NULL,
	[rating] [int] NULL,
	[email] [nvarchar](255) NULL,
	[name] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[comment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 11/22/2024 5:27:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[comment_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[product_id] [int] NULL,
	[comment] [text] NULL,
	[rating] [int] NULL,
	[comment_date] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[comment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 11/22/2024 5:27:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[contact_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NULL,
	[email] [nvarchar](max) NULL,
	[sub] [nvarchar](max) NULL,
	[message] [nvarchar](max) NULL,
	[sent_date] [date] NULL,
	[admin_response] [nvarchar](max) NULL,
	[response_date] [date] NULL,
	[status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[contact_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Copons]    Script Date: 11/22/2024 5:27:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Copons](
	[copon_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NULL,
	[amount] [decimal](10, 2) NULL,
	[date] [date] NULL,
	[status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[copon_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderItems]    Script Date: 11/22/2024 5:27:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItems](
	[Order_Item_id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NULL,
	[product_id] [int] NULL,
	[quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Order_Item_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 11/22/2024 5:27:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[store_id] [int] NULL,
	[amount] [decimal](10, 2) NULL,
	[status] [nvarchar](50) NULL,
	[payment_method_id] [int] NULL,
	[transaction_id] [nvarchar](255) NULL,
	[Date] [date] NULL,
	[copon_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentMethods]    Script Date: 11/22/2024 5:27:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentMethods](
	[method_id] [int] IDENTITY(1,1) NOT NULL,
	[method_name] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[method_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductColors]    Script Date: 11/22/2024 5:27:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductColors](
	[ProductID] [int] NOT NULL,
	[ColorID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC,
	[ColorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductDiscounts]    Script Date: 11/22/2024 5:27:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductDiscounts](
	[discount_id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NULL,
	[discount_percentage] [decimal](5, 2) NULL,
	[start_date] [datetime2](7) NULL,
	[end_date] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[discount_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductImages]    Script Date: 11/22/2024 5:27:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductImages](
	[ImageID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[ImagePath] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ImageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 11/22/2024 5:27:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[product_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
	[description] [text] NULL,
	[price] [decimal](10, 2) NULL,
	[store_id] [int] NULL,
	[subcategory_id] [int] NULL,
	[created_at] [datetime2](7) NULL,
	[image] [nvarchar](max) NULL,
	[quantity] [int] NULL,
	[Status] [varchar](50) NULL,
	[is_deleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductSize]    Script Date: 11/22/2024 5:27:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductSize](
	[ProductID] [int] NOT NULL,
	[SizeID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC,
	[SizeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductTags]    Script Date: 11/22/2024 5:27:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductTags](
	[ProductID] [int] NOT NULL,
	[TagID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC,
	[TagID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shipments]    Script Date: 11/22/2024 5:27:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shipments](
	[shipment_id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NULL,
	[store_id] [int] NULL,
	[shipping_provider] [nvarchar](255) NULL,
	[tracking_number] [nvarchar](255) NULL,
	[shipment_status] [nvarchar](50) NULL,
	[shipped_date] [datetime2](7) NULL,
	[estimated_delivery] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[shipment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShippingAddresses]    Script Date: 11/22/2024 5:27:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShippingAddresses](
	[address_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[address] [nvarchar](max) NULL,
	[city] [nvarchar](255) NULL,
	[zip_code] [nvarchar](50) NULL,
	[country] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[address_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sizes]    Script Date: 11/22/2024 5:27:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sizes](
	[SizeID] [int] IDENTITY(1,1) NOT NULL,
	[SizeName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SizeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StoreOwners]    Script Date: 11/22/2024 5:27:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StoreOwners](
	[owner_id] [int] IDENTITY(1,1) NOT NULL,
	[store_id] [int] NULL,
	[owner_name] [nvarchar](255) NULL,
	[email] [nvarchar](255) NULL,
	[password] [nvarchar](255) NULL,
	[passwordHash] [varbinary](max) NULL,
	[passwordSalt] [varbinary](max) NULL,
	[UserType] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[owner_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stores]    Script Date: 11/22/2024 5:27:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stores](
	[store_id] [int] IDENTITY(1,1) NOT NULL,
	[store_name] [varchar](255) NULL,
	[store_description] [text] NULL,
	[store_logo] [varchar](255) NULL,
	[background_image] [varchar](255) NULL,
	[address] [nvarchar](max) NULL,
	[city] [nvarchar](255) NULL,
	[zip_code] [nvarchar](50) NULL,
	[country] [nvarchar](100) NULL,
	[phone_number] [nvarchar](20) NULL,
	[created_at] [datetime2](7) NULL,
	[status] [nvarchar](50) NULL,
	[plan_name] [nvarchar](50) NULL,
	[plan_type] [nvarchar](50) NULL,
	[amount] [decimal](10, 2) NULL,
	[start_date] [datetime] NULL,
	[end_date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[store_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubCategories]    Script Date: 11/22/2024 5:27:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubCategories](
	[subcategory_id] [int] IDENTITY(1,1) NOT NULL,
	[category_id] [int] NULL,
	[subcategory_name] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[subcategory_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subscriptions]    Script Date: 11/22/2024 5:27:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subscriptions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[SubscriptionPlan] [nvarchar](255) NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[AutoRenew] [bit] NULL,
	[Status] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tags]    Script Date: 11/22/2024 5:27:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tags](
	[tag_id] [int] IDENTITY(1,1) NOT NULL,
	[tag_name] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[tag_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRoles]    Script Date: 11/22/2024 5:27:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRoles](
	[UserID] [int] NOT NULL,
	[Role] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_UserRoles] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[Role] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 11/22/2024 5:27:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
	[email] [nvarchar](255) NULL,
	[phone_number] [nvarchar](20) NULL,
	[image] [nvarchar](255) NULL,
	[password] [nvarchar](255) NULL,
	[passwordHash] [varbinary](max) NULL,
	[passwordSalt] [varbinary](max) NULL,
	[address] [nvarchar](max) NULL,
	[points] [int] NULL,
	[created_at] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Variant]    Script Date: 11/22/2024 5:27:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Variant](
	[variant_id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NULL,
	[color_id] [int] NULL,
	[size_id] [int] NULL,
	[tag_id] [int] NULL,
	[quantity] [int] NULL,
	[image] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[variant_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Wishlist]    Script Date: 11/22/2024 5:27:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Wishlist](
	[wishlist_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[product_id] [int] NULL,
	[added_at] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[wishlist_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Admin] ON 

INSERT [dbo].[Admin] ([admin_id], [name], [email], [img], [password], [passwordHash], [passwordSalt]) VALUES (1, N'esss', N'sss', NULL, N'sss', 0x4866C0F7D227CDA2B53427C2AA0DBF130CB03541233D7F218421B439B68B7EBB8040BC11273E4A588F649649FA7B95D40AAB951B9481EC41B56CBBDD3EB1BCCB, 0x387B74BABB491B08F9E34FBCC7111CBF8DAE63C5FF028C818076E5912091ADAFB0BFF1F843F3C91EFB89D72A6A50178163C141E661C87324E711581A65886001DA05B7D49EC82B4DC34C867CB638BD59659C0988FFDFB0FDE4A5220069F55F59ECFB9FCEBE528294C5D189261B6652D42AF402DC054346721A463068382DD600)
INSERT [dbo].[Admin] ([admin_id], [name], [email], [img], [password], [passwordHash], [passwordSalt]) VALUES (2, N'esss', N'sss@gmail.com', NULL, N'sss', 0x5651BF2F5347A1E3FBDC11BBBCAEF631239FF6DEC5313B62DB3E1BF10CC42464A44FED773920B588E61133BF1272A09450B788656658069A08979329BC40FCD8, 0xCE7DEF05A080F8D92B895B3867CE68932C877AB3FB4AFE33B043DDF6F1BA981CDA77050CFF14B8C06F27C45FB5C936C0519CC97010740136826EE16951C4DE94EA979F3B357AB74402DB55AFB79DA00EB797A6FCD4DFBF2D8B3A4691A3E00EC24BD0F3715FC2A5E8AD8514D9D2DB649037F924B5AC7ECD84A07E1A42168E8541)
INSERT [dbo].[Admin] ([admin_id], [name], [email], [img], [password], [passwordHash], [passwordSalt]) VALUES (3, N'admin', N'admin@gmail.com ', NULL, N'123', 0x38D3F8F32506FE31D597CF3A10C769F630AFF5886236923727FBB413E737E3D4A9DB42BD36FADB9AD667B7BFAAD6E17E21BD6C4B7670F46986B5FB1B09107120, 0xE21624249076C57730FD46857F19F32597A0DB4233D56CD036C3390662E848F21616C70C3B84CF88A48FBAF2114D573B3379EF56199D5D561ABA38F8178BBBC4A5699F8858135A309C3AD4A805DA8B8CA1F3AB56B44616DF515CBB354784F4D8F866105F5A5A0CBF240FDA59A2901E99247BDABCF0E6772FF672FC50C5E481E7)
SET IDENTITY_INSERT [dbo].[Admin] OFF
GO
SET IDENTITY_INSERT [dbo].[Cart] ON 

INSERT [dbo].[Cart] ([cart_id], [user_id], [created_at], [status]) VALUES (37, 22, CAST(N'2024-10-09T14:09:55.783' AS DateTime), N'open')
INSERT [dbo].[Cart] ([cart_id], [user_id], [created_at], [status]) VALUES (38, 16, CAST(N'2024-10-09T16:06:58.330' AS DateTime), N'open')
INSERT [dbo].[Cart] ([cart_id], [user_id], [created_at], [status]) VALUES (42, 32, CAST(N'2024-10-27T18:25:11.240' AS DateTime), N'open')
INSERT [dbo].[Cart] ([cart_id], [user_id], [created_at], [status]) VALUES (43, NULL, CAST(N'2024-11-04T22:21:14.717' AS DateTime), N'open')
INSERT [dbo].[Cart] ([cart_id], [user_id], [created_at], [status]) VALUES (44, NULL, CAST(N'2024-11-07T12:51:40.570' AS DateTime), N'open')
INSERT [dbo].[Cart] ([cart_id], [user_id], [created_at], [status]) VALUES (45, NULL, CAST(N'2024-11-08T18:41:03.373' AS DateTime), N'open')
INSERT [dbo].[Cart] ([cart_id], [user_id], [created_at], [status]) VALUES (46, NULL, CAST(N'2024-11-10T19:50:50.300' AS DateTime), N'open')
INSERT [dbo].[Cart] ([cart_id], [user_id], [created_at], [status]) VALUES (48, 39, CAST(N'2024-11-19T17:30:51.400' AS DateTime), N'open')
INSERT [dbo].[Cart] ([cart_id], [user_id], [created_at], [status]) VALUES (49, 41, CAST(N'2024-11-20T12:12:14.517' AS DateTime), N'open')
SET IDENTITY_INSERT [dbo].[Cart] OFF
GO
SET IDENTITY_INSERT [dbo].[Cart_Item] ON 

INSERT [dbo].[Cart_Item] ([cart_item_id], [cart_id], [product_id], [quantity], [StoreId]) VALUES (189, 44, 14, 555, 10)
INSERT [dbo].[Cart_Item] ([cart_item_id], [cart_id], [product_id], [quantity], [StoreId]) VALUES (203, 45, 113, 1, 30)
INSERT [dbo].[Cart_Item] ([cart_item_id], [cart_id], [product_id], [quantity], [StoreId]) VALUES (250, 49, 135, 1, 30)
SET IDENTITY_INSERT [dbo].[Cart_Item] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([category_id], [name], [image], [description], [created_at]) VALUES (3, N'Jewelry', N'8c207c65ad7f1cb5a0ff1bb2dad96fa3.jpg', N'Jewelry, from rings and necklaces to bracelets, earrings, and brooches, enhances personal style with elegance and individuality.






', CAST(N'2024-11-07' AS Date))
INSERT [dbo].[Categories] ([category_id], [name], [image], [description], [created_at]) VALUES (28, N'Accessories', N'5bf5d81027ac3d9e53d6c6db0e8bf2f5.jpg', N'Fashion accessories for all', CAST(N'2024-11-07' AS Date))
INSERT [dbo].[Categories] ([category_id], [name], [image], [description], [created_at]) VALUES (29, N'Home Gifts', N'e7befc804e6a146f458502c9ffc2ab8d.jpg', N'Gifts for home decor and more', CAST(N'2024-11-07' AS Date))
INSERT [dbo].[Categories] ([category_id], [name], [image], [description], [created_at]) VALUES (30, N'Gifts by Occasion', N'8886bf1674bb877aa620cc39ecdc8a72.jpg', N'Gifts for specific occasions', CAST(N'2024-11-07' AS Date))
INSERT [dbo].[Categories] ([category_id], [name], [image], [description], [created_at]) VALUES (31, N'Gift Packages', N'1d51da258de7b9370228c4f0b4c15a53.jpg', N'Curated gift packages', CAST(N'2024-11-07' AS Date))
INSERT [dbo].[Categories] ([category_id], [name], [image], [description], [created_at]) VALUES (32, N'Perfumed', N'perfumed.jpg', N'Perfumed products are those that are infused with fragrant oils or essence, designed to provide a pleasant and lasting scent. This category includes perfumes, body sprays, and other scented products.', CAST(N'2024-11-08' AS Date))
INSERT [dbo].[Categories] ([category_id], [name], [image], [description], [created_at]) VALUES (35, N'dd', N'cff57865f09e61f76dbad943ff1584f0.jpg', N'CVGBHNJKM', CAST(N'2024-11-20' AS Date))
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Colors] ON 

INSERT [dbo].[Colors] ([ColorID], [ColorName]) VALUES (1, N'Red')
INSERT [dbo].[Colors] ([ColorID], [ColorName]) VALUES (2, N'Blue')
INSERT [dbo].[Colors] ([ColorID], [ColorName]) VALUES (3, N'Green')
INSERT [dbo].[Colors] ([ColorID], [ColorName]) VALUES (4, N'Black')
INSERT [dbo].[Colors] ([ColorID], [ColorName]) VALUES (5, N'White')
INSERT [dbo].[Colors] ([ColorID], [ColorName]) VALUES (6, N'Yellow')
INSERT [dbo].[Colors] ([ColorID], [ColorName]) VALUES (7, N'Pink')
INSERT [dbo].[Colors] ([ColorID], [ColorName]) VALUES (8, N'Purple')
INSERT [dbo].[Colors] ([ColorID], [ColorName]) VALUES (9, N'Gold')
INSERT [dbo].[Colors] ([ColorID], [ColorName]) VALUES (10, N'Silver')
SET IDENTITY_INSERT [dbo].[Colors] OFF
GO
SET IDENTITY_INSERT [dbo].[Comment] ON 

INSERT [dbo].[Comment] ([comment_id], [product_id], [comment], [status], [date], [rating], [email], [name]) VALUES (45, 113, N'Beautiful and classy—perfect for daily wear! 😍', 1, CAST(N'2024-11-10' AS Date), 5, N'esraa@gmail.com', N'Esraa Odat')
INSERT [dbo].[Comment] ([comment_id], [product_id], [comment], [status], [date], [rating], [email], [name]) VALUES (46, 113, N'Gorgeous watch! Adds a touch of luxury to any outfit. 💖', 1, CAST(N'2024-11-10' AS Date), 5, N'majd@gmail.com', N'Majd Odat')
INSERT [dbo].[Comment] ([comment_id], [product_id], [comment], [status], [date], [rating], [email], [name]) VALUES (50, 86, N'This wooden storage box is very stylish and helps organize my things perfectly.', 1, CAST(N'2024-11-15' AS Date), 5, N'customer28@example.com', N'Barbara Brown')
INSERT [dbo].[Comment] ([comment_id], [product_id], [comment], [status], [date], [rating], [email], [name]) VALUES (51, 86, N'Great storage box, but the wood quality could be better for the price.', 1, CAST(N'2024-11-16' AS Date), 4, N'customer29@example.com', N'Chris Carter')
INSERT [dbo].[Comment] ([comment_id], [product_id], [comment], [status], [date], [rating], [email], [name]) VALUES (52, 87, N'This kitchen gadget set is a game changer. All the tools are very useful and easy to use.', 1, CAST(N'2024-11-16' AS Date), 5, N'customer30@example.com', N'Diana Davis')
INSERT [dbo].[Comment] ([comment_id], [product_id], [comment], [status], [date], [rating], [email], [name]) VALUES (53, 87, N'Useful set, but the peeler broke after a few weeks.', 1, CAST(N'2024-11-16' AS Date), 3, N'customer31@example.com', N'Eva Evans')
INSERT [dbo].[Comment] ([comment_id], [product_id], [comment], [status], [date], [rating], [email], [name]) VALUES (54, 88, N'This birthday gift basket was the perfect surprise for my friend. Loved the chocolates and candles.', 1, CAST(N'2024-11-16' AS Date), 5, N'customer32@example.com', N'Fay Foster')
INSERT [dbo].[Comment] ([comment_id], [product_id], [comment], [status], [date], [rating], [email], [name]) VALUES (55, 88, N'The basket was nice, but the chocolates could have been higher quality.', 1, CAST(N'2024-11-16' AS Date), 4, N'customer33@example.com', N'Gina Gray')
INSERT [dbo].[Comment] ([comment_id], [product_id], [comment], [status], [date], [rating], [email], [name]) VALUES (56, 89, N'This Christmas gift package is perfect for the holidays. Very festive and thoughtful.', 1, CAST(N'2024-11-16' AS Date), 5, N'customer34@example.com', N'Helen Harris')
INSERT [dbo].[Comment] ([comment_id], [product_id], [comment], [status], [date], [rating], [email], [name]) VALUES (57, 89, N'A bit too much packaging, but the gift itself is great!', 1, CAST(N'2024-11-16' AS Date), 4, N'customer35@example.com', N'Ian Irwin')
INSERT [dbo].[Comment] ([comment_id], [product_id], [comment], [status], [date], [rating], [email], [name]) VALUES (58, 90, N'This wedding gift basket was a huge hit at my wedding. Everyone loved it.', 1, CAST(N'2024-11-16' AS Date), 5, N'customer36@example.com', N'Jackie Johnson')
INSERT [dbo].[Comment] ([comment_id], [product_id], [comment], [status], [date], [rating], [email], [name]) VALUES (59, 90, N'Very elegant, but I wish it included more personalized items.', 1, CAST(N'2024-11-16' AS Date), 4, N'customer37@example.com', N'Kelly King')
INSERT [dbo].[Comment] ([comment_id], [product_id], [comment], [status], [date], [rating], [email], [name]) VALUES (60, 91, N'The Mother’s Day basket was a lovely surprise. The pampering items were a hit.', 1, CAST(N'2024-11-16' AS Date), 5, N'customer38@example.com', N'Lily Lee')
INSERT [dbo].[Comment] ([comment_id], [product_id], [comment], [status], [date], [rating], [email], [name]) VALUES (61, 91, N'Great gift idea, but I think it was a bit overpriced for the contents.', 1, CAST(N'2024-11-16' AS Date), 3, N'customer39@example.com', N'Mona Mitchell')
INSERT [dbo].[Comment] ([comment_id], [product_id], [comment], [status], [date], [rating], [email], [name]) VALUES (62, 92, N'This Valentine’s Day gift set was perfect. The flowers and chocolates were beautifully arranged.', 1, CAST(N'2024-11-16' AS Date), 5, N'customer40@example.com', N'Nora Nelson')
INSERT [dbo].[Comment] ([comment_id], [product_id], [comment], [status], [date], [rating], [email], [name]) VALUES (63, 92, N'It’s a nice set, but I feel like the flowers could have been fresher.', 1, CAST(N'2024-11-16' AS Date), 5, N'customer41@example.com', N'Olivia Owens')
INSERT [dbo].[Comment] ([comment_id], [product_id], [comment], [status], [date], [rating], [email], [name]) VALUES (64, 93, N'This leather handbag is beautiful and spacious. Perfect for daily use.', 1, CAST(N'2024-11-16' AS Date), 5, N'customer42@example.com', N'Paul Perez')
INSERT [dbo].[Comment] ([comment_id], [product_id], [comment], [status], [date], [rating], [email], [name]) VALUES (65, 93, N'Nice bag, but the leather feels a little stiff at first.', 1, CAST(N'2024-11-17' AS Date), 4, N'customer43@example.com', N'Quincy Quinn')
INSERT [dbo].[Comment] ([comment_id], [product_id], [comment], [status], [date], [rating], [email], [name]) VALUES (66, 94, N'Love this tote bag. It’s durable and roomy, perfect for shopping trips.', 1, CAST(N'2024-11-17' AS Date), 5, N'customer44@example.com', N'Rachel Reynolds')
INSERT [dbo].[Comment] ([comment_id], [product_id], [comment], [status], [date], [rating], [email], [name]) VALUES (67, 94, N'Great bag, but the straps could be a bit more comfortable for carrying heavy items.', 1, CAST(N'2024-11-17' AS Date), 4, N'customer45@example.com', N'Sophie Smith')
INSERT [dbo].[Comment] ([comment_id], [product_id], [comment], [status], [date], [rating], [email], [name]) VALUES (68, 95, N'This clutch bag is perfect for evening events. Elegant and practical.', 1, CAST(N'2024-11-17' AS Date), 5, N'customer46@example.com', N'Timothy Taylor')
INSERT [dbo].[Comment] ([comment_id], [product_id], [comment], [status], [date], [rating], [email], [name]) VALUES (69, 95, N'Nice design, but it’s a bit smaller than expected.', 1, CAST(N'2024-11-17' AS Date), 4, N'customer47@example.com', N'Ursula Underwood')
INSERT [dbo].[Comment] ([comment_id], [product_id], [comment], [status], [date], [rating], [email], [name]) VALUES (70, 96, N'This luxury watch is stunning. The craftsmanship is exceptional.', 1, CAST(N'2024-11-17' AS Date), 5, N'customer48@example.com', N'Victoria Vance')
INSERT [dbo].[Comment] ([comment_id], [product_id], [comment], [status], [date], [rating], [email], [name]) VALUES (71, 96, N'Expensive, but the quality and design make it worth every penny.', 1, CAST(N'2024-11-17' AS Date), 5, N'customer49@example.com', N'William West')
INSERT [dbo].[Comment] ([comment_id], [product_id], [comment], [status], [date], [rating], [email], [name]) VALUES (72, 97, N'This sports watch is perfect for my workouts. It’s durable and looks great.', 1, CAST(N'2024-11-17' AS Date), 5, N'customer50@example.com', N'Xander Xavier')
INSERT [dbo].[Comment] ([comment_id], [product_id], [comment], [status], [date], [rating], [email], [name]) VALUES (73, 97, N'Good watch for workouts, but the strap feels a little cheap.', 1, CAST(N'2024-11-17' AS Date), 4, N'customer51@example.com', N'Yvonne Young')
INSERT [dbo].[Comment] ([comment_id], [product_id], [comment], [status], [date], [rating], [email], [name]) VALUES (74, 98, N'This digital watch is sleek and functional. Love all the features it offers.', 1, CAST(N'2024-11-17' AS Date), 5, N'customer52@example.com', N'Zane Ziegler')
INSERT [dbo].[Comment] ([comment_id], [product_id], [comment], [status], [date], [rating], [email], [name]) VALUES (75, 99, N'This cashmere scarf is incredibly soft and luxurious. A must-have for winter!', 1, CAST(N'2024-11-17' AS Date), 5, N'customer53@example.com', N'Aaron Anderson')
INSERT [dbo].[Comment] ([comment_id], [product_id], [comment], [status], [date], [rating], [email], [name]) VALUES (76, 100, N'The silk shawl is elegant and feels so smooth. Perfect for formal events.', 1, CAST(N'2024-11-17' AS Date), 5, N'customer54@example.com', N'Barbara Brown')
INSERT [dbo].[Comment] ([comment_id], [product_id], [comment], [status], [date], [rating], [email], [name]) VALUES (77, 101, N'This woolen scarf keeps me warm in the coldest weather. Highly recommend!', 1, CAST(N'2024-11-17' AS Date), 5, N'customer55@example.com', N'Chris Carter')
INSERT [dbo].[Comment] ([comment_id], [product_id], [comment], [status], [date], [rating], [email], [name]) VALUES (78, 102, N'These candles smell amazing and fill the whole room with a soothing scent.', 1, CAST(N'2024-11-17' AS Date), 5, N'customer56@example.com', N'Diana Davis')
INSERT [dbo].[Comment] ([comment_id], [product_id], [comment], [status], [date], [rating], [email], [name]) VALUES (79, 103, N'The essential oil diffuser works beautifully. The mist is calming and it looks great.', 1, CAST(N'2024-11-18' AS Date), 5, N'customer57@example.com', N'Eva Evans')
INSERT [dbo].[Comment] ([comment_id], [product_id], [comment], [status], [date], [rating], [email], [name]) VALUES (80, 104, N'This aromatherapy set has helped me relax after stressful days. Great quality oils.', 1, CAST(N'2024-11-18' AS Date), 5, N'customer58@example.com', N'Fay Foster')
INSERT [dbo].[Comment] ([comment_id], [product_id], [comment], [status], [date], [rating], [email], [name]) VALUES (81, 105, N'These fragrance oils have a lovely scent and last for a long time.', 1, CAST(N'2024-11-18' AS Date), 5, N'customer59@example.com', N'Gina Gray')
INSERT [dbo].[Comment] ([comment_id], [product_id], [comment], [status], [date], [rating], [email], [name]) VALUES (82, 103, N'This ceramic vase adds a touch of elegance to my living room. The intricate design makes it stand out beautifully.', 1, CAST(N'2024-11-14' AS Date), 5, N'customer1@example.com', N'Alice Anderson')
INSERT [dbo].[Comment] ([comment_id], [product_id], [comment], [status], [date], [rating], [email], [name]) VALUES (83, 104, N'Great kitchen tool set! Very practical, and the quality is top-notch. It makes cooking so much easier.', 1, CAST(N'2024-11-14' AS Date), 5, N'customer2@example.com', N'Bob Brown')
INSERT [dbo].[Comment] ([comment_id], [product_id], [comment], [status], [date], [rating], [email], [name]) VALUES (84, 105, N'The floral bouquet perfume is refreshing and long-lasting. Perfect for spring and summer days. Love it!', 1, CAST(N'2024-11-14' AS Date), 5, N'customer3@example.com', N'Clara Clark')
INSERT [dbo].[Comment] ([comment_id], [product_id], [comment], [status], [date], [rating], [email], [name]) VALUES (85, 106, N'Woody essence is such a sophisticated fragrance. I love the sandalwood notes—perfect for evening wear.', 1, CAST(N'2024-11-14' AS Date), 4, N'customer4@example.com', N'David Davis')
INSERT [dbo].[Comment] ([comment_id], [product_id], [comment], [status], [date], [rating], [email], [name]) VALUES (86, 107, N'Citrus Breeze is my new favorite scent! It''s fresh, vibrant, and energizing. Perfect for morning use.', 1, CAST(N'2024-11-14' AS Date), 5, N'customer5@example.com', N'Eva Evans')
INSERT [dbo].[Comment] ([comment_id], [product_id], [comment], [status], [date], [rating], [email], [name]) VALUES (87, 108, N'Sandalwood Essence is incredibly calming. I use it during meditation, and it really helps create a peaceful atmosphere.', 1, CAST(N'2024-11-14' AS Date), 5, N'customer6@example.com', N'Fay Foster')
INSERT [dbo].[Comment] ([comment_id], [product_id], [comment], [status], [date], [rating], [email], [name]) VALUES (88, 109, N'Citrus Breeze is such a refreshing fragrance! I love how it smells like fresh oranges and lemons.', 1, CAST(N'2024-11-14' AS Date), 5, N'customer7@example.com', N'Grace Green')
INSERT [dbo].[Comment] ([comment_id], [product_id], [comment], [status], [date], [rating], [email], [name]) VALUES (89, 110, N'Rose Bouquet Scent is perfect for creating a romantic atmosphere in the home. It fills the room with a beautiful floral fragrance.', 1, CAST(N'2024-11-14' AS Date), 5, N'customer8@example.com', N'Holly Harris')
INSERT [dbo].[Comment] ([comment_id], [product_id], [comment], [status], [date], [rating], [email], [name]) VALUES (90, 111, N'This leather belt is sturdy and stylish. It pairs well with both casual and formal outfits.', 1, CAST(N'2024-11-14' AS Date), 4, N'customer9@example.com', N'Isaac Irwin')
INSERT [dbo].[Comment] ([comment_id], [product_id], [comment], [status], [date], [rating], [email], [name]) VALUES (91, 112, N'A very stylish designer belt with unique patterns. It adds a perfect touch of flair to my outfits.', 1, CAST(N'2024-11-14' AS Date), 5, N'customer10@example.com', N'Jackie Johnson')
INSERT [dbo].[Comment] ([comment_id], [product_id], [comment], [status], [date], [rating], [email], [name]) VALUES (92, 113, N'I love this ceramic watch! It has a modern design and fits my wrist perfectly. It''s lightweight and comfortable.', 1, CAST(N'2024-11-14' AS Date), 5, N'customer11@example.com', N'Kathy King')
INSERT [dbo].[Comment] ([comment_id], [product_id], [comment], [status], [date], [rating], [email], [name]) VALUES (93, 114, N'The Maserati bracelet is sleek and stylish. I love the polished silver, and it makes a great accessory for special occasions.', 1, CAST(N'2024-11-14' AS Date), 5, N'customer12@example.com', N'Liam Lewis')
INSERT [dbo].[Comment] ([comment_id], [product_id], [comment], [status], [date], [rating], [email], [name]) VALUES (94, 117, N'A perfect gift for graduates! The leather keychain is elegant and makes a great keepsake.', 1, CAST(N'2024-11-14' AS Date), 4, N'customer13@example.com', N'Maya Mitchell')
INSERT [dbo].[Comment] ([comment_id], [product_id], [comment], [status], [date], [rating], [email], [name]) VALUES (95, 118, N'The custom graduation teddy bear is adorable! A wonderful gift to remember such an important day.', 1, CAST(N'2024-11-14' AS Date), 5, N'customer14@example.com', N'Nina Nelson')
INSERT [dbo].[Comment] ([comment_id], [product_id], [comment], [status], [date], [rating], [email], [name]) VALUES (96, 119, N'These abstract prints are a great addition to my home. They bring a modern touch to my living room decor.', 1, CAST(N'2024-11-15' AS Date), 5, N'customer15@example.com', N'Olivia Owens')
INSERT [dbo].[Comment] ([comment_id], [product_id], [comment], [status], [date], [rating], [email], [name]) VALUES (97, 120, N'The boho wall art is so trendy! It adds such a chic touch to my bedroom.', 1, CAST(N'2024-11-15' AS Date), 5, N'customer16@example.com', N'Paul Perez')
INSERT [dbo].[Comment] ([comment_id], [product_id], [comment], [status], [date], [rating], [email], [name]) VALUES (98, 121, N'The Love Knot necklace is stunning. The cubic zirconia sparkles beautifully. Perfect for gifting to someone special.', 1, CAST(N'2024-11-15' AS Date), 5, N'customer17@example.com', N'Quinn Quinn')
INSERT [dbo].[Comment] ([comment_id], [product_id], [comment], [status], [date], [rating], [email], [name]) VALUES (99, 125, N'The Birth Flower Gift Box is such a thoughtful present! The design is beautiful, and the items are of high quality.', 1, CAST(N'2024-11-15' AS Date), 5, N'customer18@example.com', N'Rachel Reynolds')
INSERT [dbo].[Comment] ([comment_id], [product_id], [comment], [status], [date], [rating], [email], [name]) VALUES (100, 126, N'A lovely birthday gift! The Joyful Bloom set is packed with pampering goodies. It made for an unforgettable birthday celebration.', 1, CAST(N'2024-11-15' AS Date), 5, N'customer19@example.com', N'Sophie Smith')
INSERT [dbo].[Comment] ([comment_id], [product_id], [comment], [status], [date], [rating], [email], [name]) VALUES (101, 127, N'The Valentine''s gift basket was perfect! The personalized mug is such a sweet touch. Loved it!', 1, CAST(N'2024-11-15' AS Date), 5, N'customer20@example.com', N'Timothy Taylor')
INSERT [dbo].[Comment] ([comment_id], [product_id], [comment], [status], [date], [rating], [email], [name]) VALUES (102, 128, N'The Forever Friends Gift Box is beautiful. It''s the perfect gift for my best friend. She loved every single item.', 1, CAST(N'2024-11-15' AS Date), 5, N'customer21@example.com', N'Ursula Underwood')
INSERT [dbo].[Comment] ([comment_id], [product_id], [comment], [status], [date], [rating], [email], [name]) VALUES (103, 129, N'Such a romantic gift! The Message in a Bottle set is absolutely beautiful and heartfelt.', 1, CAST(N'2024-11-15' AS Date), 5, N'customer22@example.com', N'Vera Victor')
INSERT [dbo].[Comment] ([comment_id], [product_id], [comment], [status], [date], [rating], [email], [name]) VALUES (104, 130, N'The Timeless Dad Gift Collection is a great idea for Father''s Day. It has a wonderful selection of thoughtful items.', 1, CAST(N'2024-11-15' AS Date), 5, N'customer23@example.com', N'William West')
INSERT [dbo].[Comment] ([comment_id], [product_id], [comment], [status], [date], [rating], [email], [name]) VALUES (105, 131, N'Love''s Little Bear is adorable! A sweet and cuddly gift set, perfect for showing affection.', 1, CAST(N'2024-11-15' AS Date), 5, N'customer24@example.com', N'Xander Xavier')
INSERT [dbo].[Comment] ([comment_id], [product_id], [comment], [status], [date], [rating], [email], [name]) VALUES (106, 132, N'The Silver Radiance Necklace is simply beautiful. It''s delicate, elegant, and catches the light perfectly.', 1, CAST(N'2024-11-15' AS Date), 5, N'customer25@example.com', N'Yvonne Young')
INSERT [dbo].[Comment] ([comment_id], [product_id], [comment], [status], [date], [rating], [email], [name]) VALUES (107, 135, N'The Silver Rolex watch is luxurious. The navy blue dial is stunning, and it''s an elegant accessory for any occasion.', 1, CAST(N'2024-11-15' AS Date), 5, N'customer26@example.com', N'Zane Ziegler')
INSERT [dbo].[Comment] ([comment_id], [product_id], [comment], [status], [date], [rating], [email], [name]) VALUES (108, 136, N'The coffee cup set is beautiful! It adds a touch of elegance to my morning coffee routine.', 1, CAST(N'2024-11-15' AS Date), 5, N'customer27@example.com', N'Aaron Adams')
INSERT [dbo].[Comment] ([comment_id], [product_id], [comment], [status], [date], [rating], [email], [name]) VALUES (109, 129, N'The Message in a Bottle gift set is beautiful! The personalized touches and chocolates made it extra special—a perfect gift for showing love!', 1, CAST(N'2024-11-14' AS Date), 5, N'esraaodat10@gmail.com', N'Esraa Odat')
INSERT [dbo].[Comment] ([comment_id], [product_id], [comment], [status], [date], [rating], [email], [name]) VALUES (110, 129, N'Such a unique and thoughtful gift! The personalized message and the mini teddy were perfect touches.❤️❤️
', 1, CAST(N'2024-11-14' AS Date), 5, N'majd@gmail.com', N'majd')
INSERT [dbo].[Comment] ([comment_id], [product_id], [comment], [status], [date], [rating], [email], [name]) VALUES (111, 100, N'Absolutely in love with this shawl! 😍 The silk is so soft, and the intricate design adds such elegance to my outfits! Perfect for evening wear. 🌙✨', 1, CAST(N'2024-11-14' AS Date), 5, N'esraaodat10@gmail.com', N'Esraa Odat')
INSERT [dbo].[Comment] ([comment_id], [product_id], [comment], [status], [date], [rating], [email], [name]) VALUES (112, 100, N'This shawl is gorgeous! 🌺 It feels luxurious, and the design is so detailed. I''ve received so many compliments wearing it! 💖😊', 1, CAST(N'2024-11-14' AS Date), 5, N'majd@gmail.com', N'Majd Odat')
INSERT [dbo].[Comment] ([comment_id], [product_id], [comment], [status], [date], [rating], [email], [name]) VALUES (113, 100, N'Such a beautiful piece! 💃 The quality of the silk is top-notch, and it drapes so gracefully. Perfect for special occasions. 🌹', 1, CAST(N'2024-11-14' AS Date), 5, N'saja@gmail.com', N'Saja Odat')
INSERT [dbo].[Comment] ([comment_id], [product_id], [comment], [status], [date], [rating], [email], [name]) VALUES (114, 100, N'Elegant and classy! 🎩🌟 The intricate details make this shawl really stand out. It completes my look perfectly. So glad I bought it! 😊❤️', 1, CAST(N'2024-11-14' AS Date), 5, N'dana@gmail.com', N'Dana Odat')
INSERT [dbo].[Comment] ([comment_id], [product_id], [comment], [status], [date], [rating], [email], [name]) VALUES (117, 132, N'FCGH', 0, CAST(N'2024-11-20' AS Date), 4, N'dana@gmail.com', N'JH')
SET IDENTITY_INSERT [dbo].[Comment] OFF
GO
SET IDENTITY_INSERT [dbo].[Contact] ON 

INSERT [dbo].[Contact] ([contact_id], [name], [email], [sub], [message], [sent_date], [admin_response], [response_date], [status]) VALUES (61, N'eeeee', N'esraa.odat@gmail.com', N'hhhh', N'hjhhjjh', CAST(N'2024-09-22' AS Date), NULL, NULL, 0)
INSERT [dbo].[Contact] ([contact_id], [name], [email], [sub], [message], [sent_date], [admin_response], [response_date], [status]) VALUES (62, N'Esraa Odat', N'esraaodat10@gmail.com', N'hello', N'hellooooooooooo', CAST(N'2024-09-23' AS Date), N'Esraa ODAT', CAST(N'2024-09-23' AS Date), 1)
INSERT [dbo].[Contact] ([contact_id], [name], [email], [sub], [message], [sent_date], [admin_response], [response_date], [status]) VALUES (63, N'Esraa Odat', N'esraaodat10@gmail.com', N'nnnnnnn', N'nnnnnnnnnm', CAST(N'2024-09-27' AS Date), N'hi esraa', CAST(N'2024-11-08' AS Date), 1)
INSERT [dbo].[Contact] ([contact_id], [name], [email], [sub], [message], [sent_date], [admin_response], [response_date], [status]) VALUES (64, N'Esraa Odat', N'esraaodat123123@gmail.com', N'EEEE', N'ZNZ', CAST(N'2024-09-27' AS Date), NULL, NULL, 0)
INSERT [dbo].[Contact] ([contact_id], [name], [email], [sub], [message], [sent_date], [admin_response], [response_date], [status]) VALUES (65, N'saja', N'esraaodat10@gmail.com', N'hello world', N'Hi I''am Saja Odat', CAST(N'2024-10-04' AS Date), N'dedewertgyh67ui89', CAST(N'2024-11-13' AS Date), 1)
INSERT [dbo].[Contact] ([contact_id], [name], [email], [sub], [message], [sent_date], [admin_response], [response_date], [status]) VALUES (66, N'Esraa Odat', N'esraaodat10@gmail.com', N'nnnnnnnnn', N'nnnnnnnnn', CAST(N'2024-11-08' AS Date), N'frtghyu', CAST(N'2024-11-13' AS Date), 1)
INSERT [dbo].[Contact] ([contact_id], [name], [email], [sub], [message], [sent_date], [admin_response], [response_date], [status]) VALUES (67, N'Esraa Odat', N'esraa@gmail.com', N'hi', N'hello ', CAST(N'2024-11-10' AS Date), NULL, NULL, 0)
INSERT [dbo].[Contact] ([contact_id], [name], [email], [sub], [message], [sent_date], [admin_response], [response_date], [status]) VALUES (68, N'Esraa Odat', N'esraaodat10@gmail.com', N'g', N'hello', CAST(N'2024-11-10' AS Date), N'edrf5t6y7u8', CAST(N'2024-11-13' AS Date), 1)
INSERT [dbo].[Contact] ([contact_id], [name], [email], [sub], [message], [sent_date], [admin_response], [response_date], [status]) VALUES (69, N't6y7u8', N'esraaodat10@gmail.com', N'gthyuj', N'dfctgvyhuji', CAST(N'2024-11-13' AS Date), N'p-y7u8i90o', CAST(N'2024-11-13' AS Date), 1)
INSERT [dbo].[Contact] ([contact_id], [name], [email], [sub], [message], [sent_date], [admin_response], [response_date], [status]) VALUES (70, N'Esraa Odat', N'esraaodat10@gmail.com', N'EEEE', N'HELLO', CAST(N'2024-11-20' AS Date), N'DFCGHBJN', CAST(N'2024-11-20' AS Date), 1)
SET IDENTITY_INSERT [dbo].[Contact] OFF
GO
SET IDENTITY_INSERT [dbo].[Copons] ON 

INSERT [dbo].[Copons] ([copon_id], [name], [amount], [date], [status]) VALUES (1, N'NEWYEAR2024', CAST(15.00 AS Decimal(10, 2)), CAST(N'2024-01-01' AS Date), 1)
INSERT [dbo].[Copons] ([copon_id], [name], [amount], [date], [status]) VALUES (2, N'SUMMER2024', CAST(10.00 AS Decimal(10, 2)), CAST(N'2024-06-15' AS Date), 1)
INSERT [dbo].[Copons] ([copon_id], [name], [amount], [date], [status]) VALUES (5, N'م', CAST(58.00 AS Decimal(10, 2)), CAST(N'2024-11-23' AS Date), 1)
SET IDENTITY_INSERT [dbo].[Copons] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderItems] ON 

INSERT [dbo].[OrderItems] ([Order_Item_id], [order_id], [product_id], [quantity]) VALUES (93, 63, 9, 1)
INSERT [dbo].[OrderItems] ([Order_Item_id], [order_id], [product_id], [quantity]) VALUES (94, 63, 13, 2)
INSERT [dbo].[OrderItems] ([Order_Item_id], [order_id], [product_id], [quantity]) VALUES (95, 63, 11, 1)
INSERT [dbo].[OrderItems] ([Order_Item_id], [order_id], [product_id], [quantity]) VALUES (96, 63, 14, 1)
INSERT [dbo].[OrderItems] ([Order_Item_id], [order_id], [product_id], [quantity]) VALUES (97, 64, 84, 1)
INSERT [dbo].[OrderItems] ([Order_Item_id], [order_id], [product_id], [quantity]) VALUES (98, 64, 86, 1)
INSERT [dbo].[OrderItems] ([Order_Item_id], [order_id], [product_id], [quantity]) VALUES (99, 64, 85, 1)
INSERT [dbo].[OrderItems] ([Order_Item_id], [order_id], [product_id], [quantity]) VALUES (100, 65, 81, 1)
INSERT [dbo].[OrderItems] ([Order_Item_id], [order_id], [product_id], [quantity]) VALUES (101, 65, 80, 1)
INSERT [dbo].[OrderItems] ([Order_Item_id], [order_id], [product_id], [quantity]) VALUES (102, 66, 113, 1)
INSERT [dbo].[OrderItems] ([Order_Item_id], [order_id], [product_id], [quantity]) VALUES (103, 66, 114, 1)
INSERT [dbo].[OrderItems] ([Order_Item_id], [order_id], [product_id], [quantity]) VALUES (104, 67, 8, 2)
INSERT [dbo].[OrderItems] ([Order_Item_id], [order_id], [product_id], [quantity]) VALUES (105, 68, 113, 1)
INSERT [dbo].[OrderItems] ([Order_Item_id], [order_id], [product_id], [quantity]) VALUES (106, 69, 113, 1)
INSERT [dbo].[OrderItems] ([Order_Item_id], [order_id], [product_id], [quantity]) VALUES (107, 70, 12, 1)
INSERT [dbo].[OrderItems] ([Order_Item_id], [order_id], [product_id], [quantity]) VALUES (108, 71, 109, 1)
INSERT [dbo].[OrderItems] ([Order_Item_id], [order_id], [product_id], [quantity]) VALUES (109, 71, 110, 1)
INSERT [dbo].[OrderItems] ([Order_Item_id], [order_id], [product_id], [quantity]) VALUES (110, 72, 113, 1)
INSERT [dbo].[OrderItems] ([Order_Item_id], [order_id], [product_id], [quantity]) VALUES (111, 72, 97, 1)
INSERT [dbo].[OrderItems] ([Order_Item_id], [order_id], [product_id], [quantity]) VALUES (112, 72, 114, 1)
INSERT [dbo].[OrderItems] ([Order_Item_id], [order_id], [product_id], [quantity]) VALUES (113, 73, 85, 1)
INSERT [dbo].[OrderItems] ([Order_Item_id], [order_id], [product_id], [quantity]) VALUES (114, 73, 84, 1)
INSERT [dbo].[OrderItems] ([Order_Item_id], [order_id], [product_id], [quantity]) VALUES (122, 79, 114, 1)
INSERT [dbo].[OrderItems] ([Order_Item_id], [order_id], [product_id], [quantity]) VALUES (123, 79, 97, 1)
INSERT [dbo].[OrderItems] ([Order_Item_id], [order_id], [product_id], [quantity]) VALUES (124, 79, 96, 1)
INSERT [dbo].[OrderItems] ([Order_Item_id], [order_id], [product_id], [quantity]) VALUES (125, 80, 14, 1)
INSERT [dbo].[OrderItems] ([Order_Item_id], [order_id], [product_id], [quantity]) VALUES (126, 80, 11, 1)
INSERT [dbo].[OrderItems] ([Order_Item_id], [order_id], [product_id], [quantity]) VALUES (127, 81, 105, 1)
INSERT [dbo].[OrderItems] ([Order_Item_id], [order_id], [product_id], [quantity]) VALUES (128, 82, 81, 2)
INSERT [dbo].[OrderItems] ([Order_Item_id], [order_id], [product_id], [quantity]) VALUES (130, 84, 132, 1)
INSERT [dbo].[OrderItems] ([Order_Item_id], [order_id], [product_id], [quantity]) VALUES (131, 84, 121, 1)
INSERT [dbo].[OrderItems] ([Order_Item_id], [order_id], [product_id], [quantity]) VALUES (132, 85, 113, 1)
INSERT [dbo].[OrderItems] ([Order_Item_id], [order_id], [product_id], [quantity]) VALUES (133, 85, 114, 1)
INSERT [dbo].[OrderItems] ([Order_Item_id], [order_id], [product_id], [quantity]) VALUES (134, 85, 98, 1)
INSERT [dbo].[OrderItems] ([Order_Item_id], [order_id], [product_id], [quantity]) VALUES (135, 86, 95, 2)
INSERT [dbo].[OrderItems] ([Order_Item_id], [order_id], [product_id], [quantity]) VALUES (136, 86, 82, 1)
INSERT [dbo].[OrderItems] ([Order_Item_id], [order_id], [product_id], [quantity]) VALUES (137, 87, 113, 1)
INSERT [dbo].[OrderItems] ([Order_Item_id], [order_id], [product_id], [quantity]) VALUES (138, 87, 114, 1)
SET IDENTITY_INSERT [dbo].[OrderItems] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([order_id], [user_id], [store_id], [amount], [status], [payment_method_id], [transaction_id], [Date], [copon_id]) VALUES (63, 32, 10, NULL, N'Canceled', NULL, NULL, CAST(N'2024-11-07' AS Date), NULL)
INSERT [dbo].[Orders] ([order_id], [user_id], [store_id], [amount], [status], [payment_method_id], [transaction_id], [Date], [copon_id]) VALUES (64, 32, 26, NULL, N'Delivered', NULL, NULL, CAST(N'2024-11-07' AS Date), NULL)
INSERT [dbo].[Orders] ([order_id], [user_id], [store_id], [amount], [status], [payment_method_id], [transaction_id], [Date], [copon_id]) VALUES (65, 32, 23, NULL, N'Shipped', NULL, NULL, CAST(N'2024-11-07' AS Date), NULL)
INSERT [dbo].[Orders] ([order_id], [user_id], [store_id], [amount], [status], [payment_method_id], [transaction_id], [Date], [copon_id]) VALUES (66, 32, 30, NULL, N'Processing', NULL, NULL, CAST(N'2024-11-08' AS Date), NULL)
INSERT [dbo].[Orders] ([order_id], [user_id], [store_id], [amount], [status], [payment_method_id], [transaction_id], [Date], [copon_id]) VALUES (67, 32, 10, NULL, N'Canceled', NULL, NULL, CAST(N'2024-11-08' AS Date), NULL)
INSERT [dbo].[Orders] ([order_id], [user_id], [store_id], [amount], [status], [payment_method_id], [transaction_id], [Date], [copon_id]) VALUES (68, 32, 30, NULL, N'Processing', NULL, NULL, CAST(N'2024-11-08' AS Date), NULL)
INSERT [dbo].[Orders] ([order_id], [user_id], [store_id], [amount], [status], [payment_method_id], [transaction_id], [Date], [copon_id]) VALUES (69, 32, 30, NULL, N'Processing', NULL, NULL, CAST(N'2024-11-08' AS Date), NULL)
INSERT [dbo].[Orders] ([order_id], [user_id], [store_id], [amount], [status], [payment_method_id], [transaction_id], [Date], [copon_id]) VALUES (70, 32, 10, NULL, N'Pending', NULL, NULL, CAST(N'2024-11-08' AS Date), NULL)
INSERT [dbo].[Orders] ([order_id], [user_id], [store_id], [amount], [status], [payment_method_id], [transaction_id], [Date], [copon_id]) VALUES (71, 32, 33, NULL, N'Shipped', NULL, NULL, CAST(N'2024-11-08' AS Date), NULL)
INSERT [dbo].[Orders] ([order_id], [user_id], [store_id], [amount], [status], [payment_method_id], [transaction_id], [Date], [copon_id]) VALUES (72, 32, 30, NULL, N'Canceled', NULL, NULL, CAST(N'2024-11-10' AS Date), NULL)
INSERT [dbo].[Orders] ([order_id], [user_id], [store_id], [amount], [status], [payment_method_id], [transaction_id], [Date], [copon_id]) VALUES (73, 32, 32, NULL, N'Shipped', NULL, NULL, CAST(N'2024-11-10' AS Date), NULL)
INSERT [dbo].[Orders] ([order_id], [user_id], [store_id], [amount], [status], [payment_method_id], [transaction_id], [Date], [copon_id]) VALUES (79, 32, 30, NULL, N'Shipped', NULL, NULL, CAST(N'2024-11-13' AS Date), NULL)
INSERT [dbo].[Orders] ([order_id], [user_id], [store_id], [amount], [status], [payment_method_id], [transaction_id], [Date], [copon_id]) VALUES (80, 32, 10, NULL, N'Canceled', NULL, NULL, CAST(N'2024-11-13' AS Date), NULL)
INSERT [dbo].[Orders] ([order_id], [user_id], [store_id], [amount], [status], [payment_method_id], [transaction_id], [Date], [copon_id]) VALUES (81, 32, 24, NULL, N'Pending', NULL, NULL, CAST(N'2024-11-13' AS Date), NULL)
INSERT [dbo].[Orders] ([order_id], [user_id], [store_id], [amount], [status], [payment_method_id], [transaction_id], [Date], [copon_id]) VALUES (82, 32, 23, NULL, N'Canceled', NULL, NULL, CAST(N'2024-11-13' AS Date), NULL)
INSERT [dbo].[Orders] ([order_id], [user_id], [store_id], [amount], [status], [payment_method_id], [transaction_id], [Date], [copon_id]) VALUES (84, 39, 27, NULL, N'Pending', NULL, NULL, CAST(N'2024-11-19' AS Date), NULL)
INSERT [dbo].[Orders] ([order_id], [user_id], [store_id], [amount], [status], [payment_method_id], [transaction_id], [Date], [copon_id]) VALUES (85, 39, 30, NULL, N'Pending', NULL, NULL, CAST(N'2024-11-19' AS Date), NULL)
INSERT [dbo].[Orders] ([order_id], [user_id], [store_id], [amount], [status], [payment_method_id], [transaction_id], [Date], [copon_id]) VALUES (86, 32, 23, NULL, N'Pending', NULL, NULL, CAST(N'2024-11-20' AS Date), NULL)
INSERT [dbo].[Orders] ([order_id], [user_id], [store_id], [amount], [status], [payment_method_id], [transaction_id], [Date], [copon_id]) VALUES (87, 32, 30, NULL, N'Processing', NULL, NULL, CAST(N'2024-11-20' AS Date), NULL)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[PaymentMethods] ON 

INSERT [dbo].[PaymentMethods] ([method_id], [method_name]) VALUES (1, N'Credit Card')
INSERT [dbo].[PaymentMethods] ([method_id], [method_name]) VALUES (2, N'PayPal')
SET IDENTITY_INSERT [dbo].[PaymentMethods] OFF
GO
INSERT [dbo].[ProductColors] ([ProductID], [ColorID]) VALUES (15, 1)
INSERT [dbo].[ProductColors] ([ProductID], [ColorID]) VALUES (15, 2)
GO
SET IDENTITY_INSERT [dbo].[ProductImages] ON 

INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImagePath]) VALUES (52, 112, N'designer_belt2.jpg')
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImagePath]) VALUES (53, 112, N'designer_belt3.jpg')
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImagePath]) VALUES (54, 93, N'leather_handbag2.jpg')
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImagePath]) VALUES (55, 104, N'kitchen_tool_set2.jpg')
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImagePath]) VALUES (56, 96, N'luxury_watch2.jpg')
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImagePath]) VALUES (57, 78, N'leather_wallet2.jpg')
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImagePath]) VALUES (58, 113, N'28000251_l_2.webp')
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImagePath]) VALUES (59, 113, N'61pQNe42xzL._SX569.webp')
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImagePath]) VALUES (60, 113, N'71hCHDWDJEL._SX569.webp')
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImagePath]) VALUES (64, 117, N'il_794xN.6145937499_7qo9.webp')
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImagePath]) VALUES (65, 118, N'il_794xN.6020960255_lnh7.webp')
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImagePath]) VALUES (66, 118, N'il_794xN.5942161792_a1ic.webp')
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImagePath]) VALUES (67, 119, N'il_794xN.4606166181_3ryi.webp')
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImagePath]) VALUES (68, 119, N'il_794xN.4684678999_8oic.webp')
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImagePath]) VALUES (69, 119, N'il_794xN.4558777552_2emb.webp')
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImagePath]) VALUES (70, 120, N'il_794xN.5749972232_b7nq.webp')
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImagePath]) VALUES (71, 120, N'il_794xN.5749972340_7017.webp')
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImagePath]) VALUES (72, 120, N'il_794xN.5754812064_pol8.webp')
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImagePath]) VALUES (73, 121, N'd387d01aa788d107ac9a3ec240999314.webp')
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImagePath]) VALUES (74, 121, N'e7f58791125b7352b538f7948a28a3d9.webp')
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImagePath]) VALUES (76, 121, N'5b9fd587a1d44d8ca1a7ecc1e973d592.webp')
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImagePath]) VALUES (84, 125, N'il_794xN.6275411947_5thb.webp')
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImagePath]) VALUES (85, 125, N'il_794xN.6301751138_8bwf.webp')
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImagePath]) VALUES (86, 126, N'il_794xN.6301829582_nw88.webp')
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImagePath]) VALUES (87, 126, N'il_794xN.5398783582_q43y.webp')
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImagePath]) VALUES (88, 126, N'il_794xN.6242604394_3ytg.webp')
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImagePath]) VALUES (89, 126, N'il_794xN.6290648195_4t0y.webp')
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImagePath]) VALUES (90, 127, N'80f78a862498f4ca7626b0eea16bbede.jpg')
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImagePath]) VALUES (91, 128, N'il_794xN.5927982090_3pyp.webp')
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImagePath]) VALUES (92, 128, N'il_1140xN.5927982052_f5ny (2).webp')
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImagePath]) VALUES (93, 129, N'925d55297d86447d7cc160c6c2c0cdd8.jpg')
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImagePath]) VALUES (94, 130, N'f8ac4b37e2ff1ff1bf7f84d9daea88fb.jpg')
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImagePath]) VALUES (95, 131, N'48f01a8c86110ec72b228bea2b21872e.jpg')
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImagePath]) VALUES (96, 131, N'e6e0435f536657ba1ebe879d6c0d2bc1.jpg')
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImagePath]) VALUES (97, 131, N'71f4485558ae90f67fee4310f3d8ab46.jpg')
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImagePath]) VALUES (98, 132, N'il_794xN.6150539866_llxz.webp')
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImagePath]) VALUES (106, 135, N'82c024ea1144585a7531dd58c796abbf.jpg')
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImagePath]) VALUES (107, 135, N'35e7b72d9ba42bdd7de4c40e6ea3b58f.jpg')
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImagePath]) VALUES (108, 135, N'1689da5d7986313a2d9c4cd1a09e21ca (1).jpg')
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImagePath]) VALUES (109, 136, N'8fc27de5-87f4-4b8d-9b00-44a068d10715_1024x1024.webp')
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImagePath]) VALUES (110, 136, N'572c2a1a-b4cc-4488-8cf2-f69fa3cfa71e_1024x1024.webp')
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImagePath]) VALUES (145, 163, N'759748774abb2635db694687bb93eb65.jpg')
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImagePath]) VALUES (146, 163, N'f197ea6ede9c4ee1c78458620d2f6bd0.jpg')
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImagePath]) VALUES (147, 163, N'9602e44f039054712e5f317da888ab96.jpg')
SET IDENTITY_INSERT [dbo].[ProductImages] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([product_id], [name], [description], [price], [store_id], [subcategory_id], [created_at], [image], [quantity], [Status], [is_deleted]) VALUES (6, N'Silver Ring', N'A beautiful silver ring', CAST(10.00 AS Decimal(10, 2)), 10, 5, CAST(N'2024-09-23T18:54:18.8861535' AS DateTime2), N'silver_ring.jpg', 50, N'approved', 0)
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [store_id], [subcategory_id], [created_at], [image], [quantity], [Status], [is_deleted]) VALUES (8, N'Silver Bracelet', N'An elegant silver bracelet', CAST(24.99 AS Decimal(10, 2)), 10, 7, CAST(N'2024-09-23T22:14:16.2066667' AS DateTime2), N'silver_bracelet.jpg', 20, N'approved', 0)
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [store_id], [subcategory_id], [created_at], [image], [quantity], [Status], [is_deleted]) VALUES (9, N'Silver Earring', N'Stylish silver earrings', CAST(14.99 AS Decimal(10, 2)), 10, 8, CAST(N'2024-09-23T22:14:16.2066667' AS DateTime2), N'silver_earring.jpg', 25, N'approved', 0)
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [store_id], [subcategory_id], [created_at], [image], [quantity], [Status], [is_deleted]) VALUES (10, N'Silver Brooch', N'Charming silver brooch', CAST(5.00 AS Decimal(10, 2)), 10, 9, CAST(N'2024-09-23T22:14:16.2066667' AS DateTime2), N'silver_brooch.jpg', 30, N'approved', 0)
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [store_id], [subcategory_id], [created_at], [image], [quantity], [Status], [is_deleted]) VALUES (11, N'Butterfly Necklace', N'Sterling Silver Butterfly Necklace', CAST(25.00 AS Decimal(10, 2)), 10, 6, CAST(N'2024-09-27T18:59:23.0973225' AS DateTime2), N'il_1140xN.6106444013_r30m.jpg', 54, N'approved', 0)
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [store_id], [subcategory_id], [created_at], [image], [quantity], [Status], [is_deleted]) VALUES (12, N'Silver Ring', N'Moon and Star Sterling Silver Adjustable Ring', CAST(5.00 AS Decimal(10, 2)), 10, 5, CAST(N'2024-09-27T19:03:03.9107191' AS DateTime2), N'3a5dc0be765b769ce278dd8039fb7784.jpg', 60, N'pending', 0)
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [store_id], [subcategory_id], [created_at], [image], [quantity], [Status], [is_deleted]) VALUES (13, N' Silver  Necklace', N' Silver  Necklace', CAST(5.00 AS Decimal(10, 2)), 10, 6, CAST(N'2024-09-27T19:06:47.0419460' AS DateTime2), N'3400626411fffc346e15429428cb0afa.jpg', 60, N'approved', 0)
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [store_id], [subcategory_id], [created_at], [image], [quantity], [Status], [is_deleted]) VALUES (14, N' Silver  Necklace', N' Silver  Necklace', CAST(15.00 AS Decimal(10, 2)), 10, 6, CAST(N'2024-09-27T19:07:33.0428876' AS DateTime2), N'c3694c43b1b9cfe1191d375fe0211d77.jpg', 60, N'approved', 0)
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [store_id], [subcategory_id], [created_at], [image], [quantity], [Status], [is_deleted]) VALUES (15, N'Butterfly Necklace', N'Sterling Silver Butterfly Necklace', CAST(25.00 AS Decimal(10, 2)), 10, 6, CAST(N'2024-09-27T19:11:50.4806633' AS DateTime2), N'e5f4bbaba57da13805b098b6e37b0919.jpg', 54, N'approved', 0)
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [store_id], [subcategory_id], [created_at], [image], [quantity], [Status], [is_deleted]) VALUES (41, N'Powder Blush', N'Powder Blush ', CAST(20.00 AS Decimal(10, 2)), 11, 6, CAST(N'2024-10-05T18:30:47.3593239' AS DateTime2), N'SEVENTEENNATURALMATTESILKYBLUSHER_1024x1024@2x.webp', 50, N'approved', 0)
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [store_id], [subcategory_id], [created_at], [image], [quantity], [Status], [is_deleted]) VALUES (78, N'Leather Wallet', N'A stylish leather wallet for men and women, perfect for everyday use.', CAST(10.00 AS Decimal(10, 2)), 23, 77, CAST(N'2024-11-07T16:41:05.8533333' AS DateTime2), N'leather_wallet.jpg', 30, N'approved', 0)
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [store_id], [subcategory_id], [created_at], [image], [quantity], [Status], [is_deleted]) VALUES (79, N'Fashion Scarf', N'A soft and stylish scarf made from premium cotton, perfect for any season.', CAST(10.00 AS Decimal(10, 2)), 23, 79, CAST(N'2024-11-07T16:41:05.8533333' AS DateTime2), N'fashion_scarf_01.jpg', 40, N'approved', 0)
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [store_id], [subcategory_id], [created_at], [image], [quantity], [Status], [is_deleted]) VALUES (80, N'Gold Plated Ring', N'A delicate gold-plated ring with a simple design, perfect for casual wear.', CAST(5.00 AS Decimal(10, 2)), 23, 5, CAST(N'2024-11-07T16:41:05.8533333' AS DateTime2), N'gold_plated_ring_image.jpg', 50, N'approved', 0)
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [store_id], [subcategory_id], [created_at], [image], [quantity], [Status], [is_deleted]) VALUES (81, N'Minimalist Watch', N'A modern and minimalist design watch with a leather strap, ideal for casual outings.', CAST(85.00 AS Decimal(10, 2)), 23, 78, CAST(N'2024-11-07T16:41:05.8533333' AS DateTime2), N'minimalist_watch_image.jpg', 20, N'approved', 0)
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [store_id], [subcategory_id], [created_at], [image], [quantity], [Status], [is_deleted]) VALUES (82, N'Sunglasses with Gold Frame', N'Stylish sunglasses with a gold-plated frame, perfect for summer days.', CAST(15.00 AS Decimal(10, 2)), 23, 81, CAST(N'2024-11-07T16:41:05.8533333' AS DateTime2), N'gold_frame_sunglasses.jpg', 25, N'approved', 0)
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [store_id], [subcategory_id], [created_at], [image], [quantity], [Status], [is_deleted]) VALUES (83, N'Aromatic Candle Set', N'A set of three aromatic candles in different scents, perfect for home decor.', CAST(10.00 AS Decimal(10, 2)), 26, 84, CAST(N'2024-11-07T16:41:05.8566667' AS DateTime2), N'aromatic_candle_set_image.jpg', 30, N'approved', 0)
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [store_id], [subcategory_id], [created_at], [image], [quantity], [Status], [is_deleted]) VALUES (84, N'Decorative Vase', N'A beautiful decorative vase made of high-quality ceramic, perfect for home styling.', CAST(10.00 AS Decimal(10, 2)), 32, 85, CAST(N'2024-11-07T16:41:05.8566667' AS DateTime2), N'decorative_vase_image.jpg', 40, N'approved', 0)
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [store_id], [subcategory_id], [created_at], [image], [quantity], [Status], [is_deleted]) VALUES (85, N'Framed Art Print', N'A framed art print of a modern abstract design, perfect for living room decor.', CAST(80.00 AS Decimal(10, 2)), 32, 90, CAST(N'2024-11-07T16:41:05.8566667' AS DateTime2), N'framed_art_print_image.jpg', 35, N'approved', 0)
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [store_id], [subcategory_id], [created_at], [image], [quantity], [Status], [is_deleted]) VALUES (86, N'Wooden Storage Box', N'A stylish wooden storage box with a rustic look, ideal for organizing small items.', CAST(20.00 AS Decimal(10, 2)), 26, 89, CAST(N'2024-11-07T16:41:05.8566667' AS DateTime2), N'wooden_storage_box_image.jpg', 50, N'approved', 0)
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [store_id], [subcategory_id], [created_at], [image], [quantity], [Status], [is_deleted]) VALUES (87, N'Kitchen Gadget Set', N'A set of useful kitchen gadgets, including a peeler, chopper, and slicer, all in one.', CAST(20.00 AS Decimal(10, 2)), 26, 86, CAST(N'2024-11-07T16:41:05.8566667' AS DateTime2), N'kitchen_gadget_set.jpg', 30, N'approved', 0)
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [store_id], [subcategory_id], [created_at], [image], [quantity], [Status], [is_deleted]) VALUES (88, N'Birthday Gift Basket', N'A beautifully curated gift basket with chocolates, candles, and a birthday card.', CAST(40.00 AS Decimal(10, 2)), 25, 101, CAST(N'2024-11-07T16:41:05.8566667' AS DateTime2), N'birthday_gift_basket_image.jpg', 50, N'approved', 0)
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [store_id], [subcategory_id], [created_at], [image], [quantity], [Status], [is_deleted]) VALUES (89, N'Christmas Gift Package', N'A Christmas-themed gift package with seasonal decorations, candles, and snacks.', CAST(60.00 AS Decimal(10, 2)), 25, 101, CAST(N'2024-11-07T16:41:05.8566667' AS DateTime2), N'christmas_gift_package.jpg', 40, N'approved', 0)
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [store_id], [subcategory_id], [created_at], [image], [quantity], [Status], [is_deleted]) VALUES (90, N'Wedding Gift Basket', N'A luxurious gift basket for weddings with personalized items and a decorative touch.', CAST(60.00 AS Decimal(10, 2)), 25, 101, CAST(N'2024-11-07T16:41:05.8566667' AS DateTime2), N'wedding_gift_basket_image.jpg', 25, N'approved', 0)
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [store_id], [subcategory_id], [created_at], [image], [quantity], [Status], [is_deleted]) VALUES (91, N'Mother''s Day Special Basket', N'A thoughtful Mother''s Day gift basket filled with pampering items and chocolates.', CAST(60.00 AS Decimal(10, 2)), 25, 92, CAST(N'2024-11-07T16:41:05.8566667' AS DateTime2), N'mothers_day_basket.jpg', 35, N'approved', 0)
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [store_id], [subcategory_id], [created_at], [image], [quantity], [Status], [is_deleted]) VALUES (92, N'Valentine''s Day Gift Set', N'A romantic Valentine’s Day gift set with flowers, chocolates, and love notes.', CAST(50.00 AS Decimal(10, 2)), 25, 95, CAST(N'2024-11-07T16:41:05.8566667' AS DateTime2), N'valentines_day_gift_set_image.jpg', 40, N'approved', 0)
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [store_id], [subcategory_id], [created_at], [image], [quantity], [Status], [is_deleted]) VALUES (93, N'Leather Handbag', N'A high-quality leather handbag, perfect for daily use.', CAST(20.00 AS Decimal(10, 2)), 23, 77, CAST(N'2024-11-07T23:47:22.9200000' AS DateTime2), N'leather_handbag.jpg', 25, N'approved', 0)
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [store_id], [subcategory_id], [created_at], [image], [quantity], [Status], [is_deleted]) VALUES (94, N'Tote Bag', N'A stylish tote bag made of durable fabric, ideal for shopping or casual outings.', CAST(30.00 AS Decimal(10, 2)), 23, 77, CAST(N'2024-11-07T23:47:22.9200000' AS DateTime2), N'tote_bag.jpg', 30, N'approved', 0)
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [store_id], [subcategory_id], [created_at], [image], [quantity], [Status], [is_deleted]) VALUES (95, N'Clutch Bag', N'An elegant evening clutch bag made of satin fabric, perfect for formal events.', CAST(15.00 AS Decimal(10, 2)), 23, 77, CAST(N'2024-11-07T23:47:22.9200000' AS DateTime2), N'clutch_bag.jpg', 20, N'approved', 0)
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [store_id], [subcategory_id], [created_at], [image], [quantity], [Status], [is_deleted]) VALUES (96, N'Luxury Watch', N'A luxury watch with a stainless steel band, perfect for formal occasions.', CAST(1000.00 AS Decimal(10, 2)), 30, 78, CAST(N'2024-11-08T00:05:41.9566667' AS DateTime2), N'luxury_watch.jpg', 15, N'approved', 0)
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [store_id], [subcategory_id], [created_at], [image], [quantity], [Status], [is_deleted]) VALUES (97, N'Sport Watch', N'A durable and sporty watch with a rubber strap, ideal for athletes.', CAST(80.00 AS Decimal(10, 2)), 30, 78, CAST(N'2024-11-08T00:05:41.9566667' AS DateTime2), N'sport_watch.jpg', 25, N'approved', 0)
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [store_id], [subcategory_id], [created_at], [image], [quantity], [Status], [is_deleted]) VALUES (98, N'Digital Watch', N'A modern digital watch with a sleek design and multiple features.', CAST(50.00 AS Decimal(10, 2)), 30, 78, CAST(N'2024-11-08T00:05:41.9566667' AS DateTime2), N'digital_watch.jpg', 40, N'approved', 0)
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [store_id], [subcategory_id], [created_at], [image], [quantity], [Status], [is_deleted]) VALUES (99, N'Cashmere Scarf', N'A soft and luxurious cashmere scarf, perfect for cold weather.', CAST(15.00 AS Decimal(10, 2)), 31, 79, CAST(N'2024-11-08T00:08:15.4966667' AS DateTime2), N'cashmere_scarf.jpg', 30, N'approved', 0)
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [store_id], [subcategory_id], [created_at], [image], [quantity], [Status], [is_deleted]) VALUES (100, N'Silk Shawl', N'A beautiful silk shawl with intricate designs, ideal for evening wear.', CAST(15.00 AS Decimal(10, 2)), 31, 79, CAST(N'2024-11-08T00:08:15.4966667' AS DateTime2), N'silk_shawl.jpg', 40, N'approved', 0)
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [store_id], [subcategory_id], [created_at], [image], [quantity], [Status], [is_deleted]) VALUES (101, N'Woolen Scarf', N'A warm and cozy woolen scarf for the winter season.', CAST(15.00 AS Decimal(10, 2)), 31, 79, CAST(N'2024-11-08T00:08:15.4966667' AS DateTime2), N'woolen_scarf.jpg', 35, N'approved', 0)
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [store_id], [subcategory_id], [created_at], [image], [quantity], [Status], [is_deleted]) VALUES (102, N'Scented Candle Set', N'A set of three beautifully scented candles to create a relaxing ambiance at home.', CAST(45.00 AS Decimal(10, 2)), 26, 84, CAST(N'2024-11-08T00:20:02.4166667' AS DateTime2), N'scented_candle_set.jpg', 30, N'approved', 0)
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [store_id], [subcategory_id], [created_at], [image], [quantity], [Status], [is_deleted]) VALUES (103, N'Ceramic Decorative Vase', N'A high-quality ceramic vase with intricate designs, perfect for home decoration.', CAST(20.00 AS Decimal(10, 2)), 32, 85, CAST(N'2024-11-08T00:20:02.4166667' AS DateTime2), N'ceramic_decorative_vase.jpg', 40, N'approved', 0)
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [store_id], [subcategory_id], [created_at], [image], [quantity], [Status], [is_deleted]) VALUES (104, N'Multifunctional Kitchen Tool Set', N'A set of kitchen tools including a grater, peeler, and slicer, for all your cooking needs.', CAST(80.00 AS Decimal(10, 2)), 26, 86, CAST(N'2024-11-08T00:20:02.4166667' AS DateTime2), N'kitchen_tool_set.jpg', 30, N'approved', 0)
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [store_id], [subcategory_id], [created_at], [image], [quantity], [Status], [is_deleted]) VALUES (105, N'Floral Bouquet Perfume', N'A refreshing floral perfume with notes of rose, jasmine, and lily.', CAST(55.00 AS Decimal(10, 2)), 24, 104, CAST(N'2024-11-08T00:27:02.9800000' AS DateTime2), N'floral_bouquet_perfume.jpg', 30, N'approved', 0)
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [store_id], [subcategory_id], [created_at], [image], [quantity], [Status], [is_deleted]) VALUES (106, N'Woody Essence Perfume', N'A sophisticated woody fragrance with hints of sandalwood and cedar.', CAST(70.00 AS Decimal(10, 2)), 24, 106, CAST(N'2024-11-08T00:27:02.9800000' AS DateTime2), N'woody_essence_perfume.jpg', 25, N'approved', 0)
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [store_id], [subcategory_id], [created_at], [image], [quantity], [Status], [is_deleted]) VALUES (107, N'Citrus Breeze Perfume', N'A vibrant citrus scent with notes of lemon, bergamot, and orange blossom.', CAST(60.00 AS Decimal(10, 2)), 24, 105, CAST(N'2024-11-08T00:27:02.9800000' AS DateTime2), N'citrus_breeze_perfume.jpg', 40, N'approved', 0)
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [store_id], [subcategory_id], [created_at], [image], [quantity], [Status], [is_deleted]) VALUES (108, N'Sandalwood Essence', N'A calming fragrance of sandalwood, perfect for creating a peaceful environment at home.', CAST(50.00 AS Decimal(10, 2)), 33, 106, CAST(N'2024-11-08T00:33:28.3466667' AS DateTime2), N'sandalwood_essence.jpg', 30, N'approved', 0)
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [store_id], [subcategory_id], [created_at], [image], [quantity], [Status], [is_deleted]) VALUES (109, N'Citrus Breeze', N'A fresh citrus fragrance, combining orange, lemon, and grapefruit for a refreshing feel.', CAST(40.00 AS Decimal(10, 2)), 33, 105, CAST(N'2024-11-08T00:33:28.3466667' AS DateTime2), N'citrus_breeze.jpg', 35, N'approved', 0)
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [store_id], [subcategory_id], [created_at], [image], [quantity], [Status], [is_deleted]) VALUES (110, N'Rose Bouquet Scent', N'A romantic rose-scented fragrance for your home, filling the room with floral notes.', CAST(45.00 AS Decimal(10, 2)), 33, 104, CAST(N'2024-11-08T00:33:28.3466667' AS DateTime2), N'rose_bouquet_scent.jpg', 25, N'approved', 0)
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [store_id], [subcategory_id], [created_at], [image], [quantity], [Status], [is_deleted]) VALUES (111, N'Leather Belt', N'A premium leather belt, perfect for formal or casual wear.', CAST(10.00 AS Decimal(10, 2)), 23, 80, CAST(N'2024-11-08T00:37:19.9000000' AS DateTime2), N'leather_belt.jpg', 30, N'rejected', 0)
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [store_id], [subcategory_id], [created_at], [image], [quantity], [Status], [is_deleted]) VALUES (112, N'Designer Belt', N'A stylish designer belt with a unique pattern, ideal for fashion lovers.', CAST(30.00 AS Decimal(10, 2)), 23, 80, CAST(N'2024-11-08T00:37:19.9000000' AS DateTime2), N'designer_belt.jpg', 20, N'approved', 0)
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [store_id], [subcategory_id], [created_at], [image], [quantity], [Status], [is_deleted]) VALUES (113, N'Ladies Ceramic Watch', N'This stylish Men''s Black Ceramic Watch features a bold, modern design with a durable, scratch-resistant ceramic band. Its sleek black finish exudes sophistication, making it the perfect accessory for both casual and formal occasions. Lightweight yet strong, it combines comfort with timeless style.

', CAST(300.00 AS Decimal(10, 2)), 30, 78, CAST(N'2024-11-08T13:47:38.6576252' AS DateTime2), N'28000251_fr (1).webp', 50, N'approved', 1)
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [store_id], [subcategory_id], [created_at], [image], [quantity], [Status], [is_deleted]) VALUES (114, N'Men''s Maserati Bracelet', N'The Men''s Maserati Silver Bracelet exudes bold sophistication with its sleek, polished silver design. Crafted with precision, this bracelet combines modern elegance and masculinity, making it a perfect accessory for any occasion. Its high-quality materials ensure durability, while the iconic Maserati logo adds a touch of luxury and style.

', CAST(100.00 AS Decimal(10, 2)), 30, 7, CAST(N'2024-11-08T13:53:28.0243198' AS DateTime2), N'JM224AXO02.webp', 54, N'approved', 0)
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [store_id], [subcategory_id], [created_at], [image], [quantity], [Status], [is_deleted]) VALUES (117, N'Personalized Leather Graduation Keychain', N' Celebrate her achievement with this custom Leather Graduation Keychain. Engraved with her name and graduation year, it’s a stylish, practical keepsake for the Class of 2024. Perfect for daily use and a memorable Graduation Gift she''ll cherish.', CAST(1.00 AS Decimal(10, 2)), 23, 94, CAST(N'2024-11-08T21:56:07.0113557' AS DateTime2), N'il_794xN.6145938935_ifsb.webp', 5, N'rejected', 0)
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [store_id], [subcategory_id], [created_at], [image], [quantity], [Status], [is_deleted]) VALUES (118, N'Custom Graduation Teddy Bear', N'Celebrate their big day with this Custom Graduation Teddy Bear! Dressed in a mini cap and gown, this adorable bear makes a sweet keepsake for graduates of all ages, from preschool to college. A thoughtful, cuddly Graduation Gift they''ll treasure forever.', CAST(20.00 AS Decimal(10, 2)), 23, 94, CAST(N'2024-11-08T21:59:33.5086570' AS DateTime2), N'il_680x540.6020960251_t1o1.webp', 30, N'approved', 0)
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [store_id], [subcategory_id], [created_at], [image], [quantity], [Status], [is_deleted]) VALUES (119, N'Modern Neutral Gallery Wall Art Set – Black & Beige Abstract Prints (Set of 3)', N'Enhance your space with this set of 3 minimalist black and beige abstract prints. Perfect for a modern farmhouse feel, these neutral artworks bring a stylish touch to any bedroom or living room. Instant printable files for easy, versatile decor.', CAST(58.00 AS Decimal(10, 2)), 32, 90, CAST(N'2024-11-08T22:12:46.6226653' AS DateTime2), N'il_794xN.4558777552_2emb.webp', 4, N'approved', 0)
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [store_id], [subcategory_id], [created_at], [image], [quantity], [Status], [is_deleted]) VALUES (120, N'Navy Blue Boho Wall Art', N'Add a chic, boho touch to your space with this navy blue and beige abstract wall art. Perfect for bedrooms, entryways, or any trendy room, this minimalist print brings depth and style to modern decor.', CAST(50.00 AS Decimal(10, 2)), 26, 90, CAST(N'2024-11-08T22:18:47.3989116' AS DateTime2), N'il_794xN.5755132624_krgk.webp', 4, N'approved', 0)
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [store_id], [subcategory_id], [created_at], [image], [quantity], [Status], [is_deleted]) VALUES (121, N' Love Knot Necklace with Cubic Zirconia', N'Show your love with this stunning Cubic Zirconia Love Knot Necklace, designed just for mom. A heartfelt gift for Mother’s Day or any occasion, this elegant piece symbolizes the unbreakable bond between you and your beautiful mom.', CAST(200.00 AS Decimal(10, 2)), 27, 92, CAST(N'2024-11-08T22:23:29.6428051' AS DateTime2), N'82fdccf6-3df1-4ef7-b804-bad3f14a956a_826x800.jpeg.a.webp', 5, N'approved', 0)
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [store_id], [subcategory_id], [created_at], [image], [quantity], [Status], [is_deleted]) VALUES (125, N'Birth Flower Gift Box', N'Treat them to a relaxing experience with the Birth Flower Gift Box! This set includes a beautifully designed glass cup featuring a unique birth flower illustration, along with carefully selected pampering items. A thoughtful birthday gift that brings comfort and joy to any special day.', CAST(15.00 AS Decimal(10, 2)), 25, 93, CAST(N'2024-11-13T15:55:16.9211711' AS DateTime2), N'il_794xN.6262921016_ruat.webp', 50, N'approved', 0)
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [store_id], [subcategory_id], [created_at], [image], [quantity], [Status], [is_deleted]) VALUES (126, N'Joyful Bloom Birthday Gift Set', N'Celebrate their special day with the Joyful Bloom Birthday Gift Set! This beautifully curated box includes a floral-themed glass cup and soothing self-care treats to make their birthday truly unforgettable. Perfect for anyone who deserves a moment of peace and joy.', CAST(10.00 AS Decimal(10, 2)), 25, 93, CAST(N'2024-11-13T15:58:54.6760429' AS DateTime2), N'il_794xN.6242599884_h2a4.webp', 20, N'approved', 0)
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [store_id], [subcategory_id], [created_at], [image], [quantity], [Status], [is_deleted]) VALUES (127, N'Valentines Gift Basket', N'A delightful Valentine''s Day gift basket for your best friend, featuring a personalized mug with her name! Perfect for sharing love and friendship, this keepsake is ideal for enjoying hot drinks or displaying as a cherished reminder of your bond.





A delightful Valentine''s Day gift basket for your best friend, featuring a personalized mug with her name! Perfect for sharing love and friendship, this keepsake is ideal for enjoying hot drinks or displaying as a cherished reminder of your bond.
', CAST(10.00 AS Decimal(10, 2)), 25, 95, CAST(N'2024-11-13T16:05:25.6579405' AS DateTime2), N'80f78a862498f4ca7626b0eea16bbede.jpg', 50, N'approved', 0)
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [store_id], [subcategory_id], [created_at], [image], [quantity], [Status], [is_deleted]) VALUES (128, N'Forever Friends Gift Box', N'Celebrate friendship with the Forever Friends Gift Box! This thoughtful birthday set includes a beautifully crafted glass cup and handpicked items to show how much you care. Perfect for best friends, whether nearby or far away, this gift box is designed to bring joy, comfort, and a reminder of your special bond.', CAST(10.00 AS Decimal(10, 2)), 25, 93, CAST(N'2024-11-13T16:19:16.5029596' AS DateTime2), N'il_794xN.5927982174_dwbd.webp', 61, N'approved', 0)
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [store_id], [subcategory_id], [created_at], [image], [quantity], [Status], [is_deleted]) VALUES (129, N'Telling I Love You through a Gift Box', N'Celebrate love with Box & Tale’s Message in a Bottle! This heartfelt gift includes a custom message bottle, a personalized greeting card, a delicate flower bouquet, premium chocolates, a mini teddy, and a customized gift box featuring their name. It’s the perfect way to show them how much they mean to you.', CAST(20.00 AS Decimal(10, 2)), 25, 95, CAST(N'2024-11-13T16:22:38.2954807' AS DateTime2), N'cd87f306385b8a36156f96b75d96ddcd.jpg', 30, N'approved', 0)
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [store_id], [subcategory_id], [created_at], [image], [quantity], [Status], [is_deleted]) VALUES (130, N'Timeless Dad Gift Collection', N'Amazing & Elegant Father''s Day Gift 2024 Ideas | DIY Gift Decoration For Fathers Day', CAST(20.00 AS Decimal(10, 2)), 25, 96, CAST(N'2024-11-13T16:30:12.6258686' AS DateTime2), N'da3c2967ebe8f9a076e0303bc9caed59.jpg', 30, N'pending', 0)
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [store_id], [subcategory_id], [created_at], [image], [quantity], [Status], [is_deleted]) VALUES (131, N'Love''s Little Bear', N'A sweet and cuddly gift set featuring a plush bear, a box of delicious chocolates, and a heartfelt card—perfect for showing your love this Valentine''s Day!
', CAST(30.00 AS Decimal(10, 2)), 25, 95, CAST(N'2024-11-13T16:42:27.2651956' AS DateTime2), N'697247b83a4981ea089e4ee14ee8e914.jpg', 50, N'approved', 0)
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [store_id], [subcategory_id], [created_at], [image], [quantity], [Status], [is_deleted]) VALUES (132, N'Silver Radiance Necklace', N'A delicate silver necklace designed to catch the light with every movement, perfect for any occasion.

', CAST(30.00 AS Decimal(10, 2)), 27, 6, CAST(N'2024-11-13T17:06:10.0508010' AS DateTime2), N'il_794xN.6150539862_3jzf.webp', 10, N'approved', 0)
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [store_id], [subcategory_id], [created_at], [image], [quantity], [Status], [is_deleted]) VALUES (135, N'Silver Rolex Watch', N'A luxurious silver Rolex watch with a striking navy blue dial. The perfect blend of sophistication and style, offering timeless elegance for any occasion.
', CAST(600.00 AS Decimal(10, 2)), 30, 78, CAST(N'2024-11-13T17:47:25.9235622' AS DateTime2), N'6ee5dbf800eb2f4e322c791cf7de8c56.jpg', 20, N'approved', 0)
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [store_id], [subcategory_id], [created_at], [image], [quantity], [Status], [is_deleted]) VALUES (136, N'Premium Coffee Cup Set (6 Pieces)', N'A stylish 6-piece coffee cup set designed to enhance your coffee experience. Perfect for special occasions or as a thoughtful gift.
', CAST(10.00 AS Decimal(10, 2)), 26, 86, CAST(N'2024-11-13T18:08:34.6818625' AS DateTime2), N'2dedc6c4-c818-4b9c-810e-e3f9685262ff_1024x1024.webp', 20, N'approved', 0)
INSERT [dbo].[Products] ([product_id], [name], [description], [price], [store_id], [subcategory_id], [created_at], [image], [quantity], [Status], [is_deleted]) VALUES (163, N'B JN', N'VGBH', CAST(44.00 AS Decimal(10, 2)), 30, 81, CAST(N'2024-11-20T09:03:48.8023225' AS DateTime2), N'cff57865f09e61f76dbad943ff1584f0.jpg', 44, N'approved', 0)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[ShippingAddresses] ON 

INSERT [dbo].[ShippingAddresses] ([address_id], [user_id], [address], [city], [zip_code], [country]) VALUES (1, 1, N'123 Tech Street', N'Amman', N'11118', N'Jordan')
INSERT [dbo].[ShippingAddresses] ([address_id], [user_id], [address], [city], [zip_code], [country]) VALUES (2, 2, N'456 Beauty Blvd', N'Irbid', N'22118', N'Jordan')
SET IDENTITY_INSERT [dbo].[ShippingAddresses] OFF
GO
SET IDENTITY_INSERT [dbo].[Sizes] ON 

INSERT [dbo].[Sizes] ([SizeID], [SizeName]) VALUES (1, N'xs')
SET IDENTITY_INSERT [dbo].[Sizes] OFF
GO
SET IDENTITY_INSERT [dbo].[StoreOwners] ON 

INSERT [dbo].[StoreOwners] ([owner_id], [store_id], [owner_name], [email], [password], [passwordHash], [passwordSalt], [UserType]) VALUES (3, 10, N'swde', N'defrgt', N'dfrgt', 0x65DCEA3DAEBA419A318572F39B523AD29952CBB19060187B8564431C23E49E49A34D5C9652BA0E8F93048A59DA3354A590EB82B1F8A897EED6E09570B7131C58, 0x2171D97AC5208B792B138C387132DF17D950AE0A3EDEE2731C111CED1617841977654F99B51AA92C7E1B7CD3FEF0CF66C07436A01BFC31856D99D30D9FECBF05DDEDB4B14A9E48D1F81C29CBF6ED4485D9BD0E19FC7A0CCE7E5FE06E0A6F836ECC7F1D78F25C37BA3583DE18AF6EA4B06AC2BE168348E163A57648CCC723A8B5, N'StoreOwner')
INSERT [dbo].[StoreOwners] ([owner_id], [store_id], [owner_name], [email], [password], [passwordHash], [passwordSalt], [UserType]) VALUES (10, 30, N'Esraa Odat', N'WristaAndWatch@gmail.com', N'1231&&Aga8', 0xE39802E0B53EC01B3038FBEDAC64D8FA4A8D8E66D164AC50F37109CF8F8C94DDC6561D4644718CB9213AF089330376F74AE55CFC828873490C13BAAAF7F3CA04, 0x3A58FF81003A8AA7497D482CC56ACA7278222420F5F63D7600F11BB51A1F2908100C731EBAD531B7503E6536974877880E1BCE0FEADA8B6171D2EE3F5B7C4FD67B9A7B73D55567C5C379CB54973648D42BDF160915AAB3E6794559237A0D519089F0C3AB41EF884FC939999B7AE74C47587535F74818BA89312B9AF4161BDEF9, N'StoreOwner')
INSERT [dbo].[StoreOwners] ([owner_id], [store_id], [owner_name], [email], [password], [passwordHash], [passwordSalt], [UserType]) VALUES (58, 92, N'Esraa Odat ', N'esraaodat10@gmail.com', N'123123', 0x01E340488E63151BE5C99055F3952E07A8F28D9914F0DE67CCF7DC4DAF846D531A609ADF578E3C81EE38EA19B800139C9D77DF1436F9820E1B7C5C296AE72274, 0xBA2ED208AED92FCFFCE3D912C01B8BA66F3DEEC629F8D1D61DE3708AA384465A83CB4821D1F5D62B1857EF4E642B957B62E3D7C210606DDA355FFE94BE15DB18624A842081687398C12BEBDA62A7502874229BC47885D4C2293DEC8F33AC1597C8B624D7332579DE8C071907A844BBD32FD941676ADDD3F355DD23ECCA29A63E, N'StoreOwner')
SET IDENTITY_INSERT [dbo].[StoreOwners] OFF
GO
SET IDENTITY_INSERT [dbo].[Stores] ON 

INSERT [dbo].[Stores] ([store_id], [store_name], [store_description], [store_logo], [background_image], [address], [city], [zip_code], [country], [phone_number], [created_at], [status], [plan_name], [plan_type], [amount], [start_date], [end_date]) VALUES (9, N'abu shakra', N'abu shakra abu shakraabu shakra abu shakraabu shakra abu shakraabu shakra abu shakraabu shakra abu shakraabu shakra abu shakraabu shakra abu shakraabu shakra abu shakraabu shakra abu shakraabu shakra abu shakraabu shakra abu shakraabu shakra abu shakraabu shakra abu shakraabu shakra abu shakraabu shakra abu shakraabu shakra abu shakraabu shakra abu shakraabu shakra abu shakraabu shakra abu shakraabu shakra abu shakraabu shakra abu shakraabu shakra abu shakraabu shakra abu shakraabu shakra abu shakraabu shakra abu shakraabu shakra abu shakraabu shakra abu shakraabu shakra abu shakraabu shakra abu shakraabu shakra abu shakraabu shakra abu shakraabu shakra abu shakraabu shakra abu shakraabu shakra abu shakraabu shakra abu shakraabu shakra abu shakraabu shakra abu shakraabu shakra abu shakraabu shakra abu shakraabu shakra abu shakraabu shakra abu shakraabu shakra abu shakraabu shakra abu shakraabu shakra abu shakraabu shakra abu shakraabu shakra abu shakraabu shakra abu shakraabu shakra abu shakra', N'df68ab36233557.Y3JvcCw0MDQsMzE2LDAsMA.png', N'df68ab36233557.Y3JvcCw0MDQsMzE2LDAsMA.png', N'jordan', N'irbid', N'48859', N'Jordan', N'0797109414', CAST(N'2024-09-22T16:09:12.3766667' AS DateTime2), N'inactive', N'monthly', N'monthly', NULL, CAST(N'2024-09-30T16:09:12.307' AS DateTime), CAST(N'2024-10-30T16:09:12.307' AS DateTime))
INSERT [dbo].[Stores] ([store_id], [store_name], [store_description], [store_logo], [background_image], [address], [city], [zip_code], [country], [phone_number], [created_at], [status], [plan_name], [plan_type], [amount], [start_date], [end_date]) VALUES (10, N'Karamish Silver ', N'Karamish Silver ', N'images.png', N'images.png', N'jordan', N'irbid', N'48859', N'Jordan', N'0797109414', CAST(N'2024-09-22T16:11:26.5366667' AS DateTime2), N'active', N'monthly', N'monthly', NULL, CAST(N'2024-10-29T10:18:06.330' AS DateTime), CAST(N'2024-11-29T11:18:06.330' AS DateTime))
INSERT [dbo].[Stores] ([store_id], [store_name], [store_description], [store_logo], [background_image], [address], [city], [zip_code], [country], [phone_number], [created_at], [status], [plan_name], [plan_type], [amount], [start_date], [end_date]) VALUES (11, N'Real Cosmetics', N'Real Cosmetics Real Cosmetics', N'images (1).png', N'rrr.jpg', N'ghhhhh', N'irbid', N'48859', N'Jordan', N'444444', CAST(N'2024-09-22T16:14:56.1500000' AS DateTime2), N'inactive', N'monthly', N'monthly', NULL, CAST(N'2024-09-30T16:14:56.130' AS DateTime), CAST(N'2024-10-30T15:41:04.467' AS DateTime))
INSERT [dbo].[Stores] ([store_id], [store_name], [store_description], [store_logo], [background_image], [address], [city], [zip_code], [country], [phone_number], [created_at], [status], [plan_name], [plan_type], [amount], [start_date], [end_date]) VALUES (23, N'Elegant Accessories', N'A premium store for fashion accessories including watches, scarves, and designer bags. Perfect for gifting and personal style enhancement.', N'elegant_accessories_logo.jpg', N'elegant_accessories_logo.jpg', N'456 Fashion Blvd.', N'Amman', N'11111', N'Jordan', N'0792345678', CAST(N'2024-11-07T16:18:29.3833333' AS DateTime2), N'active', N'Monthly', N'Monthly', CAST(100.00 AS Decimal(10, 2)), CAST(N'2024-11-07T16:18:29.383' AS DateTime), CAST(N'2024-12-07T16:18:29.383' AS DateTime))
INSERT [dbo].[Stores] ([store_id], [store_name], [store_description], [store_logo], [background_image], [address], [city], [zip_code], [country], [phone_number], [created_at], [status], [plan_name], [plan_type], [amount], [start_date], [end_date]) VALUES (24, N'Fragrance Oasis', N'Explore a wide selection of luxury perfumes from global brands. We offer floral, woody, and oriental scents for every taste.', N'fragrance_oasis_logo.jpg', N'fragrance_oasis_logo.jpg', N'789 Aroma Ave.', N'Amman', N'11112', N'Jordan', N'0793456789', CAST(N'2024-11-07T16:18:29.3833333' AS DateTime2), N'active', N'Yearly', N'Yearly', CAST(500.00 AS Decimal(10, 2)), CAST(N'2024-11-07T16:18:29.383' AS DateTime), CAST(N'2025-11-07T16:18:29.383' AS DateTime))
INSERT [dbo].[Stores] ([store_id], [store_name], [store_description], [store_logo], [background_image], [address], [city], [zip_code], [country], [phone_number], [created_at], [status], [plan_name], [plan_type], [amount], [start_date], [end_date]) VALUES (25, N'Gifts in a Basket', N'Offering bespoke gift baskets for all occasions: birthdays, weddings, anniversaries, and more. Each basket is carefully curated.', N'gifts_in_a_basket.jpg', N'gifts_in_a_basket.jpg', N'101 Gift St.', N'Amman', N'11113', N'Jordan', N'0794567890', CAST(N'2024-11-07T16:18:29.3833333' AS DateTime2), N'active', N'Monthly', N'Monthly', CAST(100.00 AS Decimal(10, 2)), CAST(N'2024-11-07T16:18:29.383' AS DateTime), CAST(N'2024-12-07T16:18:29.383' AS DateTime))
INSERT [dbo].[Stores] ([store_id], [store_name], [store_description], [store_logo], [background_image], [address], [city], [zip_code], [country], [phone_number], [created_at], [status], [plan_name], [plan_type], [amount], [start_date], [end_date]) VALUES (26, N'Home Delight Gifts', N'A store for home-themed gifts such as decorative items, candles, and kitchen accessories. Perfect for housewarmings and home-loving friends.', N'home_delight_gifts_logo.jpg', N'home_delight_gifts_logo.jpg', N'202 Home Ave.', N'Amman', N'11114', N'Jordan', N'0795678901', CAST(N'2024-11-07T16:18:29.3833333' AS DateTime2), N'active', N'Yearly', N'Yearly', CAST(500.00 AS Decimal(10, 2)), CAST(N'2024-11-07T16:18:29.383' AS DateTime), CAST(N'2025-11-07T16:18:29.383' AS DateTime))
INSERT [dbo].[Stores] ([store_id], [store_name], [store_description], [store_logo], [background_image], [address], [city], [zip_code], [country], [phone_number], [created_at], [status], [plan_name], [plan_type], [amount], [start_date], [end_date]) VALUES (27, N'Luxury Silver Jewelry', N'Specializing in fine silver jewelry. Our collection includes rings, bracelets, necklaces, and earrings made from high-quality silver.', N'luxury_silver_jewelry_logo.jpg', N'luxury_silver_jewelry_logo.jpg', N'303 Silver Rd.', N'Amman', N'11115', N'Jordan', N'0796789012', CAST(N'2024-11-07T16:18:29.3833333' AS DateTime2), N'active', N'Monthly', N'Monthly', CAST(100.00 AS Decimal(10, 2)), CAST(N'2024-11-07T16:18:29.383' AS DateTime), CAST(N'2024-12-07T16:18:29.383' AS DateTime))
INSERT [dbo].[Stores] ([store_id], [store_name], [store_description], [store_logo], [background_image], [address], [city], [zip_code], [country], [phone_number], [created_at], [status], [plan_name], [plan_type], [amount], [start_date], [end_date]) VALUES (30, N'Wrist & Watch', N'A watch store offering luxury and stylish wristwatches, from casual to formal designs. A perfect gift for any occasion.', N'wrist_and_watch_logo.jpg', N'wrist_and_watch_logo.jpg', N'606 Time St.', N'Amman', N'11118', N'Jordan', N'0799012345', CAST(N'2024-11-07T16:20:24.7800000' AS DateTime2), N'active', N'Monthly', N'Monthly', CAST(100.00 AS Decimal(10, 2)), CAST(N'2024-11-07T16:20:24.780' AS DateTime), CAST(N'2024-12-07T16:20:24.780' AS DateTime))
INSERT [dbo].[Stores] ([store_id], [store_name], [store_description], [store_logo], [background_image], [address], [city], [zip_code], [country], [phone_number], [created_at], [status], [plan_name], [plan_type], [amount], [start_date], [end_date]) VALUES (31, N'Scarf Boutique', N'A boutique specializing in high-quality scarves and shawls, perfect for adding a touch of elegance to your outfit or as a gift.', N'scarf_boutique_logo.jpg', N'scarf_boutique_logo.jpg', N'707 Fashion Blvd.', N'Amman', N'11119', N'Jordan', N'0790123456', CAST(N'2024-11-07T16:20:24.7800000' AS DateTime2), N'active', N'Yearly', N'Yearly', CAST(500.00 AS Decimal(10, 2)), CAST(N'2024-11-07T16:20:24.780' AS DateTime), CAST(N'2025-11-07T16:20:24.780' AS DateTime))
INSERT [dbo].[Stores] ([store_id], [store_name], [store_description], [store_logo], [background_image], [address], [city], [zip_code], [country], [phone_number], [created_at], [status], [plan_name], [plan_type], [amount], [start_date], [end_date]) VALUES (32, N'Decor & More', N'Discover unique home decor items including vases, art pieces, and decorative furniture. Perfect for home makeovers and gifts.', N'decor_and_more_logo.jpg', N'decor_and_more_logo.jpg', N'808 Decor St.', N'Amman', N'11120', N'Jordan', N'0791239876', CAST(N'2024-11-07T16:20:24.7800000' AS DateTime2), N'active', N'Monthly', N'Monthly', CAST(100.00 AS Decimal(10, 2)), CAST(N'2024-11-07T16:20:24.780' AS DateTime), CAST(N'2024-12-07T16:20:24.780' AS DateTime))
INSERT [dbo].[Stores] ([store_id], [store_name], [store_description], [store_logo], [background_image], [address], [city], [zip_code], [country], [phone_number], [created_at], [status], [plan_name], [plan_type], [amount], [start_date], [end_date]) VALUES (33, N'Perfumed Dreams', N'A collection of the finest perfumes from around the world. Whether you prefer floral, woody, or fruity fragrances, we have something for everyone.', N'perfumed_dreams_logo.jpg', N'perfumed_dreams_logo.jpg', N'909 Aroma Blvd.', N'Amman', N'11121', N'Jordan', N'0792349876', CAST(N'2024-11-07T16:20:24.7800000' AS DateTime2), N'active', N'Yearly', N'Yearly', CAST(500.00 AS Decimal(10, 2)), CAST(N'2024-11-07T16:20:24.780' AS DateTime), CAST(N'2025-11-07T16:20:24.780' AS DateTime))
INSERT [dbo].[Stores] ([store_id], [store_name], [store_description], [store_logo], [background_image], [address], [city], [zip_code], [country], [phone_number], [created_at], [status], [plan_name], [plan_type], [amount], [start_date], [end_date]) VALUES (92, N'store name ', N'AQWSEDRFG', N'Pink and Grey Cute Minimalist Gift Shop Logo.png', N'Pink and Grey Cute Minimalist Gift Shop Logo.png', N'gf', N',', N'55Z', N'Jordan', N'0797109414', CAST(N'2024-11-20T12:00:41.3400000' AS DateTime2), N'active', N'monthly', N'monthly', NULL, CAST(N'2024-11-20T12:00:41.303' AS DateTime), CAST(N'2024-12-20T12:00:41.303' AS DateTime))
SET IDENTITY_INSERT [dbo].[Stores] OFF
GO
SET IDENTITY_INSERT [dbo].[SubCategories] ON 

INSERT [dbo].[SubCategories] ([subcategory_id], [category_id], [subcategory_name]) VALUES (5, 3, N'Rings')
INSERT [dbo].[SubCategories] ([subcategory_id], [category_id], [subcategory_name]) VALUES (6, 3, N'Necklaces')
INSERT [dbo].[SubCategories] ([subcategory_id], [category_id], [subcategory_name]) VALUES (7, 3, N'Bracelets')
INSERT [dbo].[SubCategories] ([subcategory_id], [category_id], [subcategory_name]) VALUES (8, 3, N'Earrings')
INSERT [dbo].[SubCategories] ([subcategory_id], [category_id], [subcategory_name]) VALUES (9, 3, N'Brooches')
INSERT [dbo].[SubCategories] ([subcategory_id], [category_id], [subcategory_name]) VALUES (71, 3, N'Studs')
INSERT [dbo].[SubCategories] ([subcategory_id], [category_id], [subcategory_name]) VALUES (72, 3, N'Hoops')
INSERT [dbo].[SubCategories] ([subcategory_id], [category_id], [subcategory_name]) VALUES (73, 3, N'Drop Earrings')
INSERT [dbo].[SubCategories] ([subcategory_id], [category_id], [subcategory_name]) VALUES (75, 3, N'Custom Jewelry')
INSERT [dbo].[SubCategories] ([subcategory_id], [category_id], [subcategory_name]) VALUES (76, 3, N'Gemstone Jewelry')
INSERT [dbo].[SubCategories] ([subcategory_id], [category_id], [subcategory_name]) VALUES (77, 28, N'Bags')
INSERT [dbo].[SubCategories] ([subcategory_id], [category_id], [subcategory_name]) VALUES (78, 28, N'Watches')
INSERT [dbo].[SubCategories] ([subcategory_id], [category_id], [subcategory_name]) VALUES (79, 28, N'Scarves & Shawls')
INSERT [dbo].[SubCategories] ([subcategory_id], [category_id], [subcategory_name]) VALUES (80, 28, N'Belts')
INSERT [dbo].[SubCategories] ([subcategory_id], [category_id], [subcategory_name]) VALUES (81, 28, N'Sunglasses')
INSERT [dbo].[SubCategories] ([subcategory_id], [category_id], [subcategory_name]) VALUES (82, 28, N'Hats & Caps')
INSERT [dbo].[SubCategories] ([subcategory_id], [category_id], [subcategory_name]) VALUES (83, 28, N'Hair Accessories')
INSERT [dbo].[SubCategories] ([subcategory_id], [category_id], [subcategory_name]) VALUES (84, 29, N'Candles')
INSERT [dbo].[SubCategories] ([subcategory_id], [category_id], [subcategory_name]) VALUES (85, 29, N'Decor Items')
INSERT [dbo].[SubCategories] ([subcategory_id], [category_id], [subcategory_name]) VALUES (86, 29, N'Kitchen Gadgets')
INSERT [dbo].[SubCategories] ([subcategory_id], [category_id], [subcategory_name]) VALUES (87, 29, N'Bedding & Linens')
INSERT [dbo].[SubCategories] ([subcategory_id], [category_id], [subcategory_name]) VALUES (88, 29, N'Home Fragrances')
INSERT [dbo].[SubCategories] ([subcategory_id], [category_id], [subcategory_name]) VALUES (89, 29, N'Furniture & Storage')
INSERT [dbo].[SubCategories] ([subcategory_id], [category_id], [subcategory_name]) VALUES (90, 29, N'Artwork & Prints')
INSERT [dbo].[SubCategories] ([subcategory_id], [category_id], [subcategory_name]) VALUES (91, 29, N'Plant Gifts')
INSERT [dbo].[SubCategories] ([subcategory_id], [category_id], [subcategory_name]) VALUES (92, 30, N'Mother''s Day')
INSERT [dbo].[SubCategories] ([subcategory_id], [category_id], [subcategory_name]) VALUES (93, 30, N'Birthday')
INSERT [dbo].[SubCategories] ([subcategory_id], [category_id], [subcategory_name]) VALUES (94, 30, N'Graduation')
INSERT [dbo].[SubCategories] ([subcategory_id], [category_id], [subcategory_name]) VALUES (95, 30, N'Valentine''s Day')
INSERT [dbo].[SubCategories] ([subcategory_id], [category_id], [subcategory_name]) VALUES (96, 30, N'Father''s Day')
INSERT [dbo].[SubCategories] ([subcategory_id], [category_id], [subcategory_name]) VALUES (97, 30, N'Anniversaries')
INSERT [dbo].[SubCategories] ([subcategory_id], [category_id], [subcategory_name]) VALUES (98, 30, N'New Year')
INSERT [dbo].[SubCategories] ([subcategory_id], [category_id], [subcategory_name]) VALUES (99, 30, N'Housewarming')
INSERT [dbo].[SubCategories] ([subcategory_id], [category_id], [subcategory_name]) VALUES (100, 30, N'Baby Showers')
INSERT [dbo].[SubCategories] ([subcategory_id], [category_id], [subcategory_name]) VALUES (101, 31, N'Curated Packages')
INSERT [dbo].[SubCategories] ([subcategory_id], [category_id], [subcategory_name]) VALUES (102, 31, N'Makeup & Personal Care Packages')
INSERT [dbo].[SubCategories] ([subcategory_id], [category_id], [subcategory_name]) VALUES (103, 31, N'Food & Drink Packages')
INSERT [dbo].[SubCategories] ([subcategory_id], [category_id], [subcategory_name]) VALUES (104, 32, N'Floral Perfumes')
INSERT [dbo].[SubCategories] ([subcategory_id], [category_id], [subcategory_name]) VALUES (105, 32, N'Citrus Perfumes')
INSERT [dbo].[SubCategories] ([subcategory_id], [category_id], [subcategory_name]) VALUES (106, 32, N'Woody Perfumes')
INSERT [dbo].[SubCategories] ([subcategory_id], [category_id], [subcategory_name]) VALUES (112, 35, N'CFVGBHNJ')
INSERT [dbo].[SubCategories] ([subcategory_id], [category_id], [subcategory_name]) VALUES (113, 35, N'CFVGBHNJ')
INSERT [dbo].[SubCategories] ([subcategory_id], [category_id], [subcategory_name]) VALUES (114, 35, N'B NH')
SET IDENTITY_INSERT [dbo].[SubCategories] OFF
GO
SET IDENTITY_INSERT [dbo].[Tags] ON 

INSERT [dbo].[Tags] ([tag_id], [tag_name]) VALUES (1, N'Handmade')
INSERT [dbo].[Tags] ([tag_id], [tag_name]) VALUES (2, N'Eco-Friendly')
INSERT [dbo].[Tags] ([tag_id], [tag_name]) VALUES (3, N'Personalized')
INSERT [dbo].[Tags] ([tag_id], [tag_name]) VALUES (4, N'Birthday')
INSERT [dbo].[Tags] ([tag_id], [tag_name]) VALUES (5, N'Holiday')
INSERT [dbo].[Tags] ([tag_id], [tag_name]) VALUES (6, N'Kids')
INSERT [dbo].[Tags] ([tag_id], [tag_name]) VALUES (7, N'Graduation')
INSERT [dbo].[Tags] ([tag_id], [tag_name]) VALUES (8, N'Art ')
SET IDENTITY_INSERT [dbo].[Tags] OFF
GO
INSERT [dbo].[UserRoles] ([UserID], [Role]) VALUES (1, N'Admin')
INSERT [dbo].[UserRoles] ([UserID], [Role]) VALUES (2, N'Client')
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([user_id], [name], [email], [phone_number], [image], [password], [passwordHash], [passwordSalt], [address], [points], [created_at]) VALUES (1, N'Alice Johnson', N'alice@example.com', N'0799876543', N'https://i.pinimg.com/564x/ec/e2/b0/ece2b0f541d47e4078aef33ffd22777e.jpg', N'password123', NULL, NULL, N'789 User Lane, Amman', 150, CAST(N'2024-09-20T17:05:58.0800000' AS DateTime2))
INSERT [dbo].[Users] ([user_id], [name], [email], [phone_number], [image], [password], [passwordHash], [passwordSalt], [address], [points], [created_at]) VALUES (2, N'Saja Odat', N'saja@gmail.com', N'0786543210', N'https://i.pinimg.com/564x/ec/e2/b0/ece2b0f541d47e4078aef33ffd22777e.jpg', N'password123', NULL, NULL, N'123 User Road, Irbid', 75, CAST(N'2024-09-20T17:05:58.0800000' AS DateTime2))
INSERT [dbo].[Users] ([user_id], [name], [email], [phone_number], [image], [password], [passwordHash], [passwordSalt], [address], [points], [created_at]) VALUES (16, N'majd', N'majd@gmail.com', NULL, N'https://i.pinimg.com/564x/ec/e2/b0/ece2b0f541d47e4078aef33ffd22777e.jpg', N'123', 0x3C5FED58B765F6D11386883B316CA1091956C19A16E55C9688A5072BD6B587E30789E3F50418AF5333C0E2F6DB895F80509830D57263C83896331D99D30552F1, 0xE5693B85B5687388BB1A59BB4FF7FE5CB6E84BD86DE8280048BA9A7716BAD4535DAB4FEC25D822AC5F2D0F1EC3EB56F0C0F9D7CDDF4CCF060381BF3BC49F2D8DDA6B3E39C0BB0BC880B83F7C420541A7EF0316AC5071114F0BC519992ECFD60A20809A311B01DD2C9E7E9EA11F558C95A388BF2B5B93E3599794CF8720869D6C, NULL, NULL, CAST(N'2024-09-23T16:57:50.7866667' AS DateTime2))
INSERT [dbo].[Users] ([user_id], [name], [email], [phone_number], [image], [password], [passwordHash], [passwordSalt], [address], [points], [created_at]) VALUES (22, N'majd  odat', N'majd1@gmail.com', N'0797109414', N'https://i.pinimg.com/564x/ec/e2/b0/ece2b0f541d47e4078aef33ffd22777e.jpg', N'123', 0xABE351126DCA0B023B4B493DBF0E3E91FEA31AD5E9FF1B1BC01F26EAA3262C65E993013F51A182F6BB49F717BA2FE208432098A452BB4377A8C93F7A201C9A12, 0x4230BE150C3FF1AE5224FF23D1437C3481652BCFDDBC7BBE9D564D5A6FAEBE93FADD2854AF409DE1390FAFC59E05ECC777D4AC63466878848C2EDEA9E64B97C7507A2EC11CE711C2F935BFAD883A3D615B4316D816D8853C481A409DF5BE28C852F63A63C7CAD7A9B00EEC9BE78FFAF5FC8467F906C2B6034317369372037483, NULL, NULL, CAST(N'2024-10-09T14:09:07.0166667' AS DateTime2))
INSERT [dbo].[Users] ([user_id], [name], [email], [phone_number], [image], [password], [passwordHash], [passwordSalt], [address], [points], [created_at]) VALUES (32, N'ESRAA Odat', N'dana@gmail.com', N'0797109414', N'https://i.pinimg.com/564x/ec/e2/b0/ece2b0f541d47e4078aef33ffd22777e.jpg', N'Aa123##66', 0x62942FF8413136D230BB07EF7A7823280333DA8C44EF2AB5B23F69AEF373AD33817591F212E64DA565DD70C236841EEC189CD48C737B6DD8BFBE72EF30FEEA31, 0xB5301643F0B7CF903ADA8EFFFC441516A873B5DF9663C7A97715F9868124B14A34A33AF3A4B9D2DEA8892503073AE699207CBBC1F3DA24C74900480388098E4E56E8F66FB1162DD29C7259ACC82D8D75074F9F46B23715EFFAD1CFB2649A5BA24E927E9299434949781519152F580483940D07EE0D215210F8EF3D4039615643, NULL, NULL, CAST(N'2024-10-27T18:24:19.2700000' AS DateTime2))
INSERT [dbo].[Users] ([user_id], [name], [email], [phone_number], [image], [password], [passwordHash], [passwordSalt], [address], [points], [created_at]) VALUES (36, N'Esraa Odat', N'esraa710@gmail.com', NULL, N'https://i.pinimg.com/564x/ec/e2/b0/ece2b0f541d47e4078aef33ffd22777e.jpg', N'Aa123##66', 0xC18505EBF3FE92553814210DEFB9185AAB728ABD1043E1DA1C9F14C6941BC60E9476768112A30120DBCB7F0CC1C962B1B388C1BF419EF19E1450AC4673D925D4, 0x86E769CF51B61AC4BF5C76FC06ABE5B4AB0493AA2480FB4F3A517E077A32337495D9D6A6BC3D5A84716B53FF8D9C1B5A8AEFC851CAECD3CF047EF857604842C6D909E4BB8E85173DE0176E8B4640AA5BDB93153BD45BFB3BFBBAA3D85EFED7C0A000B70A8D911E1EEF84E025B5C28FF6AB83AE3A0D0F20B791E6610F2187671A, NULL, NULL, CAST(N'2024-11-19T17:20:09.7933333' AS DateTime2))
INSERT [dbo].[Users] ([user_id], [name], [email], [phone_number], [image], [password], [passwordHash], [passwordSalt], [address], [points], [created_at]) VALUES (38, N'Esraa Odat', N'esraa11@gmail.com', NULL, N'https://i.pinimg.com/564x/ec/e2/b0/ece2b0f541d47e4078aef33ffd22777e.jpg', N'Aa123##66', 0x12F2092D2275E7995D165C23B998C8087B2393ED2A951D1DBE16E50CE49108359418A21D1FF8299F918A380E9781983EE16F60843D35A9C2FDB28555B4AC8041, 0xBE4E950D846943FED07C2918A1EDC7F775A68048A773AB09D867067578F1A26FBE7457F2D5E4A34ADB4ED201793854DE95A936A4765B5AB1407451A9BD9F98CBA682BA673684DEA70548133366FAAAF07A70F42F0B45025CBA1C1D335F1A291D4EBB24F2072F57E21976E158B8DBBEFAE75E0B4814DC409146BE83B7B5CDB441, NULL, NULL, CAST(N'2024-11-19T17:24:49.9033333' AS DateTime2))
INSERT [dbo].[Users] ([user_id], [name], [email], [phone_number], [image], [password], [passwordHash], [passwordSalt], [address], [points], [created_at]) VALUES (39, N'Esraa Odat', N'esraa14@gmail.com', N'0797109414', N'https://i.pinimg.com/564x/ec/e2/b0/ece2b0f541d47e4078aef33ffd22777e.jpg', N'Aa123##66', 0x8DF3404A6EFD7D2C77A4EDB0EC394DA5A7C2D28B8AA62FFDD5F4155889263F8DC48E2424EF04D165F22D6BC1084DE569DB8EF6089CB399517144E6CF2E20E208, 0x67ACACC6F8B3851E7E565D846D28C213FFB4E0BEB8310C86A82AC46E5E619159428CDC5AB0C4E92F993BB34306536C4CAEC54BD75996353E9460F0CCFD49DE3F001AFA13A67A34E9A13878F9974875C016A4524D1B2C53E4E0253783A724EAF0339529F5EE5F0CE3724D3A2554C8534B479D2FA3DB947C4632CFA52D62D47720, NULL, NULL, CAST(N'2024-11-19T17:28:54.8300000' AS DateTime2))
INSERT [dbo].[Users] ([user_id], [name], [email], [phone_number], [image], [password], [passwordHash], [passwordSalt], [address], [points], [created_at]) VALUES (40, N'Esraa Odat', N'esraaodat10@gmail.com', NULL, N'https://lh3.googleusercontent.com/a/ACg8ocJE0DyU4WfEh8ze2nNnwPE8m6tKisYUyCA7mKswfqAg1cYpgA=s96-c', NULL, NULL, NULL, NULL, NULL, CAST(N'2024-11-20T12:10:34.2833333' AS DateTime2))
INSERT [dbo].[Users] ([user_id], [name], [email], [phone_number], [image], [password], [passwordHash], [passwordSalt], [address], [points], [created_at]) VALUES (41, N'DANA ODAT', N'dana1111@gmail.com', NULL, N'https://i.pinimg.com/564x/ec/e2/b0/ece2b0f541d47e4078aef33ffd22777e.jpg', N'Aa123##66', 0xCB71C9F20A1F7E8D9D68368516E9E02381A45DB3AF8231FC734DD14CB6148735F872F881B3740A744A9919D76011549029DE06BC2441A1BF837F5E0AC1840FFA, 0x892C97583018BAB94DE7A576F7981AE4D2741D8D66DA97B3594FCA28B97E0FEAF0CD1B6F837CC9794A88AAF94BB74DBF54C916382E4F10051EE97CC329AE3DF11EFB3A9267E5024EF57E2D40672E40351B434C64BCF4AB128BA892B799EC6A9EFD2E547A7BCF807DC284ABF2516E67B54D52065A6FB2AEF5B5240EB54349FCE0, NULL, NULL, CAST(N'2024-11-20T12:11:44.3300000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET IDENTITY_INSERT [dbo].[Variant] ON 

INSERT [dbo].[Variant] ([variant_id], [product_id], [color_id], [size_id], [tag_id], [quantity], [image]) VALUES (27, 113, NULL, NULL, 4, NULL, NULL)
INSERT [dbo].[Variant] ([variant_id], [product_id], [color_id], [size_id], [tag_id], [quantity], [image]) VALUES (28, 113, NULL, NULL, 5, NULL, NULL)
INSERT [dbo].[Variant] ([variant_id], [product_id], [color_id], [size_id], [tag_id], [quantity], [image]) VALUES (29, 114, NULL, NULL, 4, NULL, NULL)
INSERT [dbo].[Variant] ([variant_id], [product_id], [color_id], [size_id], [tag_id], [quantity], [image]) VALUES (32, 117, NULL, NULL, 7, NULL, NULL)
INSERT [dbo].[Variant] ([variant_id], [product_id], [color_id], [size_id], [tag_id], [quantity], [image]) VALUES (33, 118, NULL, NULL, 7, NULL, NULL)
INSERT [dbo].[Variant] ([variant_id], [product_id], [color_id], [size_id], [tag_id], [quantity], [image]) VALUES (34, 119, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Variant] ([variant_id], [product_id], [color_id], [size_id], [tag_id], [quantity], [image]) VALUES (35, 120, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[Variant] ([variant_id], [product_id], [color_id], [size_id], [tag_id], [quantity], [image]) VALUES (36, 120, NULL, NULL, 8, NULL, NULL)
INSERT [dbo].[Variant] ([variant_id], [product_id], [color_id], [size_id], [tag_id], [quantity], [image]) VALUES (46, 125, NULL, NULL, 3, NULL, NULL)
INSERT [dbo].[Variant] ([variant_id], [product_id], [color_id], [size_id], [tag_id], [quantity], [image]) VALUES (47, 125, NULL, NULL, 4, NULL, NULL)
INSERT [dbo].[Variant] ([variant_id], [product_id], [color_id], [size_id], [tag_id], [quantity], [image]) VALUES (48, 126, NULL, NULL, 2, NULL, NULL)
INSERT [dbo].[Variant] ([variant_id], [product_id], [color_id], [size_id], [tag_id], [quantity], [image]) VALUES (49, 126, NULL, NULL, 3, NULL, NULL)
INSERT [dbo].[Variant] ([variant_id], [product_id], [color_id], [size_id], [tag_id], [quantity], [image]) VALUES (50, 126, NULL, NULL, 4, NULL, NULL)
INSERT [dbo].[Variant] ([variant_id], [product_id], [color_id], [size_id], [tag_id], [quantity], [image]) VALUES (51, 127, NULL, NULL, 2, NULL, NULL)
INSERT [dbo].[Variant] ([variant_id], [product_id], [color_id], [size_id], [tag_id], [quantity], [image]) VALUES (52, 127, NULL, NULL, 3, NULL, NULL)
INSERT [dbo].[Variant] ([variant_id], [product_id], [color_id], [size_id], [tag_id], [quantity], [image]) VALUES (53, 128, NULL, NULL, 2, NULL, NULL)
INSERT [dbo].[Variant] ([variant_id], [product_id], [color_id], [size_id], [tag_id], [quantity], [image]) VALUES (54, 128, NULL, NULL, 3, NULL, NULL)
INSERT [dbo].[Variant] ([variant_id], [product_id], [color_id], [size_id], [tag_id], [quantity], [image]) VALUES (55, 128, NULL, NULL, 4, NULL, NULL)
INSERT [dbo].[Variant] ([variant_id], [product_id], [color_id], [size_id], [tag_id], [quantity], [image]) VALUES (56, 129, NULL, NULL, 2, NULL, NULL)
INSERT [dbo].[Variant] ([variant_id], [product_id], [color_id], [size_id], [tag_id], [quantity], [image]) VALUES (57, 129, NULL, NULL, 3, NULL, NULL)
INSERT [dbo].[Variant] ([variant_id], [product_id], [color_id], [size_id], [tag_id], [quantity], [image]) VALUES (58, 130, NULL, NULL, 2, NULL, NULL)
INSERT [dbo].[Variant] ([variant_id], [product_id], [color_id], [size_id], [tag_id], [quantity], [image]) VALUES (59, 130, NULL, NULL, 3, NULL, NULL)
INSERT [dbo].[Variant] ([variant_id], [product_id], [color_id], [size_id], [tag_id], [quantity], [image]) VALUES (60, 131, NULL, NULL, 2, NULL, NULL)
INSERT [dbo].[Variant] ([variant_id], [product_id], [color_id], [size_id], [tag_id], [quantity], [image]) VALUES (61, 131, NULL, NULL, 3, NULL, NULL)
INSERT [dbo].[Variant] ([variant_id], [product_id], [color_id], [size_id], [tag_id], [quantity], [image]) VALUES (62, 132, NULL, NULL, 2, NULL, NULL)
INSERT [dbo].[Variant] ([variant_id], [product_id], [color_id], [size_id], [tag_id], [quantity], [image]) VALUES (63, 132, NULL, NULL, 4, NULL, NULL)
INSERT [dbo].[Variant] ([variant_id], [product_id], [color_id], [size_id], [tag_id], [quantity], [image]) VALUES (64, 132, NULL, NULL, 7, NULL, NULL)
INSERT [dbo].[Variant] ([variant_id], [product_id], [color_id], [size_id], [tag_id], [quantity], [image]) VALUES (72, 135, NULL, NULL, 2, NULL, NULL)
INSERT [dbo].[Variant] ([variant_id], [product_id], [color_id], [size_id], [tag_id], [quantity], [image]) VALUES (73, 135, NULL, NULL, 4, NULL, NULL)
INSERT [dbo].[Variant] ([variant_id], [product_id], [color_id], [size_id], [tag_id], [quantity], [image]) VALUES (74, 136, NULL, NULL, 2, NULL, NULL)
INSERT [dbo].[Variant] ([variant_id], [product_id], [color_id], [size_id], [tag_id], [quantity], [image]) VALUES (113, 163, NULL, NULL, 2, NULL, NULL)
INSERT [dbo].[Variant] ([variant_id], [product_id], [color_id], [size_id], [tag_id], [quantity], [image]) VALUES (114, 163, NULL, NULL, 3, NULL, NULL)
INSERT [dbo].[Variant] ([variant_id], [product_id], [color_id], [size_id], [tag_id], [quantity], [image]) VALUES (115, 163, NULL, NULL, 4, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Variant] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_UserEmail]    Script Date: 11/22/2024 5:27:54 PM ******/
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [UQ_UserEmail] UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ_Variant]    Script Date: 11/22/2024 5:27:54 PM ******/
ALTER TABLE [dbo].[Variant] ADD  CONSTRAINT [UQ_Variant] UNIQUE NONCLUSTERED 
(
	[product_id] ASC,
	[color_id] ASC,
	[size_id] ASC,
	[tag_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cart] ADD  CONSTRAINT [DF_Cart_created_at]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[Cart] ADD  CONSTRAINT [DF_Cart_status]  DEFAULT ('open') FOR [status]
GO
ALTER TABLE [dbo].[Categories] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[Comments] ADD  DEFAULT (getdate()) FOR [comment_date]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_Status]  DEFAULT ('pending') FOR [Status]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT ((0)) FOR [is_deleted]
GO
ALTER TABLE [dbo].[StoreOwners] ADD  DEFAULT ('StoreOwner') FOR [UserType]
GO
ALTER TABLE [dbo].[Stores] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[Stores] ADD  DEFAULT ('active') FOR [status]
GO
ALTER TABLE [dbo].[Stores] ADD  CONSTRAINT [DF_Stores_start_date]  DEFAULT (getdate()) FOR [start_date]
GO
ALTER TABLE [dbo].[Subscriptions] ADD  DEFAULT (getdate()) FOR [StartDate]
GO
ALTER TABLE [dbo].[Subscriptions] ADD  DEFAULT ((1)) FOR [AutoRenew]
GO
ALTER TABLE [dbo].[Subscriptions] ADD  DEFAULT ('Active') FOR [Status]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_image_default]  DEFAULT ('https://i.pinimg.com/564x/ec/e2/b0/ece2b0f541d47e4078aef33ffd22777e.jpg') FOR [image]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[Wishlist] ADD  DEFAULT (getdate()) FOR [added_at]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Cart_Item]  WITH CHECK ADD FOREIGN KEY([cart_id])
REFERENCES [dbo].[Cart] ([cart_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Cart_Item]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([product_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([product_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([product_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderItems]  WITH CHECK ADD FOREIGN KEY([order_id])
REFERENCES [dbo].[Orders] ([order_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderItems]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([product_id])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([payment_method_id])
REFERENCES [dbo].[PaymentMethods] ([method_id])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([store_id])
REFERENCES [dbo].[Stores] ([store_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Coupons] FOREIGN KEY([copon_id])
REFERENCES [dbo].[Copons] ([copon_id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Coupons]
GO
ALTER TABLE [dbo].[ProductColors]  WITH CHECK ADD FOREIGN KEY([ColorID])
REFERENCES [dbo].[Colors] ([ColorID])
GO
ALTER TABLE [dbo].[ProductColors]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([product_id])
GO
ALTER TABLE [dbo].[ProductDiscounts]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([product_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductImages]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([product_id])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([store_id])
REFERENCES [dbo].[Stores] ([store_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([subcategory_id])
REFERENCES [dbo].[SubCategories] ([subcategory_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductSize]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([product_id])
GO
ALTER TABLE [dbo].[ProductSize]  WITH CHECK ADD FOREIGN KEY([SizeID])
REFERENCES [dbo].[Sizes] ([SizeID])
GO
ALTER TABLE [dbo].[ProductTags]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([product_id])
GO
ALTER TABLE [dbo].[ProductTags]  WITH CHECK ADD FOREIGN KEY([TagID])
REFERENCES [dbo].[Tags] ([tag_id])
GO
ALTER TABLE [dbo].[Shipments]  WITH CHECK ADD FOREIGN KEY([order_id])
REFERENCES [dbo].[Orders] ([order_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Shipments]  WITH CHECK ADD FOREIGN KEY([store_id])
REFERENCES [dbo].[Stores] ([store_id])
GO
ALTER TABLE [dbo].[ShippingAddresses]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[StoreOwners]  WITH CHECK ADD FOREIGN KEY([store_id])
REFERENCES [dbo].[Stores] ([store_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SubCategories]  WITH CHECK ADD FOREIGN KEY([category_id])
REFERENCES [dbo].[Categories] ([category_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserRole_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK_UserRole_User]
GO
ALTER TABLE [dbo].[Variant]  WITH CHECK ADD FOREIGN KEY([color_id])
REFERENCES [dbo].[Colors] ([ColorID])
GO
ALTER TABLE [dbo].[Variant]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([product_id])
GO
ALTER TABLE [dbo].[Variant]  WITH CHECK ADD FOREIGN KEY([size_id])
REFERENCES [dbo].[Sizes] ([SizeID])
GO
ALTER TABLE [dbo].[Variant]  WITH CHECK ADD FOREIGN KEY([tag_id])
REFERENCES [dbo].[Tags] ([tag_id])
GO
ALTER TABLE [dbo].[Wishlist]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([product_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Wishlist]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
ON DELETE CASCADE
GO
