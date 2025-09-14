import 'dart:io';

void main() {
  print('tao mat khau cua ban');
  var mk = stdin.readLineSync();
  if (mk!.length < 8) {
    print('mat khau qua ngan');
    return;
  }
  if ((mk!.contains(RegExp(r'[0-9]'))) && (mk!.contains(RegExp(r'[A-Z]')))) {
    print('mat khau hop le');
  } else {
    print('mat khau phai co it nhat 1 so va 1 chu cai in hoa');
  }
}
