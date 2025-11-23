import 'dart:io';

void main() {
  bool t = true;
  while (t) {
    print('Please enter a positive number: ');
    int? n = int.tryParse(stdin.readLineSync() ?? '');
    if (n == null) {
      print('You picked an invalid number, please try again!');
      continue;
    } else if (n <= 0) {
      print('You picked a negative number, please try again!');
      continue;
    } else {
      t = false;
      print('___Prime numbers___');
      stdout.write('numbers: ');
      for (int i = 2; i <= n; i++) {
        stdout.write('\t$i');
      }
      stdout.write('\nprime:   ');
      for (int i = 2; i <= n; i++) {
        int m = 0;
        for (int j = 1; j <= i; j++) {
          if (i % j == 0) {
            m++;
          }
        }
        if (m == 2) {
          stdout.write('\t*');
        } else {
          stdout.write('\t ');
        }
      }
    }
  }
}
