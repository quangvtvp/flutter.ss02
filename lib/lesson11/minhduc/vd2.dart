// Hàm này vẫn trả về một Future<String> sau 2 giây.
Future<String> layDuLieuNguoiDung() {
  return Future.delayed(Duration(seconds: 2), () => 'Dữ liệu người dùng: John Doe');
}

// Đánh dấu hàm main là async để có thể dùng await bên trong.
void main() async {
  print('Bắt đầu lấy dữ liệu...');
  print('Đang chờ kết quả...');

  // Dùng await để chờ Future hoàn thành và lấy giá trị.
  // Code trông giống như code đồng bộ!
  String ketQua = await layDuLieuNguoiDung();

  // Dòng này chỉ được thực thi sau khi await ở trên hoàn thành.
  print('Kết quả nhận được: $ketQua');
  print('Chương trình kết thúc.');
}