import 'dart:io';

void main() {
  print('tao mat khau:');
  var mk = stdin.readLineSync();
  if (mk!.length < 10) {
    print('chua dat');
  } else if (mk.contains(RegExp(r'[0-9]')) &&
      mk.contains(RegExp(r'[A-Z]')) &&
      mk.contains(RegExp(r'[!@#$%^&*<>?]'))) {
    print('manh');
  } else {
    print('chua dat');
  }
}
