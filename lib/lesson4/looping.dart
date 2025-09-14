import 'dart:io';

void main() {
  printMultipleLinesFormat();
}

void simpleLoop() {
  for (var i = 0; i < 10; i++) {
    print(i);
  }
}

void simpleWhile() {
  var i = 10;
  while (i > 0) {
    print(i);
    i--;
  }
}

void simpleDoWhile() {
  var i = 10;
  do {
    print(i);
    i--;
  } while (i > 0);
}

void breakLoop() {
  for (var i = 0; i <= 100; i++) {
    if (i % 5 != 0) {
      continue;
    }
    print(i);
  }
}

void firstNumberDivisibleBy4and7() {
  for (var i = 1; i <= 100; i++) {
    if (i % 4 == 0 && i % 7 == 0) {
      print('the first number divisible by 4 and 7 is $i');
      break;
    }
  }
}

int tryToGetInputNumber() {
  // Uncomment the following lines if running in an environment that supports stdin

  while (true) {
    stdout.write('Enter a number: ');
    var input = stdin.readLineSync();
    var number = int.tryParse(input ?? '');
    if (number != null) {
      return number;
    }
    print('Invalid input. Please enter a valid number.');
  }
}

void printMultipleLinesFormat() {
  var text = '''
1. student 1
2. student 2
3. student 3
4. student 4''';
  print(text);
}
