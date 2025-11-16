import 'dart:io';

void main() {
  var capital = 'HANOI';
  play(capital);
}

void play(String word) {
  var hidden = '*' * word.length;
  while (hidden.contains('*')) {
    print('Tu can doan: $hidden');
    stdout.write('Nhap ky tu: ');
    var input = stdin.readLineSync() ?? '';
    var c = input[0].toUpperCase();
    bool found = false;
    var newHidden = hidden.split('');
    for (int i = 0; i < word.length; i++) {
      if (word[i] == c) {
        newHidden[i] = c;
        found = true;
      }
    }
    hidden = newHidden.join('');
    if (found) {
      print('Chuc mung ban da doan dung!');
    } else {
      print('Sai roi!');
    }
  }
  print('Chuc mung ban da doan dung! Tu can doan la $word');
}
