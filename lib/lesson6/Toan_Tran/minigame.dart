import 'dart:io';
void main() {
  String answer = 'Tran Anh Toan';
  List<String> scrambled = shuffleLetters(answer);
  print('Sắp xếp lại các chữ cái sau để thành một từ có nghĩa:');
  print(scrambled.join(', '));
  while (true) {
    String userInput = getUserInput();
    if ((userInput) == (answer)) {
      print('Chính xác!');
      break;
    } else {
      print('Sai rồi! Hãy thử lại.');
    }
  }
}
List<String> shuffleLetters(String word) {
  List<String> thu = [];
  for (int i = 0; i < word.length; i++) {
    if (word[i] != ' ') thu.add(word[i]);
  }
  if (thu.length > 1) {
    var temp = thu[0];
    thu[0] = thu[1];
    thu[1] = temp;
  }
  return thu;
}
String getUserInput() {
  stdout.write('Nhập đáp án của bạn: ');
  return stdin.readLineSync() ?? '';
}
String n(String s) {
  String result = '';
  for (int i = 0; i < s.length; i++) {
    if (s[i] != ' ') result += s[i].toLowerCase();
  }
  return result;
}