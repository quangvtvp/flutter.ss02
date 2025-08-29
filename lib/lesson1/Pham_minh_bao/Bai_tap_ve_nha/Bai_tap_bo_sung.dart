//Viết thêm bài dùng List<double> lưu điểm 5 môn, tính trung bình bằng vòng lặp for

void main() {
  List<double> diem = [8, 7.75, 9, 9.5, 10];
  double tong = 0;
  for (int i = 0; i < 5; i += 1) {
    tong = tong + diem[i];
  }
  double TB = tong / 5;
  print('điểm trung bình là: $TB');
}
