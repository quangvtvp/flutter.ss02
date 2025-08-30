//Bài 2 – Tính toán
//Khai báo number1, number2.
//Tính tổng, hiệu, tích, thương.
//In kết quả bằng interpolation.

void main() {
  int number1 = 13;
  int number2 = 8;
  int tong = number1 + number2;
  int hieu = number1 - number2;
  int tich = number1 * number2;
  double thuong = number1 / number2;
  print('hai số $number1 và $number2 có:');
  print('tổng = $tong');
  print('hiệu = $hieu');
  print('tích = $tich');
  print('thương = $thuong');
}
