import 'dart:io';

int hoho = genRandomNumber();
void startgame() {
  print('Chào mừng bạn đến với trò chơi đoán số!');
  hoidap();
}

void hoidap() {
  print('Nhập 1 số từ 1 đến 100:');
  String? input = stdin.readLineSync();
  int? a = int.tryParse(input ?? '');
  if (a == null) {
    print('Bạn phải nhập một số nguyên hợp lệ, vui lòng nhập lại.');
    hoidap();
  } else {
    xuly(a);
  }
}

void xuly(int a) {
  if (a < 1 || a > 100) {
    print('Số bạn nhập không hợp lệ, vui lòng nhập lại số từ 1 đến 100.');
    hoidap();
  } else {
    xuly2(a);
  }
}

void xuly2(int a) {
  if (a > hoho) {
    print('Số bạn nhập lớn hơn số bí mật, vui lòng nhập lại.');
    hoidap();
  } else if (a < hoho) {
    print('Số bạn nhập nhỏ hơn số bí mật, vui lòng nhập lại.');
    hoidap();
  } else {
    print('Chúc mừng bạn đã đoán đúng số bí mật là $hoho!');
  }
}

int genRandomNumber() {
  List<int> numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0];
  String randomNumber = '';
  for (int i = 0; i < 2; i++) {
    numbers.shuffle();
    randomNumber += numbers[0].toString();
  }
  int a = int.parse(randomNumber);
  if (a == 0) return 100;
  return a;
}

void main() {
  startgame();
}
