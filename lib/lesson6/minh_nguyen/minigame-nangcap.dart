import 'dart:io';

void play(String word) {
  var list = word.split('');
  list.shuffle();
  var shuffleword = list.join('');
  print(shuffleword);
  String? guess;
  for (var i = 1; i <= 3; i++) {
    print('nhap tu ban doan lan thu $i:');
    guess = stdin.readLineSync();
    if (guess == word) {
      print('chinh xac!');
      break;
    } else {
      if (i == 3) {
        print('ban het luot doan, tu dung la: $word');
      } else {
        print('doan lai nao');
      }
    }
  }
}

void main() {
  List<String> words = [
    'choi game',
    'xem phim',
    'nghe nhac',
    'di choi',
    'doc truyen',
    'du lich',
    'chup anh',
    'an uong',
    'toan hoc',
    'van hoc'
  ];
  words.shuffle();
  play('${words[0]}');
}
