import 'dart:io';

void main() {
  print('Input a number from keyboard: ');
  int? number = int.tryParse(stdin.readLineSync() ?? '');
  if (number == null || number < 0) {
    print('Invalid number!');
    return;
  } else {
    findTheFirstNumberDivisibleBy4And7(number);
  }
}

void forLoopBasic(int number) {
  for (int i = 0; i < number; i++) {
    // only print number divisible by 5
    if (i % 5 != 0) {
      continue;
    }
    print('i = $i');
  }
}

void findTheFirstNumberDivisibleBy4And7(int number) {
  for (int i = 0; i < number; i++) {
    if (i != 0 && i % 4 == 0 && i % 7 == 0) {
      print('The first number divisible by 4 and 7 is: $i');
      break;
    }
  }
}

void whileLoopBasic() {
  int i = 5;
  while (i >= 0) {
    print('i = $i');
    i--;
  }
}

void doWhileBasic() {
  int i = 0;
  do {
    print('i = $i');
    i++;
  } while (i < 5);
}

// Example: Tính tổng các số từ 1 đến n
// 1,2,3,4,5,...,n
int sumFrom1ToN(int n) {
  int sum = 0;
  for (int i = 1; i <= n; i++) {
    sum = sum + i;
  }
  return sum;
}

// 0 > + 1 + 2 + 3 + ... + n
