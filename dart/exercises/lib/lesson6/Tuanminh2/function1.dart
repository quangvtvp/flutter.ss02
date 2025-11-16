import 'dart:io';

void main() {
  List<String> debai = [
    'hocbai',
    'dichoi',
    'ngungon',
    'minhbao',
    'nghiakhi',
    'conrong'
  ];
  for (var entry in debai) {
    var list = entry.split('');
    list.shuffle();
    var shuffleWord = list.join();
    print(shuffleWord);
    print("nhập đáp án:");
    String answer;
    do {
      answer = stdin.readLineSync()!;
      if (answer.toLowerCase() == entry.toLowerCase()) {
        print("đúng");
        break;
      } else {
        print("nhập lại đáp án:");
      }
    } while (answer.toLowerCase() != entry.toLowerCase());
  }
}
