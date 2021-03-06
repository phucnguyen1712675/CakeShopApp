CREATE DATABASE [CAKESTORE]
GO
USE [CAKESTORE]
GO
/****** Object:  Table [dbo].[CAKE]    Script Date: 12/29/2020 10:04:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CAKE](
	[CAKE_ID] [int] NOT NULL IDENTITY(1,1),
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
/****** Object:  Table [dbo].[CAKE_IN_ORDERS]    Script Date: 12/29/2020 10:04:25 PM ******/
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
/****** Object:  Table [dbo].[CAKE_TYPE]    Script Date: 12/29/2020 10:04:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CAKE_TYPE](
	[TYPE_ID] [int] NOT NULL IDENTITY(1,1),
	[TYPE_NAME] [nvarchar](50) NULL,
 CONSTRAINT [PK_CAKE_TYPE] PRIMARY KEY CLUSTERED 
(
	[TYPE_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ORDERS]    Script Date: 12/29/2020 10:04:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ORDERS](
	[ORDERS_ID] [int] NOT NULL IDENTITY(1,1),
	[DATE_CREATE] [datetime] NULL,
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
INSERT [dbo].[CAKE] ( [CAKE_NAME], [CAKE_TYPE], [PRICE], [IMAGE], [REMAINING_AMOUNT], [DESCRIPTION]) VALUES ( N'Bánh kem soloca', 1, 250000, N'\\Image\\Cake\\1\\1.jpg
', 5, N'Bánh kem 3 tầng, được phủ bên ngoài bởi lớp socola đen và bên trên là lớp socola trắng.')
INSERT [dbo].[CAKE] ( [CAKE_NAME], [CAKE_TYPE], [PRICE], [IMAGE], [REMAINING_AMOUNT], [DESCRIPTION]) VALUES ( N'Bánh Donut vị dâu', 2, 20000, N'\\Image\\Cake\\2\\2.jpg
', 20, N'Bánh Donut màu hồng nhạt bắt mắt cùng với hương vị của những quả dâu ngọt ngào. ')
INSERT [dbo].[CAKE] ( [CAKE_NAME], [CAKE_TYPE], [PRICE], [IMAGE], [REMAINING_AMOUNT], [DESCRIPTION]) VALUES ( N'Bánh Flan trà xanh', 3, 12000, N'\\Image\\Cake\\3\\3.jpg
', 25, N'Bánh Flan trà xanh với màu sắc thiên nhiên bắt mắt và hương vị ngọt ngào của đường, sữa cũng như vị thanh mát của trà xanh.')
INSERT [dbo].[CAKE] ([CAKE_NAME], [CAKE_TYPE], [PRICE], [IMAGE], [REMAINING_AMOUNT], [DESCRIPTION]) VALUES ( N'Bánh Cookie giáng sinh', 4, 15000, N'\\Image\\Cake\\4\\4.jpg
', 50, N'Những chiếc bánh cookie mang đến không khí giáng sinh sẽ là món ăn tuyệt vời cho buổi tiệc của bạn.')
INSERT [dbo].[CAKE] ([CAKE_NAME], [CAKE_TYPE], [PRICE], [IMAGE], [REMAINING_AMOUNT], [DESCRIPTION]) VALUES ( N'CupCake dâu tây', 5, 27000, N'\\Image\\Cake\\5\\5.jpg
', 30, N'Một buổi tiệc trà không thể nào thiếu được những chiếc bánh Cupcake bé bé xinh xinh và hương vị ngọt ngào thì không thể nào quên được đúng không nào. ')
INSERT [dbo].[CAKE] ([CAKE_NAME], [CAKE_TYPE], [PRICE], [IMAGE], [REMAINING_AMOUNT], [DESCRIPTION]) VALUES ( N'Bánh Tiramisu ', 6, 40000, N'\\Image\\Cake\\6\\6.jpg
', 15, N'Buổi sáng thức dậy và thưởng thức một chiếc bánh Tiramisu ngọt ngào hòa tan khi đưa vào miệng với hương cà phê quen thuộc thì còn gì bằng. ')
INSERT [dbo].[CAKE] ([CAKE_NAME], [CAKE_TYPE], [PRICE], [IMAGE], [REMAINING_AMOUNT], [DESCRIPTION]) VALUES ( N'Bánh Mochi dâu tây', 7, 25000, N'\\Image\\Cake\\7\\7.jpg
', 50, N'Bánh mochi là sự hòa quyện tinh tế của vỏ, nhân và phần kem lạnh. Hãy cảm nhận độ dai dẻo của vỏ bánh, lớp kem xốp lạnh và phần nhân ngọt ngào nhé.')
INSERT [dbo].[CAKE] ( [CAKE_NAME], [CAKE_TYPE], [PRICE], [IMAGE], [REMAINING_AMOUNT], [DESCRIPTION]) VALUES ( N'Bánh Dorayaki đậu đỏ', 8, 20000, N'\\Image\\Cake\\8\\8.jpg
', 45, N'Gồm 2 lớp vỏ bánh được nướng và phết lên lớp mật ong ngọt ngào, với phần nhân là đậu đỏ quen thuộc, hãy cùng thưởng thức món ăn của chú mèo máy nào')
INSERT [dbo].[CAKE] ( [CAKE_NAME], [CAKE_TYPE], [PRICE], [IMAGE], [REMAINING_AMOUNT], [DESCRIPTION]) VALUES ( N'Bánh Macaron đa sắc', 9, 15000, N'\\Image\\Cake\\9\\9.jpg
', 60, N'Những chiếc bánh truyền thống của Pháp với nhiều hương vị và màu sắc, hãy cùng bạn bè hoặc gia đình thưởng thức những chiếc bánh trứ danh này nhé.')
INSERT [dbo].[CAKE] ( [CAKE_NAME], [CAKE_TYPE], [PRICE], [IMAGE], [REMAINING_AMOUNT], [DESCRIPTION]) VALUES ( N'Bánh kem bắp', 1, 300000, N'\\Image\\Cake\\1\\10.jpg
', 5, N'Loại bánh kem  được làm ngoài những nguyên liệu truyền thống thì còn sử dụng thêm bắp làm nguyên liệu chính để tạo nên chiếc bánh đặc biệt này.')
INSERT [dbo].[CAKE] ( [CAKE_NAME], [CAKE_TYPE], [PRICE], [IMAGE], [REMAINING_AMOUNT], [DESCRIPTION]) VALUES ( N'Bánh kem Noel', 1, 300000, N'\\Image\\Cake\\1\\11.jpg
', 5, N'Mùa giáng sinh này bạn muốn tổ chức một buổi tiệc và muốn đặt 1 chiếc bánh phù hợp. Hãy chọn ngay Bánh kem Noel cho bữa tiệc của bạn ngay nhé.')
INSERT [dbo].[CAKE] ( [CAKE_NAME], [CAKE_TYPE], [PRICE], [IMAGE], [REMAINING_AMOUNT], [DESCRIPTION]) VALUES ( N'Bánh Flan trân châu đường đen', 3, 15000, N'\\Image\\Cake\\3\\12.jpg
', 50, N'Đây là một sự kết hợp mới và độc đáo đó, mềm mại của bánh Flan và độ dai, ngọt của trân châu đường đen sẽ đem đến cho bạn món ăn đáng thưởng thức.')
INSERT [dbo].[CAKE] ( [CAKE_NAME], [CAKE_TYPE], [PRICE], [IMAGE], [REMAINING_AMOUNT], [DESCRIPTION]) VALUES ( N'CupCake Socks', 5, 20000, N'\\Image\\Cake\\5\\13.jpg
', 30, N'Với hương vị dịu nhẹ và trang trí đẹp mắt, những chiếc Cupcake này chính là lựa chọn hàng đầu cho bữa ăn nhẹ hoặc tráng miệng của gia đình bạn đó.')
INSERT [dbo].[CAKE] ( [CAKE_NAME], [CAKE_TYPE], [PRICE], [IMAGE], [REMAINING_AMOUNT], [DESCRIPTION]) VALUES ( N'Bánh Mochi trong suốt', 7, 60000, N'\\Image\\Cake\\7\\14.jpg
', 20, N'Mochi trong suốt hay còn được gọi với cái tên Mochi Giọt nước, mang đậm hương vị Nhật Bản với hương vị ngọt ngào và độc đáo đang chờ bạn.')
INSERT [dbo].[CAKE] ( [CAKE_NAME], [CAKE_TYPE], [PRICE], [IMAGE], [REMAINING_AMOUNT], [DESCRIPTION]) VALUES ( N'Bánh Dorayaki matcha', 8, 20000, N'\\Image\\Cake\\8\\15.jpg
', 30, N'Vẫn là chiếc bánh rán quen thuộc, nhưng nay lớp nhân đậu đỏ đã nhường chỗ cho hương vị Matcha thanh mát, hãy thưởng thức ngay nhé.')
INSERT [dbo].[CAKE] ( [CAKE_NAME], [CAKE_TYPE], [PRICE], [IMAGE], [REMAINING_AMOUNT], [DESCRIPTION]) VALUES ( N'Bánh Cookie cây thông noel', 4, 12000, N'\\Image\\Cake\\4\\16.jpg
', 50, N'Bạn muốn nhấm nháp những chiếc bánh Cookie vào buổi tiệc Giáng sinh, vậy thì hãy chọn ngay món bánh nay nhé.')
INSERT [dbo].[CAKE] ( [CAKE_NAME], [CAKE_TYPE], [PRICE], [IMAGE], [REMAINING_AMOUNT], [DESCRIPTION]) VALUES ( N'Bánh Cookie quả bóng', 4, 20000, N'\\Image\\Cake\\4\\17.jpg
', 20, N'Loại bánh Cookie được tạo hình như những quả bóng quen thuộc, phù hợp cho những cổ động viên thưởng thức khi xem các trận đấu đầy gay cấn đó.')
INSERT [dbo].[CAKE] ( [CAKE_NAME], [CAKE_TYPE], [PRICE], [IMAGE], [REMAINING_AMOUNT], [DESCRIPTION]) VALUES ( N'Bánh Donut socola', 2, 20000, N'\\Image\\Cake\\2\\18.jpg
', 50, N'Những chiếc bánh Donut tròn tròn, phủ lên lớp socola đen nhánh và ngọt ngào.')
INSERT [dbo].[CAKE] ( [CAKE_NAME], [CAKE_TYPE], [PRICE], [IMAGE], [REMAINING_AMOUNT], [DESCRIPTION]) VALUES ( N'Bánh kem Cầu vồng', 1, 350000, N'\\Image\\Cake\\1\\19.jpg
', 5, N'Chiếc bánh kem được tạo nên bởi nhiều màu sắc bắt mắt và rực rỡ, sẽ là tâm điểm của những buổi tiệc đó.')
INSERT [dbo].[CAKE] ( [CAKE_NAME], [CAKE_TYPE], [PRICE], [IMAGE], [REMAINING_AMOUNT], [DESCRIPTION]) VALUES ( N'Bánh Cưới', 1, 500000, N'\\Image\\Cake\\1\\20.jpg
', 5, N'Bánh cưới và rượu vang là bộ đôi quen thuộc trong lễ thành hôn của các cặp đôi. Vì vậy nhớ gửi yêu cầu để nhận chiếc bánh thật phù hợp nhé.')
GO
INSERT [dbo].[CAKE_IN_ORDERS] ([ORDERS_ID], [CAKE_ID], [NUMBER]) VALUES (1, 1, 5)
INSERT [dbo].[CAKE_IN_ORDERS] ([ORDERS_ID], [CAKE_ID], [NUMBER]) VALUES (1, 2, 50)
INSERT [dbo].[CAKE_IN_ORDERS] ([ORDERS_ID], [CAKE_ID], [NUMBER]) VALUES (2, 3, 10)
INSERT [dbo].[CAKE_IN_ORDERS] ([ORDERS_ID], [CAKE_ID], [NUMBER]) VALUES (2, 4, 100)
INSERT [dbo].[CAKE_IN_ORDERS] ([ORDERS_ID], [CAKE_ID], [NUMBER]) VALUES (3, 6, 15)
INSERT [dbo].[CAKE_IN_ORDERS] ([ORDERS_ID], [CAKE_ID], [NUMBER]) VALUES (3, 7, 50)
INSERT [dbo].[CAKE_IN_ORDERS] ([ORDERS_ID], [CAKE_ID], [NUMBER]) VALUES (4, 1, 10)
INSERT [dbo].[CAKE_IN_ORDERS] ([ORDERS_ID], [CAKE_ID], [NUMBER]) VALUES (5, 2, 200)
INSERT [dbo].[CAKE_IN_ORDERS] ([ORDERS_ID], [CAKE_ID], [NUMBER]) VALUES (5, 4, 200)
INSERT [dbo].[CAKE_IN_ORDERS] ([ORDERS_ID], [CAKE_ID], [NUMBER]) VALUES (6, 4, 160)
INSERT [dbo].[CAKE_IN_ORDERS] ([ORDERS_ID], [CAKE_ID], [NUMBER]) VALUES (6, 6, 40)
INSERT [dbo].[CAKE_IN_ORDERS] ([ORDERS_ID], [CAKE_ID], [NUMBER]) VALUES (7, 1, 20)
INSERT [dbo].[CAKE_IN_ORDERS] ([ORDERS_ID], [CAKE_ID], [NUMBER]) VALUES (8, 7, 80)
INSERT [dbo].[CAKE_IN_ORDERS] ([ORDERS_ID], [CAKE_ID], [NUMBER]) VALUES (8, 10, 10)
INSERT [dbo].[CAKE_IN_ORDERS] ([ORDERS_ID], [CAKE_ID], [NUMBER]) VALUES (9, 10, 10)
INSERT [dbo].[CAKE_IN_ORDERS] ([ORDERS_ID], [CAKE_ID], [NUMBER]) VALUES (10, 2, 100)
INSERT [dbo].[CAKE_IN_ORDERS] ([ORDERS_ID], [CAKE_ID], [NUMBER]) VALUES (10, 6, 20)
INSERT [dbo].[CAKE_IN_ORDERS] ([ORDERS_ID], [CAKE_ID], [NUMBER]) VALUES (11, 7, 80)
INSERT [dbo].[CAKE_IN_ORDERS] ([ORDERS_ID], [CAKE_ID], [NUMBER]) VALUES (11, 12, 100)
INSERT [dbo].[CAKE_IN_ORDERS] ([ORDERS_ID], [CAKE_ID], [NUMBER]) VALUES (12, 15, 200)
INSERT [dbo].[CAKE_IN_ORDERS] ([ORDERS_ID], [CAKE_ID], [NUMBER]) VALUES (13, 17, 200)
INSERT [dbo].[CAKE_IN_ORDERS] ([ORDERS_ID], [CAKE_ID], [NUMBER]) VALUES (14, 18, 170)
INSERT [dbo].[CAKE_IN_ORDERS] ([ORDERS_ID], [CAKE_ID], [NUMBER]) VALUES (15, 19, 8)
INSERT [dbo].[CAKE_IN_ORDERS] ([ORDERS_ID], [CAKE_ID], [NUMBER]) VALUES (16, 3, 50)
INSERT [dbo].[CAKE_IN_ORDERS] ([ORDERS_ID], [CAKE_ID], [NUMBER]) VALUES (17, 5, 80)
INSERT [dbo].[CAKE_IN_ORDERS] ([ORDERS_ID], [CAKE_ID], [NUMBER]) VALUES (18, 9, 10)
INSERT [dbo].[CAKE_IN_ORDERS] ([ORDERS_ID], [CAKE_ID], [NUMBER]) VALUES (19, 10, 8)
INSERT [dbo].[CAKE_IN_ORDERS] ([ORDERS_ID], [CAKE_ID], [NUMBER]) VALUES (20, 12, 10)
INSERT [dbo].[CAKE_IN_ORDERS] ([ORDERS_ID], [CAKE_ID], [NUMBER]) VALUES (20, 13, 50)
INSERT [dbo].[CAKE_IN_ORDERS] ([ORDERS_ID], [CAKE_ID], [NUMBER]) VALUES (21, 15, 60)
INSERT [dbo].[CAKE_IN_ORDERS] ([ORDERS_ID], [CAKE_ID], [NUMBER]) VALUES (22, 3, 200)
INSERT [dbo].[CAKE_IN_ORDERS] ([ORDERS_ID], [CAKE_ID], [NUMBER]) VALUES (23, 5, 200)
INSERT [dbo].[CAKE_IN_ORDERS] ([ORDERS_ID], [CAKE_ID], [NUMBER]) VALUES (24, 20, 5)
INSERT [dbo].[CAKE_IN_ORDERS] ([ORDERS_ID], [CAKE_ID], [NUMBER]) VALUES (25, 9, 200)
INSERT [dbo].[CAKE_IN_ORDERS] ([ORDERS_ID], [CAKE_ID], [NUMBER]) VALUES (26, 11, 8)
INSERT [dbo].[CAKE_IN_ORDERS] ([ORDERS_ID], [CAKE_ID], [NUMBER]) VALUES (27, 10, 9)
INSERT [dbo].[CAKE_IN_ORDERS] ([ORDERS_ID], [CAKE_ID], [NUMBER]) VALUES (28, 4, 200)
INSERT [dbo].[CAKE_IN_ORDERS] ([ORDERS_ID], [CAKE_ID], [NUMBER]) VALUES (29, 11, 10)
INSERT [dbo].[CAKE_IN_ORDERS] ([ORDERS_ID], [CAKE_ID], [NUMBER]) VALUES (30, 12, 10)
INSERT [dbo].[CAKE_IN_ORDERS] ([ORDERS_ID], [CAKE_ID], [NUMBER]) VALUES (31, 8, 150)
INSERT [dbo].[CAKE_IN_ORDERS] ([ORDERS_ID], [CAKE_ID], [NUMBER]) VALUES (32, 14, 30)
INSERT [dbo].[CAKE_IN_ORDERS] ([ORDERS_ID], [CAKE_ID], [NUMBER]) VALUES (33, 11, 5)
INSERT [dbo].[CAKE_IN_ORDERS] ([ORDERS_ID], [CAKE_ID], [NUMBER]) VALUES (34, 12, 10)
INSERT [dbo].[CAKE_IN_ORDERS] ([ORDERS_ID], [CAKE_ID], [NUMBER]) VALUES (35, 9, 200)
INSERT [dbo].[CAKE_IN_ORDERS] ([ORDERS_ID], [CAKE_ID], [NUMBER]) VALUES (36, 12, 200)
INSERT [dbo].[CAKE_IN_ORDERS] ([ORDERS_ID], [CAKE_ID], [NUMBER]) VALUES (37, 15, 150)
INSERT [dbo].[CAKE_IN_ORDERS] ([ORDERS_ID], [CAKE_ID], [NUMBER]) VALUES (38, 17, 150)
INSERT [dbo].[CAKE_IN_ORDERS] ([ORDERS_ID], [CAKE_ID], [NUMBER]) VALUES (39, 18, 140)
INSERT [dbo].[CAKE_IN_ORDERS] ([ORDERS_ID], [CAKE_ID], [NUMBER]) VALUES (40, 17, 140)
INSERT [dbo].[CAKE_IN_ORDERS] ([ORDERS_ID], [CAKE_ID], [NUMBER]) VALUES (41, 2, 150)
INSERT [dbo].[CAKE_IN_ORDERS] ([ORDERS_ID], [CAKE_ID], [NUMBER]) VALUES (42, 20, 5)
INSERT [dbo].[CAKE_IN_ORDERS] ([ORDERS_ID], [CAKE_ID], [NUMBER]) VALUES (43, 3, 400)
INSERT [dbo].[CAKE_IN_ORDERS] ([ORDERS_ID], [CAKE_ID], [NUMBER]) VALUES (44, 16, 175)
INSERT [dbo].[CAKE_IN_ORDERS] ([ORDERS_ID], [CAKE_ID], [NUMBER]) VALUES (45, 10, 10)
INSERT [dbo].[CAKE_IN_ORDERS] ([ORDERS_ID], [CAKE_ID], [NUMBER]) VALUES (46, 5, 50)
INSERT [dbo].[CAKE_IN_ORDERS] ([ORDERS_ID], [CAKE_ID], [NUMBER]) VALUES (47, 9, 100)
INSERT [dbo].[CAKE_IN_ORDERS] ([ORDERS_ID], [CAKE_ID], [NUMBER]) VALUES (48, 5, 100)
INSERT [dbo].[CAKE_IN_ORDERS] ([ORDERS_ID], [CAKE_ID], [NUMBER]) VALUES (49, 5, 100)
INSERT [dbo].[CAKE_IN_ORDERS] ([ORDERS_ID], [CAKE_ID], [NUMBER]) VALUES (50, 5, 100)
INSERT [dbo].[CAKE_IN_ORDERS] ([ORDERS_ID], [CAKE_ID], [NUMBER]) VALUES (51, 5, 100)
INSERT [dbo].[CAKE_IN_ORDERS] ([ORDERS_ID], [CAKE_ID], [NUMBER]) VALUES (52, 9, 100)
INSERT [dbo].[CAKE_IN_ORDERS] ([ORDERS_ID], [CAKE_ID], [NUMBER]) VALUES (53, 9, 100)
INSERT [dbo].[CAKE_IN_ORDERS] ([ORDERS_ID], [CAKE_ID], [NUMBER]) VALUES (54, 10, 8)
GO
INSERT [dbo].[CAKE_TYPE] ( [TYPE_NAME]) VALUES (N'Bánh Kem')
INSERT [dbo].[CAKE_TYPE] ( [TYPE_NAME]) VALUES (N'Bánh Donut')
INSERT [dbo].[CAKE_TYPE] ( [TYPE_NAME]) VALUES (N'Bánh Flan')
INSERT [dbo].[CAKE_TYPE] ( [TYPE_NAME]) VALUES (N'Bánh Cookie')
INSERT [dbo].[CAKE_TYPE] ( [TYPE_NAME]) VALUES (N'Cup Cake')
INSERT [dbo].[CAKE_TYPE] ( [TYPE_NAME]) VALUES (N'Bánh Tiramisu')
INSERT [dbo].[CAKE_TYPE] ( [TYPE_NAME]) VALUES (N'Bánh Mochi')
INSERT [dbo].[CAKE_TYPE] ( [TYPE_NAME]) VALUES (N'Bánh Dorayaki')
INSERT [dbo].[CAKE_TYPE] ( [TYPE_NAME]) VALUES (N'Bánh Macaron')
INSERT [dbo].[CAKE_TYPE] ( [TYPE_NAME]) VALUES (N'Bánh Pizza')
GO
INSERT [dbo].[ORDERS] ( [DATE_CREATE], [CUSTOMER_NAME], [CUSTOMER_PHONE], [CUSTOMER_ADDRESS], [TOTAL_PRICE]) VALUES (CAST(N'2020-12-20T00:00:00.000' AS DateTime), N'Võ Thiện Tín', N'0332154460', N'117 Nghĩa Thục, P5, Q5', 2250000)
INSERT [dbo].[ORDERS] ( [DATE_CREATE], [CUSTOMER_NAME], [CUSTOMER_PHONE], [CUSTOMER_ADDRESS], [TOTAL_PRICE]) VALUES (CAST(N'2020-12-21T00:00:00.000' AS DateTime), N'Văn Trọng Hân', N'0946751345', N'KTX Khu B, ĐHQG TPHCM', 1620000)
INSERT [dbo].[ORDERS] ( [DATE_CREATE], [CUSTOMER_NAME], [CUSTOMER_PHONE], [CUSTOMER_ADDRESS], [TOTAL_PRICE]) VALUES (CAST(N'2020-11-22T00:00:00.000' AS DateTime), N'Lê Thị Bánh Bao', N'0945623156', N'227 Nguyễn Văn Cừ, P4, Q5', 1500000)
INSERT [dbo].[ORDERS] ( [DATE_CREATE], [CUSTOMER_NAME], [CUSTOMER_PHONE], [CUSTOMER_ADDRESS], [TOTAL_PRICE]) VALUES (CAST(N'2020-11-11T00:00:00.000' AS DateTime), N'Trần Quốc Hùng', N'0961566517', N'129 Điện Biên Phủ', 2500000)
INSERT [dbo].[ORDERS] ( [DATE_CREATE], [CUSTOMER_NAME], [CUSTOMER_PHONE], [CUSTOMER_ADDRESS], [TOTAL_PRICE]) VALUES (CAST(N'2020-10-03T00:00:00.000' AS DateTime), N'Lê Thị Ngọc Nữ', N'0915651671', N'254 Huỳnh Tấn Phát', 4600000)
INSERT [dbo].[ORDERS] ( [DATE_CREATE], [CUSTOMER_NAME], [CUSTOMER_PHONE], [CUSTOMER_ADDRESS], [TOTAL_PRICE]) VALUES (CAST(N'2020-09-06T00:00:00.000' AS DateTime), N'Nguyễn Quốc Thi', N'0971655131', N'359 Lê Văn Việt', 4000000)
INSERT [dbo].[ORDERS] ( [DATE_CREATE], [CUSTOMER_NAME], [CUSTOMER_PHONE], [CUSTOMER_ADDRESS], [TOTAL_PRICE]) VALUES (CAST(N'2020-08-01T00:00:00.000' AS DateTime), N'Trần Thị Trang', N'0925261671', N'179 Nguyễn Đình Chiểu', 3500000)
INSERT [dbo].[ORDERS] ( [DATE_CREATE], [CUSTOMER_NAME], [CUSTOMER_PHONE], [CUSTOMER_ADDRESS], [TOTAL_PRICE]) VALUES (CAST(N'2020-07-08T00:00:00.000' AS DateTime), N'Nguyễn Phước Sang', N'0931435741', N'KTX Khu B, ĐHQG', 4000000)
INSERT [dbo].[ORDERS] ( [DATE_CREATE], [CUSTOMER_NAME], [CUSTOMER_PHONE], [CUSTOMER_ADDRESS], [TOTAL_PRICE]) VALUES (CAST(N'2020-06-01T00:00:00.000' AS DateTime), N'Nguyễn Thuận Phát', N'0915613172', N'KTX Khu B, ĐHQG', 3000000)
INSERT [dbo].[ORDERS] ( [DATE_CREATE], [CUSTOMER_NAME], [CUSTOMER_PHONE], [CUSTOMER_ADDRESS], [TOTAL_PRICE]) VALUES ( CAST(N'2020-05-01T00:00:00.000' AS DateTime), N'Bùi Văn Võ', N'0915617617', N'105 Lý Thái Tổ', 3400000)
INSERT [dbo].[ORDERS] ( [DATE_CREATE], [CUSTOMER_NAME], [CUSTOMER_PHONE], [CUSTOMER_ADDRESS], [TOTAL_PRICE]) VALUES ( CAST(N'2020-04-29T00:00:00.000' AS DateTime), N'Lý Quốc Thảo', N'0915616313', N'304 An Dương Vương', 3400000)
INSERT [dbo].[ORDERS] ( [DATE_CREATE], [CUSTOMER_NAME], [CUSTOMER_PHONE], [CUSTOMER_ADDRESS], [TOTAL_PRICE]) VALUES ( CAST(N'2020-03-07T00:00:00.000' AS DateTime), N'Nguyễn Đỗ Tùng Dương', N'0965616713', N'83 Sư Vạn Hạnh', 4000000)
INSERT [dbo].[ORDERS] ( [DATE_CREATE], [CUSTOMER_NAME], [CUSTOMER_PHONE], [CUSTOMER_ADDRESS], [TOTAL_PRICE]) VALUES ( CAST(N'2020-02-13T00:00:00.000' AS DateTime), N'Đỗ Thị Hoàng Yến', N'0919751565', N'142 Đường 3/2', 4000000)
INSERT [dbo].[ORDERS] ( [DATE_CREATE], [CUSTOMER_NAME], [CUSTOMER_PHONE], [CUSTOMER_ADDRESS], [TOTAL_PRICE]) VALUES ( CAST(N'2020-01-01T00:00:00.000' AS DateTime), N'Bùi Thị Tuyết Xuân', N'0915615671', N'11 Lê Hồng Phong', 3400000)
INSERT [dbo].[ORDERS] ( [DATE_CREATE], [CUSTOMER_NAME], [CUSTOMER_PHONE], [CUSTOMER_ADDRESS], [TOTAL_PRICE]) VALUES ( CAST(N'2019-12-25T00:00:00.000' AS DateTime), N'Văn Trọng Hân', N'0946751345', N'KTX Khu B, ĐHQG TPHCM', 2800000)
INSERT [dbo].[ORDERS] ( [DATE_CREATE], [CUSTOMER_NAME], [CUSTOMER_PHONE], [CUSTOMER_ADDRESS], [TOTAL_PRICE]) VALUES ( CAST(N'2019-11-06T00:00:00.000' AS DateTime), N'Bế Thị Như Nguyệt', N'0915616537', N'201 Trần Xuân Soạn', 600000)
INSERT [dbo].[ORDERS] ( [DATE_CREATE], [CUSTOMER_NAME], [CUSTOMER_PHONE], [CUSTOMER_ADDRESS], [TOTAL_PRICE]) VALUES ( CAST(N'2019-11-04T00:00:00.000' AS DateTime), N'Lê Văn Tư ', N'0954535156', N'KTX Khu B, ĐHQG TPHCM', 2160000)
INSERT [dbo].[ORDERS] ( [DATE_CREATE], [CUSTOMER_NAME], [CUSTOMER_PHONE], [CUSTOMER_ADDRESS], [TOTAL_PRICE]) VALUES ( CAST(N'2019-07-30T00:00:00.000' AS DateTime), N'Trần Thị Bảy', N'0955165327', N'Bến Lức, Long An', 150000)
INSERT [dbo].[ORDERS] ( [DATE_CREATE], [CUSTOMER_NAME], [CUSTOMER_PHONE], [CUSTOMER_ADDRESS], [TOTAL_PRICE]) VALUES ( CAST(N'2019-07-15T00:00:00.000' AS DateTime), N'Lê Nguyễn Xuân Mai', N'0915316314', N'KTX Khu B, ĐHQG TPHCM', 2400000)
INSERT [dbo].[ORDERS] ( [DATE_CREATE], [CUSTOMER_NAME], [CUSTOMER_PHONE], [CUSTOMER_ADDRESS], [TOTAL_PRICE]) VALUES ( CAST(N'2019-04-29T00:00:00.000' AS DateTime), N'Trần Thống Nhất', N'0915321465', N'127 Trần Xuân Soạn', 1150000)
INSERT [dbo].[ORDERS] ( [DATE_CREATE], [CUSTOMER_NAME], [CUSTOMER_PHONE], [CUSTOMER_ADDRESS], [TOTAL_PRICE]) VALUES ( CAST(N'2019-03-07T00:00:00.000' AS DateTime), N'Nguyễn Chí Hùng', N'0971515614', N'259 Lê Văn Việt', 1200000)
INSERT [dbo].[ORDERS] ( [DATE_CREATE], [CUSTOMER_NAME], [CUSTOMER_PHONE], [CUSTOMER_ADDRESS], [TOTAL_PRICE]) VALUES ( CAST(N'2019-01-03T00:00:00.000' AS DateTime), N'Kỳ Tuấn Khang', N'0915673144', N'115 Trần Tuấn Khải', 2450000)
INSERT [dbo].[ORDERS] ( [DATE_CREATE], [CUSTOMER_NAME], [CUSTOMER_PHONE], [CUSTOMER_ADDRESS], [TOTAL_PRICE]) VALUES ( CAST(N'2018-12-06T00:00:00.000' AS DateTime), N'Nguyễn Thu Đông', N'0951357144', N'36 Hùng Vương', 5400000)
INSERT [dbo].[ORDERS] ( [DATE_CREATE], [CUSTOMER_NAME], [CUSTOMER_PHONE], [CUSTOMER_ADDRESS], [TOTAL_PRICE]) VALUES ( CAST(N'2018-11-02T00:00:00.000' AS DateTime), N'Đỗ Thị Tuyết', N'0915317635', N'245 Đỗ Xuân Hợp', 2500000)
INSERT [dbo].[ORDERS] ( [DATE_CREATE], [CUSTOMER_NAME], [CUSTOMER_PHONE], [CUSTOMER_ADDRESS], [TOTAL_PRICE]) VALUES ( CAST(N'2018-11-01T00:00:00.000' AS DateTime), N'Nguyễn Thành Vĩnh Phúc', N'0915614475', N'635 Trần Phú', 3000000)
INSERT [dbo].[ORDERS] ( [DATE_CREATE], [CUSTOMER_NAME], [CUSTOMER_PHONE], [CUSTOMER_ADDRESS], [TOTAL_PRICE]) VALUES ( CAST(N'2018-10-10T00:00:00.000' AS DateTime), N'Nguyễn Thành Vĩnh Phúc', N'0915614475', N'635 Trần Phú', 2400000)
INSERT [dbo].[ORDERS] ( [DATE_CREATE], [CUSTOMER_NAME], [CUSTOMER_PHONE], [CUSTOMER_ADDRESS], [TOTAL_PRICE]) VALUES ( CAST(N'2018-10-05T00:00:00.000' AS DateTime), N'Nguyễn Thuận Phát', N'0915613172', N'KTX Khu B, ĐHQG', 2700000)
INSERT [dbo].[ORDERS] ( [DATE_CREATE], [CUSTOMER_NAME], [CUSTOMER_PHONE], [CUSTOMER_ADDRESS], [TOTAL_PRICE]) VALUES ( CAST(N'2018-09-24T00:00:00.000' AS DateTime), N'Trần Thống Nhất', N'0915321465', N'127 Trần Xuân Soạn', 3000000)
INSERT [dbo].[ORDERS] ( [DATE_CREATE], [CUSTOMER_NAME], [CUSTOMER_PHONE], [CUSTOMER_ADDRESS], [TOTAL_PRICE]) VALUES ( CAST(N'2018-09-05T00:00:00.000' AS DateTime), N'Nguyễn Thành Vĩnh Phúc', N'0915614475', N'635 Trần Phú', 3000000)
INSERT [dbo].[ORDERS] ( [DATE_CREATE], [CUSTOMER_NAME], [CUSTOMER_PHONE], [CUSTOMER_ADDRESS], [TOTAL_PRICE]) VALUES ( CAST(N'2018-08-06T00:00:00.000' AS DateTime), N'Lý Quốc Thảo', N'0915616313', N'304 An Dương Vương', 3000000)
INSERT [dbo].[ORDERS] ( [DATE_CREATE], [CUSTOMER_NAME], [CUSTOMER_PHONE], [CUSTOMER_ADDRESS], [TOTAL_PRICE]) VALUES ( CAST(N'2018-08-03T00:00:00.000' AS DateTime), N'Nguyễn Thành Vĩnh Phúc', N'0915614475', N'635 Trần Phú', 3000000)
INSERT [dbo].[ORDERS] ( [DATE_CREATE], [CUSTOMER_NAME], [CUSTOMER_PHONE], [CUSTOMER_ADDRESS], [TOTAL_PRICE]) VALUES ( CAST(N'2018-07-16T00:00:00.000' AS DateTime), N'Bùi Thị Tuyết Xuân', N'0915615671', N'11 Lê Hồng Phong', 1800000)
INSERT [dbo].[ORDERS] ( [DATE_CREATE], [CUSTOMER_NAME], [CUSTOMER_PHONE], [CUSTOMER_ADDRESS], [TOTAL_PRICE]) VALUES ( CAST(N'2018-07-10T00:00:00.000' AS DateTime), N'Nguyễn Thành Vĩnh Phúc', N'0915614475', N'635 Trần Phú', 1500000)
INSERT [dbo].[ORDERS] ( [DATE_CREATE], [CUSTOMER_NAME], [CUSTOMER_PHONE], [CUSTOMER_ADDRESS], [TOTAL_PRICE]) VALUES ( CAST(N'2018-07-03T00:00:00.000' AS DateTime), N'Nguyễn Thành Vĩnh Phúc', N'0915614475', N'635 Trần Phú', 3000000)
INSERT [dbo].[ORDERS] ( [DATE_CREATE], [CUSTOMER_NAME], [CUSTOMER_PHONE], [CUSTOMER_ADDRESS], [TOTAL_PRICE]) VALUES ( CAST(N'2018-06-25T00:00:00.000' AS DateTime), N'Văn Trọng Hân', N'0946751345', N'KTX Khu B, ĐHQG TPHCM', 3000000)
INSERT [dbo].[ORDERS] ( [DATE_CREATE], [CUSTOMER_NAME], [CUSTOMER_PHONE], [CUSTOMER_ADDRESS], [TOTAL_PRICE]) VALUES ( CAST(N'2018-06-07T00:00:00.000' AS DateTime), N'Nguyễn Thu Đông', N'0951357144', N'36 Hùng Vương', 3000000)
INSERT [dbo].[ORDERS] ( [DATE_CREATE], [CUSTOMER_NAME], [CUSTOMER_PHONE], [CUSTOMER_ADDRESS], [TOTAL_PRICE]) VALUES ( CAST(N'2018-05-17T00:00:00.000' AS DateTime), N'Nguyễn Thành Vĩnh Phúc', N'0915614475', N'635 Trần Phú', 3000000)
INSERT [dbo].[ORDERS] ( [DATE_CREATE], [CUSTOMER_NAME], [CUSTOMER_PHONE], [CUSTOMER_ADDRESS], [TOTAL_PRICE]) VALUES ( CAST(N'2018-05-10T00:00:00.000' AS DateTime), N'Trần Thị Bảy', N'0955165327', N'Bến Lức, Long An', 3000000)
INSERT [dbo].[ORDERS] ( [DATE_CREATE], [CUSTOMER_NAME], [CUSTOMER_PHONE], [CUSTOMER_ADDRESS], [TOTAL_PRICE]) VALUES ( CAST(N'2018-04-06T00:00:00.000' AS DateTime), N'Nguyễn Thành Vĩnh Phúc', N'0915614475', N'635 Trần Phú', 2800000)
INSERT [dbo].[ORDERS] ( [DATE_CREATE], [CUSTOMER_NAME], [CUSTOMER_PHONE], [CUSTOMER_ADDRESS], [TOTAL_PRICE]) VALUES ( CAST(N'2018-04-01T00:00:00.000' AS DateTime), N'Trần Thị Bảy', N'0955165327', N'Bến Lức, Long An', 2800000)
INSERT [dbo].[ORDERS] ( [DATE_CREATE], [CUSTOMER_NAME], [CUSTOMER_PHONE], [CUSTOMER_ADDRESS], [TOTAL_PRICE]) VALUES ( CAST(N'2018-03-26T00:00:00.000' AS DateTime), N'Nguyễn Thành Vĩnh Phúc', N'0915614475', N'635 Trần Phú', 3000000)
INSERT [dbo].[ORDERS] ( [DATE_CREATE], [CUSTOMER_NAME], [CUSTOMER_PHONE], [CUSTOMER_ADDRESS], [TOTAL_PRICE]) VALUES ( CAST(N'2018-03-15T00:00:00.000' AS DateTime), N'Nguyễn Chí Hùng', N'0971515614', N'259 Lê Văn Việt', 2500000)
INSERT [dbo].[ORDERS] ( [DATE_CREATE], [CUSTOMER_NAME], [CUSTOMER_PHONE], [CUSTOMER_ADDRESS], [TOTAL_PRICE]) VALUES ( CAST(N'2018-02-14T00:00:00.000' AS DateTime), N'Bế Thị Như Nguyệt', N'0915616537', N'201 Trần Xuân Soạn', 4900000)
INSERT [dbo].[ORDERS] ( [DATE_CREATE], [CUSTOMER_NAME], [CUSTOMER_PHONE], [CUSTOMER_ADDRESS], [TOTAL_PRICE]) VALUES ( CAST(N'2018-01-30T00:00:00.000' AS DateTime), N'Kỳ Tuấn Khang', N'0915673144', N'115 Trần Tuấn Khải', 2100000)
INSERT [dbo].[ORDERS] ( [DATE_CREATE], [CUSTOMER_NAME], [CUSTOMER_PHONE], [CUSTOMER_ADDRESS], [TOTAL_PRICE]) VALUES ( CAST(N'2018-01-14T00:00:00.000' AS DateTime), N'Lê Nguyễn Xuân Mai', N'0915316314', N'KTX Khu B, ĐHQG TPHCM', 3000000)
INSERT [dbo].[ORDERS] ( [DATE_CREATE], [CUSTOMER_NAME], [CUSTOMER_PHONE], [CUSTOMER_ADDRESS], [TOTAL_PRICE]) VALUES ( CAST(N'2019-10-04T00:00:00.000' AS DateTime), N'Lê Văn Tư ', N'0954535156', N'KTX Khu B, ĐHQG TPHCM', 1350000)
INSERT [dbo].[ORDERS] ( [DATE_CREATE], [CUSTOMER_NAME], [CUSTOMER_PHONE], [CUSTOMER_ADDRESS], [TOTAL_PRICE]) VALUES ( CAST(N'2019-10-30T00:00:00.000' AS DateTime), N'Trần Thị Bảy', N'0955165327', N'Bến Lức, Long An', 1500000)
INSERT [dbo].[ORDERS] ( [DATE_CREATE], [CUSTOMER_NAME], [CUSTOMER_PHONE], [CUSTOMER_ADDRESS], [TOTAL_PRICE]) VALUES ( CAST(N'2019-09-04T00:00:00.000' AS DateTime), N'Đỗ Thị Hoàng Yến', N'0919751565', N'142 Đường 3/2', 2700000)
INSERT [dbo].[ORDERS] ( [DATE_CREATE], [CUSTOMER_NAME], [CUSTOMER_PHONE], [CUSTOMER_ADDRESS], [TOTAL_PRICE]) VALUES ( CAST(N'2019-08-04T00:00:00.000' AS DateTime), N'Lê Văn Tư ', N'0954535156', N'KTX Khu B, ĐHQG TPHCM', 2700000)
INSERT [dbo].[ORDERS] ( [DATE_CREATE], [CUSTOMER_NAME], [CUSTOMER_PHONE], [CUSTOMER_ADDRESS], [TOTAL_PRICE]) VALUES ( CAST(N'2019-06-04T00:00:00.000' AS DateTime), N'Bế Thị Như Nguyệt', N'0915616537', N'201 Trần Xuân Soạn', 2700000)
INSERT [dbo].[ORDERS] ( [DATE_CREATE], [CUSTOMER_NAME], [CUSTOMER_PHONE], [CUSTOMER_ADDRESS], [TOTAL_PRICE]) VALUES ( CAST(N'2019-05-04T00:00:00.000' AS DateTime), N'Trần Thống Nhất', N'0915321465', N'127 Trần Xuân Soạn', 2700000)
INSERT [dbo].[ORDERS] ( [DATE_CREATE], [CUSTOMER_NAME], [CUSTOMER_PHONE], [CUSTOMER_ADDRESS], [TOTAL_PRICE]) VALUES ( CAST(N'2019-04-30T00:00:00.000' AS DateTime), N'Trần Thị Bảy', N'0955165327', N'Bến Lức, Long An', 1500000)
INSERT [dbo].[ORDERS] ( [DATE_CREATE], [CUSTOMER_NAME], [CUSTOMER_PHONE], [CUSTOMER_ADDRESS], [TOTAL_PRICE]) VALUES ( CAST(N'2019-03-30T00:00:00.000' AS DateTime), N'Trần Thống Nhất', N'0915321465', N'127 Trần Xuân Soạn', 1500000)
INSERT [dbo].[ORDERS] ( [DATE_CREATE], [CUSTOMER_NAME], [CUSTOMER_PHONE], [CUSTOMER_ADDRESS], [TOTAL_PRICE]) VALUES ( CAST(N'2019-02-15T00:00:00.000' AS DateTime), N'Lê Nguyễn Xuân Mai', N'0915316314', N'KTX Khu B, ĐHQG TPHCM', 2400000)
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
