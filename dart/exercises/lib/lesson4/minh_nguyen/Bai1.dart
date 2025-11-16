import 'dart:io';

void main() {
  print('ban muon tinh giai thua cua so:');
  var n = int.tryParse(stdin.readLineSync()!);
  if (n == null || n < 0) {
    print('khong hop le');
    return;
  }
  int giaithua = 1;
  for (int i = 1; i <= n; i++) {
    giaithua = giaithua * i;
  }
  print('giai thua cua $n la: $giaithua');
}
