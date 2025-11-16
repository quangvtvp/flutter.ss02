import 'dart:io';

void main() {
  String dapan = 'tranbao';
  List<String> hienThi = List.filled(dapan.length, '*');
  Set<String> daDoan = {};

  print('Game đoán từ: đoán từng chữ cái, chữ cái đúng sẽ hiện ra thay cho dấu *');
  print('Từ cần đoán: ${hienThi.join()}');

  while (true) {
    stdout.write('Nhập 1 chữ cái hoặc đoán cả từ: ');
    String? nhap = stdin.readLineSync();
    if (nhap == null || nhap.trim().isEmpty) continue;
    nhap = nhap.trim().toLowerCase();

    // Nếu đoán cả từ
    if (nhap == dapan) {
      print('Chúc mừng! Bạn đã đoán đúng từ "$dapan".');
      break;
    }

    // Nếu đoán từng chữ cái
    if (nhap.length == 1) {
      if (daDoan.contains(nhap)) {
        print('Bạn đã đoán chữ này rồi!');
        continue;
      }
      daDoan.add(nhap);
      bool timThay = false;
      for (int i = 0; i < dapan.length; i++) {
        if (dapan[i] == nhap) {
          hienThi[i] = nhap;
          timThay = true;
        }
      }
      if (timThay) {
        print('Đúng!');
      } else {
        print('Sai!');
      }
      print('Từ hiện tại: ${hienThi.join()}');
      if (!hienThi.contains('*')) {
        print('Chúc mừng! Bạn đã đoán đúng từ "$dapan".');
        break;
      }
    } else {
      print('Nhập 1 chữ cái hoặc đoán cả từ!');
    }
  }
}