import 'dart:io';

void main() {
  print('Nhập điểm từng môn:');
  print('Toán;');
  double? diemtoan = double.tryParse(stdin.readLineSync() ?? '');
  print('văn');
  double? diemvan = double.tryParse(stdin.readLineSync() ?? '');
  print('Ngoại ngữ');
  double? diemngoaingu = double.tryParse(stdin.readLineSync() ?? '');
  print('sử');
  double? diemsu = double.tryParse(stdin.readLineSync() ?? '');
  if (diemtoan == null || diemvan == null || diemngoaingu == null || diemsu ==null || diemtoan < 0 || diemvan < 0 || diemngoaingu <0 || diemsu < 0) {
    print('Dữ liệu không hợp lệ.');
    return;
  }
  double gpa = (diemtoan + diemvan + diemngoaingu + diemsu) / 4;
  if (gpa < 5) {
    print('học lực yếu,em cần cải thiện khả năng học tập');
  } else if (gpa >= 9) {
    print('học lực xuất sắc, cố gắng duy trì phong độ');
  }else if (gpa >=8) {
    print('học lực giỏi,cố gắng phát huy');
  } else if (gpa >= 6.5) {
    print('học lực khá ,em cần cố gắng hơn');
  } else if (gpa >=5) {
    print('học lực trung bình,em cần phải cải thiện nhiều');
  }
  print('điểm trung bình môn của em là ${gpa.toStringAsFixed(1)}');
}  