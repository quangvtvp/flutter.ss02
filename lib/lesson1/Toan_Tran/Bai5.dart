// Bài tập 5: GPA và Quy đổi điểm//
void main() {
  int diemToan = 10;
  int diemLy = 10;
  double diemHoa = 9.5;
  String loaiToan = diemToan >= 8
      ? 'A'
      : diemToan >= 5
          ? 'B'
          : 'C';
  String loaiLy = diemLy >= 8
      ? 'A'
      : diemLy >= 5
          ? 'B'
          : 'C';
  String loaiHoa = diemHoa >= 8
      ? 'A'
      : diemHoa >= 5
          ? 'B'
          : 'C';
  print('Toán: $diemToan - $loaiToan');
  print('Lý: $diemLy - $loaiLy');
  print('Hóa: $diemHoa - $loaiHoa');
  print('Điểm trung bình là ${(diemToan + diemLy + diemHoa) / 3}');
}