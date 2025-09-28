import 'dart:io';

//code by NotTie
void main() {
  String kq = 'flutter';
  List<String> mang = kq.split('');
  mang.shuffle();
  String cauhoi = mang.join();
  print('Câu hỏi: $cauhoi');
  while (true) {
    print('Nhập đáp án: ');
    String? dapan = stdin.readLineSync();
    if (dapan == kq) {
      print('Chính xác!');
      break;
    } else {
      print('Sai rồi, nhập lại');
    }
  }
}
