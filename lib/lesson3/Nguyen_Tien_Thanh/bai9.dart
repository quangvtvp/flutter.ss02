import 'dart:io';

void main() {
  print('Nhập số GB đã dùng trong tháng:');
  double? gbUsed = double.tryParse(stdin.readLineSync() ?? '');

  if (gbUsed == null || gbUsed < 0) {
    print('Số GB không hợp lệ!');
    return;
  }
  const double basicQuota = 3.0; // 3GB gói cơ bản
  const int pricePerGB = 20000; // 20.000đ/GB
  double extraGb = gbUsed - basicQuota;
  double totalFee = 0;

  if (extraGb > 0) {
    // Làm tròn lên theo 0.1GB
    double roundedExtra = (extraGb * 10).ceil() / 10;
    totalFee = roundedExtra * pricePerGB;
  }

  print('Tổng tiền cước: ${totalFee.toStringAsFixed(0)}đ');
}