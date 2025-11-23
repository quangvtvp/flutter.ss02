import 'dart:io';

void main() {
  String answer = 'Pham Minh Bao';
  int solandoan = 6;
  List<String> dapan = answer.toLowerCase().split('');
  List<String> hint = [];
  for (var i in dapan) {
    String a = (i == ' ') ? ' ' : '*';
    hint.add(a);
  }
  while (solandoan > 0 && hint.contains('*')) {
    print('Hint for u: ${hint.join('')}');
    stdout.write('Please enter an anphabet: ');
    String? input = stdin.readLineSync();
    if (input == null || input.isEmpty || input.length != 1) {
      print('Please enter a valid anphabet!');
      continue;
    } else {
      if (dapan.contains(input.toLowerCase())) {
        for (var i = 0; i < dapan.length; i++) {
          if (dapan[i] == input.toLowerCase()) {
            hint[i] = dapan[i];
            print('Correct!');
            print('Now, your hint is: ${hint.join()}');
          }
        }
      } else {
        print('Wrong!');
        solandoan -= 1;
        print('You have $solandoan chances left');
      }
    }
  }
  if (hint.contains('*') == false) {
    print('Congratulations! You guessed the answer: ${answer}');
  } else {
    print('You lost! The answer is: ${answer}');
  }
}
