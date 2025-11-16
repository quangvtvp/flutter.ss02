import 'dart:io';
import 'dart:math';

void main() {
  const double basicData = 3.0; // GB
  const int basicFee = 0; // Miễn phí 3GB đầu
  const int overFeePerGB = 20000; // 20.000đ/GB

  stdout.write('Nhập số GB đã sử dụng trong tháng: ');
  double? usedGB = double.tryParse(stdin.readLineSync() ?? '');

  if (usedGB == null || usedGB < 0) {
    print('Dữ liệu không hợp lệ!');
    return;
  }

  double overGB = usedGB - basicData;
  int totalFee = basicFee;

  if (overGB > 0) {
    // Làm tròn lên theo 0.1GB
    double roundedOverGB = (overGB * 10).ceil() / 10;
    totalFee += (roundedOverGB * overFeePerGB).toInt();
  }

  print('Tổng tiền phải trả: ${totalFee.toString()}đ');
}
