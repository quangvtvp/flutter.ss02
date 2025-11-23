import 'dart:io';

void main() {
  List<String> khotu = ['accurate', 'adapt','ambition','analyze','apparent','appropriate','assume','attempt','collapse','compare','contribute','crucial','determine','emerge', 'enable','expand', 'flexible', 'ignore', 'maintain', 'persuade'];
  bool t = true;
  do {
    khotu.shuffle();
    String word =  khotu[0];
    List<String> dao = word.split('');
    dao.shuffle();
    String sword = dao.join();
    print('Hint: $sword');
    stdout.write('Nhập vào từ bạn đoán: ');
    String? n = (stdin.readLineSync() ?? '').toLowerCase();
    if (n == null || n.isEmpty) {
      print('vui lòng nhập lại');
      continue;
    } else if (n == word) {
      print('Chúc mừng bạn đã đoán đúng!');
      t = false;
    } else {
      print('Bạn đã đoán sai, thử lại nhé!');
    }
  } while (t);
  print('bạn có muốn chơi tiếp không? (y/n)');
  String? q = (stdin.readLineSync() ?? '').toLowerCase();
  switch (q) {
    case 'y': main(); break;
    case 'n': print('Cảm ơn bạn đã chơi!'); break;
    default: print('vui lòng nhập lại!'); break;
  }
}
