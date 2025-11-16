import 'dart:async';
import 'dart:io';
Future<String> taiThongTinHocSinh(String mahocSinh) async {
  print('Bắt đầu tải thông tin học sinh cho mã $mahocSinh...');
  await Future.delayed(Duration(seconds: 2));
  if (mahocSinh == 'HS001') {
    return 'Nguyễn Văn A, Lớp 10A1';
  } else if (mahocSinh == 'HS002') {
    return 'Trần Thị B, Lớp 10A2';
  } else {
    throw Exception('Không tìm thấy thông tin học sinh cho mã $mahocSinh');
  }
}
void main() async {
  print('Nhập mã học sinh:');
  String? mahocSinh = stdin.readLineSync();
  if (mahocSinh == null || mahocSinh.isEmpty) {
    print('Mã học sinh không được để trống.');
    return;
  }
  try {
    String thongTin = await taiThongTinHocSinh(mahocSinh);
    print('Thông tin học sinh: $thongTin');
  } catch (e) {
    print('Lỗi: $e');
  }
}