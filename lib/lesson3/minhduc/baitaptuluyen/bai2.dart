import 'dart:io';

void main() {
  print('Bài 2: Cước data di động');
  print('Xin chào bạn!');
  print('Nhập số GB đã sử dụng trong tháng: ');
  double? gbUsed = double.tryParse(stdin.readLineSync() ?? '');
  if (gbUsed == null || gbUsed < 0) {
    print('Số GB không hợp lệ. Vui lòng nhập lại.');
    return;
  }
  print('Số GB đã sử dụng: $gbUsed');
  double cost = calculateDataCost(gbUsed);
  print('Giá cước data di động: $cost VNĐ');
}

double calculateDataCost(double gbUsed) {
  const double costPerGB = 20000; // Cước 20.000 VNĐ/GB
  return gbUsed * costPerGB;
}
