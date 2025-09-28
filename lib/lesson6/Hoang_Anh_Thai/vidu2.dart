import 'dart:io';

void main() {
  List<double> a = [1, 2, 3, 4, 5];
  double max = 0;
  double min = 0;
  for (int i = 0; i < a.length; i++) {
    if (a[i] > max) {
      max = a[i];
    }
  }
  for (int i = a.length - 1; i >= 0; i--) {
    if (a[i] < min) {
      min = a[i];
    }
  }
  print('Điểm lớn nhất là: $max');
  print('Điểm nhỏ nhất là: $min');
  print('Nhập điểm của bạn: ');
  double? ax = double.tryParse(stdin.readLineSync()!)!;
  a.add(ax);
  print('Điểm trung bình là: ${a.reduce((c, b) => c + b) / a.length}');
}
