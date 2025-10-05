import 'dart:io';

void main() {
  print("Nhập vào 1 từ:");
  String word = stdin.readLineSync()!;
  var list = word.split('');
  for (var i = 0; i < list.length; i++) {
    stdout.write('*');
  }
  List<String> list1 = List.filled(list.length, '*');

  do {
    print("Nhập 1 kí tự:");
    String char = stdin.readLineSync()!;

    for (var i = 0; i < list.length; i++) {
      if (list[i].toLowerCase() == char.toLowerCase()) {
        list1[i] = char;
        print(list1.join());
      }
    }
  } while (list1.contains("*"));
  print("Đây là đáp án: $word");
  return;
}
