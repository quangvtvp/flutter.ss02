import 'dart:io';

void main() {
  print('Miniproject: Module xếp loại học lực ');
  print('Xin chào bạn!');
  print('Nhập điểm toán(0-10): ');
  String? inputToan = stdin.readLineSync();
  print('Nhập điểm văn(0-10): ');
  String? inputVan = stdin.readLineSync();
  print('Nhập điểm anh(0-10): ');
  String? inputAnh = stdin.readLineSync();
  print('Nhập điểm sử(0-10): ');
  String? inputSu = stdin.readLineSync();

  double? diemToan = double.tryParse(inputToan!);
  double? diemVan = double.tryParse(inputVan!);
  double? diemAnh = double.tryParse(inputAnh!);
  double? diemSu = double.tryParse(inputSu!);

  double? diemTrungBinh = (diemToan! + diemVan! + diemAnh! + diemSu!) / 4;
  print('Điểm trung bình là: ${diemTrungBinh.toStringAsFixed(2)}');

  if (diemTrungBinh < 0 || diemTrungBinh > 10) {
    print('Điểm không hợp lệ. Vui lòng nhập lại.');
  } else {
    String xepLoai;
    if (diemTrungBinh >= 9) {
      xepLoai = 'Xuất sắc';
    } else if (diemTrungBinh >= 8) {
      xepLoai = 'Giỏi';
    } else if (diemTrungBinh >= 6.5) {
      xepLoai = 'Khá';
    } else if (diemTrungBinh >= 5) {
      xepLoai = 'Trung bình';
    } else {
      xepLoai = 'Yếu';
    }
    print('Xếp loại học lực: $xepLoai');
  }
}