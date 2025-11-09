// Hàm này sẽ trả về một Future<String> sau 2 giây.
Future<String> layDuLieuNguoiDung() {
  return Future.delayed(Duration(seconds: 999), () {
    // Sau 2 giây, Future sẽ hoàn thành và trả về giá trị này.
    return 'Dữ liệu người dùng: John Doe';
  });
}

void main() {
  print('Bắt đầu lấy dữ liệu...');
  final future = layDuLieuNguoiDung();
  print('Đã gọi hàm, đang chờ kết quả...');
  print('Chương trình vẫn chạy mà không bị block.');

  // Cách xử lý Future "kiểu cũ" dùng .then()
  future.then((ketQua) {
    // Callback này sẽ được gọi khi Future hoàn thành thành công.
    print('Kết quả nhận được: $ketQua');
  }).catchError((loi) {
    // Callback này sẽ được gọi nếu Future hoàn thành với lỗi.
    print('Đã xảy ra lỗi: $loi');
  });
}