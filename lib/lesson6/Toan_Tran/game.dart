import 'dart:io';

void main() {
  String answer = 'Hoc bai';
  List<String> scrambled = ['h', 'c', 'b', 'o', 'i', 'a'];
  print('Sắp xếp lại các chữ cái sau để thành một từ có nghĩa:');
  print(scrambled.join(', '));
  stdout.write('Nhập đáp án của bạn: ');
  String? userInput = stdin.readLineSync();
  if (userInput != null &&
      userInput.replaceAll(' ', '').toLowerCase() ==
          answer.replaceAll(' ', '').toLowerCase()) {
    print('Chính xác! Bạn đã sắp xếp đúng.');
  } else {
    print('Sai rồi! Đáp án đúng là: $answer');
  }
}
