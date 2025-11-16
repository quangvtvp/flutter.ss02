import 'dart:io';

void main() {
  Map<String, double> khodiem = {};
  // Nhập điểm
  print('nhập vào số lượng môn học: ');
  int? so = int.tryParse(stdin.readLineSync() ?? '');
  if (so == null || so <= 0) {
    print('vui lòng nhập số lượng môn học');
    return;
  }
  for (int i = 0; i < so; i++) {
    stdout.write('Nhập tên môn học thứ ${i + 1}: ');
    String? ten = stdin.readLineSync() ?? '';
    if (ten == null || ten.isEmpty) {
      print('Vui lòng nhập tên môn học');
      i = i - 1;
      continue;
    }
    stdout.write('Nhập điểm của môn $ten: ');
    double? diem = double.tryParse(stdin.readLineSync() ?? '');
    if (diem == null || diem < 0 || diem > 10) {
      print('Vui lòng nhập điểm hợp lệ');
      i = i - 1;
      continue;
    }
    khodiem[ten] = diem;
  }
  // In bảng điểm, tính điểm trung bình, lọc điểm giỏi
  print('_________________________________');
  cn(khodiem);
  cn1(khodiem);
}

void tracuu(khodiem) {
  print(
      'Bạn muốn tra cứu điểm môn nào trong các môn: ${khodiem.keys.join(', ')}');
  String? m = (stdin.readLineSync() ?? '').toLowerCase();
  if (khodiem.containKeys(m)) {
    print('điểm môn $m là: ${khodiem[m]}');
  } else {
    print('không tìm thấy môn học');
  }
}

void themdiem(khodiem) {
  stdout.write('Nhập tên môn học: ');
  String? ten = stdin.readLineSync();
  if (ten == null || ten.isEmpty) {
    print('Vui lòng nhập lại tên môn học');
    return themdiem(khodiem);
  } else {
    stdout.write('Nhập điểm của môn $ten: ');
    double? diem = double.tryParse(stdin.readLineSync() ?? '');
    if (diem == null || diem < 0 || diem > 10) {
      print('Vui lòng nhập điểm hợp lệ');
      return themdiem(khodiem);
    }
    khodiem[ten] = diem;
  }
}

void exit() {
  print('Cảm ơn đã sử dụng');
}

void cn(khodiem) {
  double tong = 0, i = 0;
  List<String> gioi = [];
  print('__________________BẢNG ĐIỂM:__________________');
  for (String n in khodiem.keys) {
    print('$n:\t ${khodiem[n]}\t');
    tong += khodiem[n]!;
    i++;
    if (khodiem[n]! >= 8) {
      gioi.add(n);
    }
  }
  double TB = tong / i;
  print('Điểm trung bình là ${TB.toStringAsFixed(2)}');
  print('Các môn học đạt loại giỏi (>=8) là: ${gioi.join(', ')}');
}

void cn1(khodiem) {
  print(
      'Nhập "F" để tra cứu điểm \n Nhập "A" để thêm môn học mới \n Nhập "E" để thoát');
  String? trl = (stdin.readLineSync() ?? '').toUpperCase();
  switch (trl) {
    case 'F':
      tracuu(khodiem);
      break;
    case 'A':
      themdiem(khodiem);
      cn(khodiem);
      break;
    case 'E':
      exit();
      break;
    default:
      print('Lựa chọn không hợp lệ');
      cn1(khodiem);
      break;
  }
}
