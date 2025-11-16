import 'dart:io';

void main() {
  print('Nhập dung lượng đã dùng trong tháng (GB): ');
  String? input = stdin.readLineSync();
  double? dungLuong = double.tryParse(input ?? '');
  if (dungLuong == null || dungLuong < 0) {
    print('Vui lòng nhập một số hợp lệ.');
    return;
  }
  double dateFree = 3.0;
  double pricePerGB = 20000.0;
  if (dungLuong <= dateFree) {
    print('Tổng tiền cước: 0 đồng.');
  } else {
    double extra = dungLuong - dateFree;
    double extraRounded = (extra * 10).ceil() / 10;
    int total = (extraRounded * pricePerGB).toInt();
    print('Dung lượng vượt quá: ${extraRounded.toStringAsFixed(1)} GB');
    print('Tổng tiền cước: $total đồng.');
  }
}
