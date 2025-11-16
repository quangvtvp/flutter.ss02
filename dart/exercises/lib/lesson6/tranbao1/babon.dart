import 'dart:io';
void main() {
  String dapan = 'marua';
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