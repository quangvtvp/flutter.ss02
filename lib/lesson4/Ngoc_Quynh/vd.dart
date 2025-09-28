import 'dart:io';

// Tinh tich cac so tu 1 den n
void main() {
  print(' Nhap so nguyen duong can tinh giai thua: ');
  int? n = int.tryParse(stdin.readLineSync()!);
  if (n == null || n < 0) {
    print(' Khong hop le');
    return;
  } else if (n != null && n > 0) {
    int giaithua = 1;
    for (int i = 1; i <= n; i++) giaithua *= i;
    print(' Giai thua cua $n la: $giaithua ');
  }
}
