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
    //   if (guess == null || guess.length != 1) {
    //     print('vui long nhap 1 ki tu');
    //   }
    // } while (guess == null || guess.length != 1);
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
  play('uong');
}
