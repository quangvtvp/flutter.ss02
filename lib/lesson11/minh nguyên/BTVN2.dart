import 'dart:async';

Future<String> taiThongTinHocSinh(String maHocSinh) async {
  await Future.delayed(Duration(seconds: 3));
  if (maHocSinh == 'HS001') {
    return 'Nguyễn Văn A - Học sinh lớp 10A1';
  } else if (maHocSinh == 'HS002') {
    return 'Trần Thị B - Học sinh lớp 10A2';
  } else {
    throw Exception('Không tìm thấy thông tin học sinh với mã $maHocSinh');
  }
}

void main() async {
  try {
    String thongTin1 = await taiThongTinHocSinh('HS001');
    print('Thông tin học sinh: $thongTin1');
  } catch (e) {
    print('Lỗi: $e');
  }
  try {
    String thongTin2 = await taiThongTinHocSinh('HS002');
    print('Thông tin học sinh: $thongTin2');
  } catch (e) {
    print('Lỗi: $e');
  }
  try {
    String thongTin3 = await taiThongTinHocSinh('HS003');
    print('Thông tin học sinh: $thongTin3');
  } catch (e) {
    print('Lỗi: $e');
  }
}
