import 'dart:io';
void main() {
  print('nhap thu nhap ca nhan(khong co nguoi phu thuoc):');
  double ? thunhap =double.tryParse (stdin.readLineSync() ?? '');
  if (thunhap == null) {
    print('gia tri khong hop le');
  } else if (thunhap <0) {
    print('muc thu nhap khong hop le');
  } else if (thunhap <11000000) {
    print('ban khong phai nop thue thu nhap ca nhan');
  } else if (thunhap <20000000 && thunhap >=11000000) {
    double thue = thunhap -11000000;
    print('so tien thue phai nop la: ${thue*0.05} ');
  } else if (thunhap <32000000 && thunhap >=20000000) {
     double thue = thunhap -11000000;
    print('so tien thue phai nop la: ${thue*0.1} ');
  } else if (thunhap >32000000) {
     double thue = thunhap -11000000;
    print('so tien thue phai nop la: ${thue*0.2}');
  }
}