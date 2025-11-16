import 'dart:io';

void main() {
  var name2 = {
    'genyukiko': 'chơi game',
    'Nguyen Duy': 'xem phim',
    'GenYuki': 'nghe nhạc',
  };
  print('tên:');
  var namein = stdin.readLineSync();
  for (String name in name2.keys) {
    if (namein != name) {
      print('Where are you in my file');
      break;
    } else {
      print('Sở thích của $name là: ${name2[name]}');
    }
  }
}
