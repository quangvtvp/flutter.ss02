import 'dart:io';

//code by NotTie
void main() {
  play('hocbai');
}

void play(String kq) {
  print('Xào trộn chữ cái để tạo thành câu hỏi: ');
  List<String> mang = kq.split('');
  mang.shuffle();
  String cauhoi = mang.join();
  print('Câu hỏi: $cauhoi');
  while (true) {
    print('Nhập đáp án: ');
    String? dapan = stdin.readLineSync()!;
    if (dapan.toLowerCase() == kq) {
      print('Chính xác!');
      break;
    } else {
      print('Sai rồi, nhập lại');
    }
  }
}
