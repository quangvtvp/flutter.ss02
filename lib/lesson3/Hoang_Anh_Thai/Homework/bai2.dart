import 'dart:io';

void main() {
  const double hanmuc = 3.0;
  const double gia = 20000;
  const int giahan = 0;
  stdout.write("Nhập số GB đã dùng: ");
  double? gbdadung = double.tryParse(stdin.readLineSync()!);
  if (gbdadung == null || gbdadung < 0) {
    print("Giá trị nhập vào không hợp lệ.");
    return;
  }
  double vuotnguong = gbdadung > hanmuc ? gbdadung - hanmuc : 0;
  double lamtron = (vuotnguong * 10).ceil() / 10;
  double extraFee = lamtron * gia;
  double total = giahan + extraFee;
  print("Dùng: $gbdadung GB");
  print("Vượt: $lamtron GB");
  print("Tổng tiền: ${total.toInt()}đ");
}
