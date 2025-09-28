import 'dart:io';
void main() {
  print('xếp số sau theo thứ tự giảm dần');
  String dapan = '9876543210';
  List<String> mang = dapan.split('');
  mang.shuffle();
  String cauhoi = mang.join();
  print('Câu hỏi: $cauhoi');
  while (true) {
    print('Nhập đáp án: ');
    String? nhap = stdin.readLineSync();
    if (nhap != null && nhap.trim().toLowerCase() == dapan.toLowerCase()) {
      print('đúng');
      break;
    } else {
      print('Sai');
    }
  }
}