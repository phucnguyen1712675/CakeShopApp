USE [CAKESTORE]
GO
/****** Object:  Table [dbo].[CAKE]    Script Date: 12/26/2020 2:08:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CAKE](
	[CAKE_ID] [int] NOT NULL,
	[CAKE_NAME] [nvarchar](50) NOT NULL,
	[CAKE_TYPE] [int] NOT NULL,
	[PRICE] [float] NULL,
	[IMAGE] [nvarchar](100) NULL,
	[REMAINING_AMOUNT] [int] NOT NULL,
	[DESCRIPTION] [nvarchar](150) NULL,
 CONSTRAINT [PK_CAKE] PRIMARY KEY CLUSTERED 
(
	[CAKE_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CAKE_IN_ORDERS]    Script Date: 12/26/2020 2:08:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CAKE_IN_ORDERS](
	[ORDERS_ID] [int] NOT NULL,
	[CAKE_ID] [int] NOT NULL,
	[NUMBER] [int] NULL,
 CONSTRAINT [PK_CAKE_IN_ORDERS] PRIMARY KEY CLUSTERED 
(
	[ORDERS_ID] ASC,
	[CAKE_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CAKE_TYPE]    Script Date: 12/26/2020 2:08:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CAKE_TYPE](
	[TYPE_ID] [int] NOT NULL,
	[TYPE_NAME] [nvarchar](50) NULL,
 CONSTRAINT [PK_CAKE_TYPE] PRIMARY KEY CLUSTERED 
(
	[TYPE_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ORDERS]    Script Date: 12/26/2020 2:08:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ORDERS](
	[ORDERS_ID] [int] NOT NULL,
	[DATE_CREATE] [datetime] NULL,
	[CAKE_LIST] [int] NULL,
	[CUSTOMER_NAME] [nvarchar](50) NULL,
	[CUSTOMER_PHONE] [nchar](10) NULL,
	[CUSTOMER_ADDRESS] [nvarchar](150) NULL,
	[TOTAL_PRICE] [float] NULL,
 CONSTRAINT [PK_ORDERS] PRIMARY KEY CLUSTERED 
(
	[ORDERS_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[CAKE] ([CAKE_ID], [CAKE_NAME], [CAKE_TYPE], [PRICE], [IMAGE], [REMAINING_AMOUNT], [DESCRIPTION]) VALUES (1, N'Bánh kem soloca', 1, 250000, N'\\Image\\Cake\\1\\1.jpg
', 5, N'Bánh kem 3 tầng, được phủ bên ngoài bởi lớp socola đen và bên trên là lớp socola trắng.')
INSERT [dbo].[CAKE] ([CAKE_ID], [CAKE_NAME], [CAKE_TYPE], [PRICE], [IMAGE], [REMAINING_AMOUNT], [DESCRIPTION]) VALUES (2, N'Bánh Donut vị dâu', 2, 20000, N'\\Image\\Cake\\2\\2.jpg
', 20, N'Bánh Donut màu hồng nhạt bắt mắt cùng với hương vị của những quả dâu ngọt ngào. ')
INSERT [dbo].[CAKE] ([CAKE_ID], [CAKE_NAME], [CAKE_TYPE], [PRICE], [IMAGE], [REMAINING_AMOUNT], [DESCRIPTION]) VALUES (3, N'Bánh Flan trà xanh', 3, 12000, N'\\Image\\Cake\\3\\3.jpg
', 25, N'Bánh Flan trà xanh với màu sắc thiên nhiên bắt mắt và hương vị ngọt ngào của đường, sữa cũng như vị thanh mát của trà xanh.')
INSERT [dbo].[CAKE] ([CAKE_ID], [CAKE_NAME], [CAKE_TYPE], [PRICE], [IMAGE], [REMAINING_AMOUNT], [DESCRIPTION]) VALUES (4, N'Bánh Cookie giáng sinh', 4, 15000, N'\\Image\\Cake\\4\\4.jpg
', 50, N'Những chiếc bánh cookie mang đến không khí giáng sinh sẽ là món ăn tuyệt vời cho buổi tiệc của bạn.')
INSERT [dbo].[CAKE] ([CAKE_ID], [CAKE_NAME], [CAKE_TYPE], [PRICE], [IMAGE], [REMAINING_AMOUNT], [DESCRIPTION]) VALUES (5, N'CupCake dâu tây', 5, 27000, N'\\Image\\Cake\\5\\5.jpg
', 30, N'Một buổi tiệc trà không thể nào thiếu được những chiếc bánh Cupcake bé bé xinh xinh và hương vị ngọt ngào thì không thể nào quên được đúng không nào. ')
INSERT [dbo].[CAKE] ([CAKE_ID], [CAKE_NAME], [CAKE_TYPE], [PRICE], [IMAGE], [REMAINING_AMOUNT], [DESCRIPTION]) VALUES (6, N'Bánh Tiramisu ', 6, 40000, N'\\Image\\Cake\\6\\6.jpg
', 15, N'Buổi sáng thức dậy và thưởng thức một chiếc bánh Tiramisu ngọt ngào hòa tan khi đưa vào miệng với hương cà phê quen thuộc thì còn gì bằng. ')
INSERT [dbo].[CAKE] ([CAKE_ID], [CAKE_NAME], [CAKE_TYPE], [PRICE], [IMAGE], [REMAINING_AMOUNT], [DESCRIPTION]) VALUES (7, N'Bánh Mochi dâu tây', 7, 25000, N'\\Image\\Cake\\7\\7.jpg
', 50, N'Bánh mochi là sự hòa quyện tinh tế của vỏ, nhân và phần kem lạnh. Hãy cảm nhận độ dai dẻo của vỏ bánh, lớp kem xốp lạnh và phần nhân ngọt ngào nhé.')
INSERT [dbo].[CAKE] ([CAKE_ID], [CAKE_NAME], [CAKE_TYPE], [PRICE], [IMAGE], [REMAINING_AMOUNT], [DESCRIPTION]) VALUES (8, N'Bánh Dorayaki đậu đỏ', 8, 20000, N'\\Image\\Cake\\8\\8.jpg
', 45, N'Gồm 2 lớp vỏ bánh được nướng và phết lên lớp mật ong ngọt ngào, với phần nhân là đậu đỏ quen thuộc, hãy cùng thưởng thức món ăn của chú mèo máy nào')
INSERT [dbo].[CAKE] ([CAKE_ID], [CAKE_NAME], [CAKE_TYPE], [PRICE], [IMAGE], [REMAINING_AMOUNT], [DESCRIPTION]) VALUES (9, N'Bánh Macaron đa sắc', 9, 15000, N'\\Image\\Cake\\9\\9.jpg
', 60, N'Những chiếc bánh truyền thống của Pháp với nhiều hương vị và màu sắc, hãy cùng bạn bè hoặc gia đình thưởng thức những chiếc bánh trứ danh này nhé.')
INSERT [dbo].[CAKE] ([CAKE_ID], [CAKE_NAME], [CAKE_TYPE], [PRICE], [IMAGE], [REMAINING_AMOUNT], [DESCRIPTION]) VALUES (10, N'Bánh kem bắp', 1, 300000, N'\\Image\\Cake\\1\\10.jpg
', 5, N'Loại bánh kem  được làm ngoài những nguyên liệu truyền thống thì còn sử dụng thêm bắp làm nguyên liệu chính để tạo nên chiếc bánh đặc biệt này.')
INSERT [dbo].[CAKE] ([CAKE_ID], [CAKE_NAME], [CAKE_TYPE], [PRICE], [IMAGE], [REMAINING_AMOUNT], [DESCRIPTION]) VALUES (11, N'Bánh kem Noel', 1, 300000, N'\\Image\\Cake\\1\\11.jpg
', 5, N'Mùa giáng sinh này bạn muốn tổ chức một buổi tiệc và muốn đặt 1 chiếc bánh phù hợp. Hãy chọn ngay Bánh kem Noel cho bữa tiệc của bạn ngay nhé.')
INSERT [dbo].[CAKE] ([CAKE_ID], [CAKE_NAME], [CAKE_TYPE], [PRICE], [IMAGE], [REMAINING_AMOUNT], [DESCRIPTION]) VALUES (12, N'Bánh Flan trân châu đường đen', 3, 15000, N'\\Image\\Cake\\3\\12.jpg
', 50, N'Đây là một sự kết hợp mới và độc đáo đó, mềm mại của bánh Flan và độ dai, ngọt của trân châu đường đen sẽ đem đến cho bạn món ăn đáng thưởng thức.')
INSERT [dbo].[CAKE] ([CAKE_ID], [CAKE_NAME], [CAKE_TYPE], [PRICE], [IMAGE], [REMAINING_AMOUNT], [DESCRIPTION]) VALUES (13, N'CupCake Socks', 5, 20000, N'\\Image\\Cake\\5\\13.jpg
', 30, N'Với hương vị dịu nhẹ và trang trí đẹp mắt, những chiếc Cupcake này chính là lựa chọn hàng đầu cho bữa ăn nhẹ hoặc tráng miệng của gia đình bạn đó.')
INSERT [dbo].[CAKE] ([CAKE_ID], [CAKE_NAME], [CAKE_TYPE], [PRICE], [IMAGE], [REMAINING_AMOUNT], [DESCRIPTION]) VALUES (14, N'Bánh Mochi trong suốt', 7, 60000, N'\\Image\\Cake\\7\\14.jpg
', 20, N'Mochi trong suốt hay còn được gọi với cái tên Mochi Giọt nước, mang đậm hương vị Nhật Bản với hương vị ngọt ngào và độc đáo đang chờ bạn.')
INSERT [dbo].[CAKE] ([CAKE_ID], [CAKE_NAME], [CAKE_TYPE], [PRICE], [IMAGE], [REMAINING_AMOUNT], [DESCRIPTION]) VALUES (15, N'Bánh Dorayaki matcha', 8, 20000, N'\\Image\\Cake\\8\\15.jpg
', 30, N'Vẫn là chiếc bánh rán quen thuộc, nhưng nay lớp nhân đậu đỏ đã nhường chỗ cho hương vị Matcha thanh mát, hãy thưởng thức ngay nhé.')
INSERT [dbo].[CAKE] ([CAKE_ID], [CAKE_NAME], [CAKE_TYPE], [PRICE], [IMAGE], [REMAINING_AMOUNT], [DESCRIPTION]) VALUES (16, N'Bánh Cookie cây thông noel', 4, 12000, N'\\Image\\Cake\\4\\16.jpg
', 50, N'Bạn muốn nhấm nháp những chiếc bánh Cookie vào buổi tiệc Giáng sinh, vậy thì hãy chọn ngay món bánh nay nhé.')
INSERT [dbo].[CAKE] ([CAKE_ID], [CAKE_NAME], [CAKE_TYPE], [PRICE], [IMAGE], [REMAINING_AMOUNT], [DESCRIPTION]) VALUES (17, N'Bánh Cookie quả bóng', 4, 20000, N'\\Image\\Cake\\4\\17.jpg
', 20, N'Loại bánh Cookie được tạo hình như những quả bóng quen thuộc, phù hợp cho những cổ động viên thưởng thức khi xem các trận đấu đầy gay cấn đó.')
INSERT [dbo].[CAKE] ([CAKE_ID], [CAKE_NAME], [CAKE_TYPE], [PRICE], [IMAGE], [REMAINING_AMOUNT], [DESCRIPTION]) VALUES (18, N'Bánh Donut socola', 2, 20000, N'\\Image\\Cake\\2\\18.jpg
', 50, N'Những chiếc bánh Donut tròn tròn, phủ lên lớp socola đen nhánh và ngọt ngào.')
INSERT [dbo].[CAKE] ([CAKE_ID], [CAKE_NAME], [CAKE_TYPE], [PRICE], [IMAGE], [REMAINING_AMOUNT], [DESCRIPTION]) VALUES (19, N'Bánh kem Cầu vồng', 1, 350000, N'\\Image\\Cake\\1\\19.jpg
', 5, N'Chiếc bánh kem được tạo nên bởi nhiều màu sắc bắt mắt và rực rỡ, sẽ là tâm điểm của những buổi tiệc đó.')
INSERT [dbo].[CAKE] ([CAKE_ID], [CAKE_NAME], [CAKE_TYPE], [PRICE], [IMAGE], [REMAINING_AMOUNT], [DESCRIPTION]) VALUES (20, N'Bánh Cưới', 1, 500000, N'\\Image\\Cake\\1\\20.jpg
', 5, N'Bánh cưới và rượu vang là bộ đôi quen thuộc trong lễ thành hôn của các cặp đôi. Vì vậy nhớ gửi yêu cầu để nhận chiếc bánh thật phù hợp nhé.')
GO
INSERT [dbo].[CAKE_IN_ORDERS] ([ORDERS_ID], [CAKE_ID], [NUMBER]) VALUES (1, 1, 1)
INSERT [dbo].[CAKE_IN_ORDERS] ([ORDERS_ID], [CAKE_ID], [NUMBER]) VALUES (1, 2, 5)
INSERT [dbo].[CAKE_IN_ORDERS] ([ORDERS_ID], [CAKE_ID], [NUMBER]) VALUES (2, 3, 10)
INSERT [dbo].[CAKE_IN_ORDERS] ([ORDERS_ID], [CAKE_ID], [NUMBER]) VALUES (2, 4, 20)
INSERT [dbo].[CAKE_IN_ORDERS] ([ORDERS_ID], [CAKE_ID], [NUMBER]) VALUES (3, 5, 10)
INSERT [dbo].[CAKE_IN_ORDERS] ([ORDERS_ID], [CAKE_ID], [NUMBER]) VALUES (3, 6, 3)
INSERT [dbo].[CAKE_IN_ORDERS] ([ORDERS_ID], [CAKE_ID], [NUMBER]) VALUES (3, 7, 10)
GO
INSERT [dbo].[CAKE_TYPE] ([TYPE_ID], [TYPE_NAME]) VALUES (1, N'Bánh Kem')
INSERT [dbo].[CAKE_TYPE] ([TYPE_ID], [TYPE_NAME]) VALUES (2, N'Bánh Donut')
INSERT [dbo].[CAKE_TYPE] ([TYPE_ID], [TYPE_NAME]) VALUES (3, N'Bánh Flan')
INSERT [dbo].[CAKE_TYPE] ([TYPE_ID], [TYPE_NAME]) VALUES (4, N'Bánh Cookie')
INSERT [dbo].[CAKE_TYPE] ([TYPE_ID], [TYPE_NAME]) VALUES (5, N'Cup Cake')
INSERT [dbo].[CAKE_TYPE] ([TYPE_ID], [TYPE_NAME]) VALUES (6, N'Bánh Tiramisu')
INSERT [dbo].[CAKE_TYPE] ([TYPE_ID], [TYPE_NAME]) VALUES (7, N'Bánh Mochi')
INSERT [dbo].[CAKE_TYPE] ([TYPE_ID], [TYPE_NAME]) VALUES (8, N'Bánh Dorayaki')
INSERT [dbo].[CAKE_TYPE] ([TYPE_ID], [TYPE_NAME]) VALUES (9, N'Bánh Macaron')
INSERT [dbo].[CAKE_TYPE] ([TYPE_ID], [TYPE_NAME]) VALUES (10, N'Bánh Pizza')
GO
INSERT [dbo].[ORDERS] ([ORDERS_ID], [DATE_CREATE], [CAKE_LIST], [CUSTOMER_NAME], [CUSTOMER_PHONE], [CUSTOMER_ADDRESS], [TOTAL_PRICE]) VALUES (1, CAST(N'2020-12-20T00:00:00.000' AS DateTime), 1, N'Võ Thiện Tín', N'0332154460', N'117 Nghĩa Thục, P5, Q5', 350000)
INSERT [dbo].[ORDERS] ([ORDERS_ID], [DATE_CREATE], [CAKE_LIST], [CUSTOMER_NAME], [CUSTOMER_PHONE], [CUSTOMER_ADDRESS], [TOTAL_PRICE]) VALUES (2, CAST(N'2020-12-21T00:00:00.000' AS DateTime), 2, N'Văn Trọng Hân', N'0946751345', N'KTX Khu B, ĐHQG TPHCM', 420000)
INSERT [dbo].[ORDERS] ([ORDERS_ID], [DATE_CREATE], [CAKE_LIST], [CUSTOMER_NAME], [CUSTOMER_PHONE], [CUSTOMER_ADDRESS], [TOTAL_PRICE]) VALUES (3, CAST(N'2020-12-22T00:00:00.000' AS DateTime), 3, N'Lê Thị Bánh Bao', N'0945623156', N'227 Nguyễn Văn Cừ, P4, Q5', 640000)
GO
ALTER TABLE [dbo].[CAKE]  WITH CHECK ADD FOREIGN KEY([CAKE_TYPE])
REFERENCES [dbo].[CAKE_TYPE] ([TYPE_ID])
GO
ALTER TABLE [dbo].[CAKE_IN_ORDERS]  WITH CHECK ADD FOREIGN KEY([CAKE_ID])
REFERENCES [dbo].[CAKE] ([CAKE_ID])
GO
ALTER TABLE [dbo].[CAKE_IN_ORDERS]  WITH CHECK ADD  CONSTRAINT [FK__CAKE_IN_O__ORDER__47DBAE45] FOREIGN KEY([ORDERS_ID])
REFERENCES [dbo].[ORDERS] ([ORDERS_ID])
GO
ALTER TABLE [dbo].[CAKE_IN_ORDERS] CHECK CONSTRAINT [FK__CAKE_IN_O__ORDER__47DBAE45]
GO
