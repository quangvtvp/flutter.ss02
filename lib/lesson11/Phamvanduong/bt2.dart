import 'dart:async';

Future<String> taiThongTinHocSinh(String maHocSinh) async {
  print('Đang tải thông tin cho $maHocSinh...');
  await Future.delayed(Duration(seconds: 3));

  if (maHocSinh == 'HS001') {
    return 'Pham Van Duong - Lớp 11A2';
  } else if (maHocSinh == 'HS002') {
    return 'Tran Huu Gia Bao - Lớp 11A3';
  } else {
    throw Exception('Không tìm thấy học sinh với mã $maHocSinh');
  }
}

void main() async {
  try {
    String thongTin1 = await taiThongTinHocSinh('HS001');
    print('Kết quả: $thongTin1\n');
  } catch (e) {
    print('Lỗi: $e\n');
  }

  try {
    String thongTin2 = await taiThongTinHocSinh('HS002');
    print('Kết quả: $thongTin2\n');
  } catch (e) {
    print('Lỗi: $e\n');
  }

  try {
    String thongTin3 = await taiThongTinHocSinh('HS999');
    print('Kết quả: $thongTin3\n');
  } catch (e) {
    print('Lỗi: $e\n');
  }
}
