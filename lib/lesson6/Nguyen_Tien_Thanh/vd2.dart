import'dart:io';
void main() {
  String thuDo = 'Hanoi';

  for (int i = 0; i < thuDo.length; i++) {
    stdout.write('*');
  }
  print(' A.Hanoi B.Ho Chi Minh City C.Da Nang D.Hai Phong');
  String? doan= stdin.readLineSync();
  if(doan == 'A'){
    print('Chúc mừng bạn đã đoán đúng');
  } else {
    print('Bạn đã đoán sai, đáp án đúng là Hanoi');
  }
}