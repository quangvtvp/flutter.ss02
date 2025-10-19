import 'dart:io';

//code by NotTie
void main() {
  List<String> tuvung = [
    'a',
    'b',
    'c',
    'd',
    'e',
    'f',
    'g',
    'h',
    'i',
    'j',
    'k',
    'l',
    'm',
    'n',
    'o',
    'p',
    'q',
    'r',
    's',
    't',
    'u',
    'v',
    'w',
    'x',
    'y',
    'z'
  ];
  tuvung.shuffle();
  String kq = tuvung.sublist(0, 5).join();
  play(kq);
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
