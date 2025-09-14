// Bài 2: Tính giá cước data di động.//
import 'dart:io';
void main() {
  print('Nhập số GB đã sử dụng trong tháng: ');
  double? gb = double.tryParse(stdin.readLineSync() ?? '');
  if (gb == null || gb < 0) {
    print('Số GB không hợp lệ. Vui lòng nhập lại.');
    return;
  }
  print('Số GB đã sử dụng: $gb');
  double gia = calculateDataCost(gb);
  print('Giá cước data di động: $gia VNĐ');
}
double calculateDataCost(double gb) {
  const double costPerGB = 20000;
  return gb * costPerGB;
}