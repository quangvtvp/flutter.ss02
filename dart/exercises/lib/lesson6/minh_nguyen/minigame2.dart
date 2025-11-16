import 'dart:io';

void play(String word) {
  print('*' * word.length);
  var x = '*' * word.length;
  var listx = x.split('');
  var list = word.split('');
  String guess;
  do {
    print('nhap 1 ki tu trong tu ban doan:');
    guess = stdin.readLineSync()!;
    if (guess.length == 1) {
      for (var i = 0; i < list.length; i++) {
        if (list[i] == guess) {
          listx[i] = guess;
        }
      }
      print(listx.join(''));
      print('doan tiep nao:');
    } else if (guess.toLowerCase() == word.toLowerCase()) {
      listx = list;
    }
  } while (listx.join('').toLowerCase() != word.toLowerCase());
  print('chinh xac!');
}

void main() {
  List<String> words = [
    'toan',
    'van',
    'anh',
    'nga',
    'phap',
    'duc',
    'trung',
    'ly',
    'hoa',
    'sao',
    'may',
    'nang',
    'hoa',
    'sinh',
    'su',
    'dia',
    'truyen',
    'phim',
    'game',
    'vong'
  ];
  words.shuffle();
  play(words[2]);
}
