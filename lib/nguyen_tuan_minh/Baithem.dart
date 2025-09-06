void main() {
  double Toan = 9.4;
  double Van = 8;
  double Anh = 9;
  double Ly = 9;
  double Sinh = 9;
  List<double> Diem = [Toan, Van, Anh, Ly, Sinh];
  for (int i = 0; i < 4; i++) {
    print("Điểm TB: ${Diem.reduce((a, b) => a + b) / Diem.length}");
  }
}
