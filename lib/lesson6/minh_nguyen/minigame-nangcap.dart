import 'dart:io';

void play(String word) {
  var list = word.split('');
  list.shuffle();
  var shuffleword = list.join('');
  print(shuffleword);
  String? guess;
  for (var i = 1; i <= 5; i++) {
    print('nhap tu ban doan lan thu $i:');
    guess = stdin.readLineSync();
    if (guess == word) {
      print('chinh xac!');
      break;
    } else {
      if (i == 5) {
        print('ban het luot doan, tu dung la: $word');
      } else {
        print('doan lai nao');
      }
    }
  }
}

void main() {
  List<String> words = [
    'toan hoc',
    'van hoc',
    'lich su',
    'dia ly',
    'tieng anh',
    'tieng nga',
    'tieng phap',
    'the duc',
    'choi game',
    'xem phim',
    'nghe nhac',
    'di choi',
    'nau an',
    'doc sach',
    'du lich',
    'ngu nghi',
    'uong ca phe',
    'uong tra',
    'uong nuoc',
    'tam rua',
    'di cho',
    'lam viec',
    'hoc online'
  ];

  words.shuffle();
  play('${words[0]}');
}
