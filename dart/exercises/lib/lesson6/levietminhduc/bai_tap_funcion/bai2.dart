import 'dart:io';

void main() {
  print('Mini Game 2: Tính toán theo với menu lựa chọn');
  print('Xin chào bạn!');
  print('Chào mừng bạn đến với chương trình máy tính đơn giản!');
  while (true) {
    print('\nVui lòng chọn phép tính:');
    print('1. Cộng (+)');
    print('2. Trừ (-)');
    print('3. Nhân (*)');
    print('4. Chia (/)');
    print('5. Thoát');
    stdout.write('Lựa chọn của bạn (1-5): ');
    String? choiceInput = stdin.readLineSync();
    int? choice = int.tryParse(choiceInput ?? '');
    if (choice == null || choice < 1 || choice > 5) {
      print('Lựa chọn không hợp lệ. Vui lòng chọn từ 1 đến 5.');
      continue;
    }
    if (choice == 5) {
      print('Cảm ơn bạn đã sử dụng chương trình. Tạm biệt!');
      break;
    }
    stdout.write('Nhập số thứ nhất: ');
    String? firstInput = stdin.readLineSync();
    double? num1 = double.tryParse(firstInput ?? '');
    if (num1 == null) {
      print('Số không hợp lệ. Vui lòng nhập lại.');
      continue;
    }
    stdout.write('Nhập số thứ hai: ');
    String? secondInput = stdin.readLineSync();
    double? num2 = double.tryParse(secondInput ?? '');
    if (num2 == null) {
      print('Số không hợp lệ. Vui lòng nhập lại.');
      continue;
    }
    double result;
    switch (choice) {
      case 1:
        result = num1 + num2;
        print('Kết quả: $num1 + $num2 = $result');
        break;
      case 2:
        result = num1 - num2;
        print('Kết quả: $num1 - $num2 = $result');
        break;
      case 3:
        result = num1 * num2;
        print('Kết quả: $num1 * $num2 = $result');
        break;
      case 4:
        if (num2 == 0) {
          print('Lỗi: Không thể chia cho 0. Vui lòng nhập lại.');
        } else {
          result = num1 / num2;
          print('Kết quả: $num1 / $num2 = $result');
        }
        break;
    }
  }
}
