import 'dart:io';

void main() {
  print('nhập số điểm toán của bạn :');
  double diemtoan = double.parse(stdin.readLineSync()!);
  print('nhập số điểm văn của bạn :');
  double diemvan = double.parse(stdin.readLineSync()!);
  print('nhập số điểm anh của bạn :');
  double diemanh = double.parse(stdin.readLineSync()!);
  print('nhập số điểm sử của bạn :');
  double diemsu = double.parse(stdin.readLineSync()!);
  print('nhập số điểm chuyên cần của bạn)(%)(từ 0-100):');
  double diemchuyencan = double.parse(stdin.readLineSync()!);
  var gpa = (diemtoan + diemvan + diemanh + diemsu) / 4;
  if (gpa > 10 || gpa < 0 || diemchuyencan > 100 || diemchuyencan < 0) {
    print('bạn nhập sai điểm vui lòng nhập lại');
  } else if (gpa >= 9.0) {
    print('bạn xếp loại xuất xắc');
  } else if (gpa >= 8.0) {
    print('bạn xếp loại giỏi');
  } else if (gpa >= 6.5) {
    print('bạn xếp loại khá');
  } else if (gpa >= 5.0) {
    print('bạn xếp loại trung bình');
  } else {
    print('bạn xếp loại yếu');
  }
  if (gpa >= 5.0 &&
      diemtoan >= 3.5 &&
      diemvan >= 3.5 &&
      diemanh >= 3.5 &&
      diemsu >= 3.5 &&
      diemchuyencan >= 80) {
    print('bạn được lên lớp');
  } else {
    print('bạn không được lên lớp');
  }
}
