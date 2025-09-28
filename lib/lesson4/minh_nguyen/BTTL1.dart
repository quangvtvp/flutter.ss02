import 'dart:io';

void main() {
  for (var j = 1; j < 10; j++) {
    for (var i = 1; i < 10; i++) {
      stdout.write('$i x $j=${i * j}  ');
    }
    print('');
  }
}
