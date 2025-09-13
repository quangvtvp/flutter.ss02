import 'dart:io';

void main() {
  print('nhập hạng:');
  String? rank = stdin.readLineSync();
  switch (rank) {
    case 'Bronze':
      print('Giảm 0%');
      break;
    case 'Silver':
      print('Giảm 5%');
      break;
    case 'Gold':
      print('Giảm 10%');
      break;
    case 'Platinum':
      print('Giảm 15%');
      break;
    default:
      print('Hạng không hợp lệ');
  }
}
