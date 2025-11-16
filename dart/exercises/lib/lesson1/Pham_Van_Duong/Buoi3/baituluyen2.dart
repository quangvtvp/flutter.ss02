import "dart:io";

void main() {
  print(' Nhập số GB đã dùng trong tháng: ');
  String? input = stdin.readLineSync();
  double? dungluong = double.tryParse(input ?? '');
  if (dungluong == null || dungluong < 0) {
    print(' Vui lòng nhập số hợp lệ ');
    return;
  }
  if (dungluong <= 3) {
    print(' Miễn phí cước');
  } else {
    double dungluongvuot = dungluong - 3;
    double lamtron = (dungluongvuot * 10).ceil() / 10;
    double tongtien = (lamtron * 20000);
    print(' Số tiền cước phải trả là: $tongtien VNĐ');
  }
}
