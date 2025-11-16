import 'dart:io';

void showMenu() {
  print(" MÁY TÍNH ĐƠN GIẢN ");
  print("1. Cộng");
  print("2. Trừ");
  print("3. Nhân");
  print("4. Chia");
  print("0. Thoát");
  stdout.write("Chọn phép toán: ");
}

List<double> getTwoNumbers() {
  stdout.write("Nhập số thứ nhất: ");
  double a = double.parse(stdin.readLineSync()!);

  stdout.write("Nhập số thứ hai: ");
  double b = double.parse(stdin.readLineSync()!);

  return [a, b];
}

double add(double a, double b) => a + b;
double subtract(double a, double b) => a - b;
double multiply(double a, double b) => a * b;

double? divide(double a, double b) {
  if (b == 0) {
    print(" Lỗi: Không thể chia cho 0!");
    return null;
  }
  return a / b;
}

void main() {
  while (true) {
    showMenu();
    String choice = stdin.readLineSync()!;

    switch (choice) {
      case '1':
        var nums = getTwoNumbers();
        print("Kết quả: ${add(nums[0], nums[1])}");
        break;
      case '2':
        var nums = getTwoNumbers();
        print("Kết quả: ${subtract(nums[0], nums[1])}");
        break;
      case '3':
        var nums = getTwoNumbers();
        print("Kết quả: ${multiply(nums[0], nums[1])}");
        break;
      case '4':
        var nums = getTwoNumbers();
        var result = divide(nums[0], nums[1]);
        if (result != null) print("Kết quả: $result");
        break;
      case '0':
        print("Tạm biệt!");
        return;
      default:
        print("Lựa chọn không hợp lệ, vui lòng thử lại!");
    }
  }
}
