import 'dart:io';

void main() {
  print('Bài 4: Hạnh kiểm');
  print('Xin chào bạn!');
  print('Nhập điểm hạnh kiểm (A, B, C, D): ');
  String? input = stdin.readLineSync();
  String diemHanhKiem = input?.trim().toUpperCase() ?? '';
    switch (diemHanhKiem) {
        case 'A':
        print('Hạnh kiểm tốt');
        break;
        case 'B':
        print('Hạnh kiểm khá');
        break;
        case 'C':
        print('Hạnh kiểm trung bình');
        break;
        case 'D':
        print('Hạnh kiểm yếu');
        break;
        default:
        print('Không hợp lệ. Vui lòng nhập A, B, C hoặc D');
    }
}
