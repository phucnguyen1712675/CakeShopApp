# **CakeShop App DA03**

# Điểm đề nghị: 11đ
- 10đ Hoàn thành đẩy đủ yêu cầu đề
- 1.5đ Các chức năng bổ sung

### Thông tin nhóm
| MSSV     |           Họ và tên    |              Email           |
|:--------:|:----------------------:|:----------------------------:|
| 1712675  | Nguyễn Thành Vĩnh Phúc | 1712675@student.hcmus.edu.vn |
| 1712818  | Võ Thiện Tín           | 1712818@student.hcmus.edu.vn |
| 1712830  | Ngô Nha Trang          | 1712830@student.hcmus.edu.vn |

### Các chức năng làm được (100%)
 - SplashScreen (100% = 0.5đ)
    + Hiện thị thông tin chào mừng khi khởi chạy
    + Mỗi lần hiện thị ngẫu nhiên một thông tin thú vị về các loại bánh
    + Cho phép chọn check “Không hiện hộp thoại này mỗi khi khởi động”. Từ nay về sau đi thẳng vào màn hình HomeScreen luôn
 
 - HomeScreen (100% = 3.5đ)
    + Cho phép xem danh sách các món bánh theo loại, cho phép xem chi tiết để thấy giá, hình ảnh.
    + Có thể thêm một món bánh mới hoặc cập nhật thông tin bánh.
 
 - Create Order Screen (100% = 3đ)
    + Tạo ra đơn hàng bán bánh. Bao gồm thông tin loại bánh, số lượng mua, thông tin người nhận, tổng tiền đơn hàng.
 
 - Statistics (100% = 3đ)
    + Thống kê đồ thị hình cột doanh thu theo tháng. Xem trên biểu đồ cột, doanh thu từng tháng theo năm.
    + Thống kê đồ thị hình bánh cho biết tỉ lệ doanh thu theo loại bánh. 

### Các đặc điểm đặc sắc ( +1 đ)
 - Cho phép chỉnh sửa tên loại bánh.
 - Cho phép tìm kiếm bánh theo tên bánh với mode autocomplete.
 - Có Dark mode
 - Có học sử dụng package hỗ trợ thêm tạo giao diện.

### Con đường bất hạnh 
 - Check dữ liệu người dùng nhập vào
 - Có kiểm tra số lượng bánh còn lại trước khi thêm vào giỏ hàng
 
### Setup project
- Để chạy chương trình yêu cầu máy tính có cài đặt MSSQL.
- Mở file "CakeStore_Script.sql" trong thư mục "Release", Ctrl + f5 để thực thi các câu lệnh để khởi tạo cơ sở dữ liệu.
- Mở file "CakeShopApp.exe.Config" trong thư mục "Release/Release", thay phần "SERVER" thành Server Name chứa cơ sở dữ liệu vừa tạo.
- Chạy chương trình thực thi CakeShopApp.exe trong "Release/Release". Lưu ý, Khi Add/edit phần tử (Thêm bánh) có cần hình ảnh, thì các hình ảnh phải được copy/cut dô thư mục Release/Release/Image

### Link youtube demo
https://youtu.be/B7ZJSz8Hb94

### Ghi chú quyền
- Thầy có quyền sử dùng video demo , nhưng sourceCode thì nhóm em sẽ không public ra ạ