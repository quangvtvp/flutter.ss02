import 'dart:io';
void main() {
  print('nhập điểm rèn luyện (0-100):');
  int ? diem = int.tryParse (stdin.readLineSync() ?? '');
  if (diem == null) {
    print('giá trị không hợp lệ');
  } else if (diem <0 || diem >100) {
    print('nhap sai');
  } else if (diem>=90) {
    print('kết quả: xuất sắc');
  } else if (diem >=80) {
    print('kết quả:giỏi');
  } else if (diem >=65) {
    print('kết quả;khá');
  } else if (diem >=50) {
    print('kết quả:trung bình');
  } else if (diem <50) {
    print('kết quả:yếu');
  } 
}