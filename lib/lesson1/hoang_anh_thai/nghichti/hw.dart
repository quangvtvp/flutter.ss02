//code by NotTie
//feat hatsune miku
import 'dart:io';

int inputscore() {
  print('Type score');
  print('team 1');
  int a = int.parse(stdin.readLineSync()!);
  return a;
}

void main() {
  print('Type score');
  print('team 1');
  int a = inputscore();
  print('team 2');
  int b = inputscore();
  if (a > b) {
    print('team 1 win');
  } else if (a < b) {
    print('team 2 win');
  } else {
    print('draw');
  }
}
