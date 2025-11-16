// Khai báo danh sách quyển sách
void main() {
  var books = [
    {'Tên sách': 'Các chuyên đề bồi dưỡng Hsg Toán', 'Tác giả': 'Trần Nam Dũng', 'Môn học': 'Toán', 'Số trang': 2020},
    {'Tên sách': 'BĐT Hình học', 'Tác giả': 'Hoàng NGọc Quang', 'Môn học': 'Toán', 'Số trang': 2019},
    {'Tên sách': 'PT và HPT', 'Tác giả': 'Nguyễn Tài Chung', 'Môn học': 'Toán', 'Số trang': 2021},
    {'Tên sách': 'Vật lý đại cương', 'Tác giả': 'Phạm Văn Đồng', 'Môn học': 'Vật Lý', 'Số trang': 2018},
    {'Tên sách': 'Hóa học cơ bản', 'Tác giả': 'Lê Văn Thiêm', 'Môn học': 'Hóa Học', 'Số trang': 2020},   
  ];
  for (var s in books) {
    print('Tên sách: ${s['Tên sách']}, Tác giả: ${s['Tác giả']}, Môn học: ${s['Môn học']}, Số trang: ${s['Số trang']}');
  }
}