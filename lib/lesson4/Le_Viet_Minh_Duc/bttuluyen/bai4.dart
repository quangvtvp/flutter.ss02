import 'dart:io';

void main() {
  print('Xin chào bạn!');
  print('Chào mừng bạn đến với chương trình fibonacci!');

  late int n; 
  bool input = false;

  while (!input) {
    stdout.write('Vui lòng nhập một số nguyên dương n: ');
    String? userInput = stdin.readLineSync();
    int? parse = int.tryParse(userInput ?? ''); 

    if (parse != null && parse > 0) {
      n = parse; 
      input = true;
    } else {
      print('Số nhập vào không hợp lệ. Vui lòng nhập số nguyên dương.');
    }
  }

  int a = 0;
  int b = 1;

  print('Dãy số Fibonacci với $n số hạng đầu tiên là:');

  for (int i = 1; i <= n; i++) {
    stdout.write('$a ');
    int Fib = a + b; 
    a = b;               
    b = Fib;       
  }
  print(''); 
  print('Chương trình kết thúc. Cảm ơn bạn đã sử dụng!');
}