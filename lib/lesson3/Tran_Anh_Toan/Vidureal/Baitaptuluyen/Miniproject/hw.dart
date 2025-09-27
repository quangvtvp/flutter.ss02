import 'dart:io';

void main() {
  print('Nhập điểm Toán, Văn, Anh, Sử (cách nhau bằng khoảng trắng): ');
  String mon = stdin.readLineSync() ?? '';
  List<String> somon = mon.split(' ');
  if (somon.length != 4) {
    print('Bạn phải nhập đủ 4 môn.');
    return;
  }
  double? diemToan = double.tryParse(somon[0]);
  double? diemVan = double.tryParse(somon[1]);
  double? diemAnh = double.tryParse(somon[2]);
  double? diemSu = double.tryParse(somon[3]);
  if (diemToan == null ||
      diemVan == null ||
      diemAnh == null ||
      diemSu == null) {
    print('Điểm không hợp lệ.');
  }
  double diemTrungBinh = (diemToan! + diemVan! + diemAnh! + diemSu!) / 4;
  print('Điểm trung bình là: ${diemTrungBinh.toStringAsFixed(2)}');
  if (diemTrungBinh < 0 || diemTrungBinh > 10) {
    print('Điểm không hợp lệ. Vui lòng nhập lại.');
    return;
  }
  String rank;
  if (diemTrungBinh >= 9) {
    rank = 'Xuất sắc';
  } else if (diemTrungBinh >= 8) {
    rank = 'Giỏi';
  } else if (diemTrungBinh >= 6.5) {
    rank = 'Khá';
  } else if (diemTrungBinh >= 5) {
    rank = 'Trung bình';
  } else {
    rank = 'Yếu';
  }
  print('Xếp loại học lực: $rank');
}
