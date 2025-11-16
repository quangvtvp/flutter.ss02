void main() {
  double toan = 10.0;
  double ly = 10.0;
  double hoa = 9.75;
  double dtb = (toan + ly + hoa) / 3;
  double gpa = dtb / 2.5;
  String diemchu = (dtb >= 9)
      ? 'A'
      : (dtb >= 7)
          ? 'B'
          : (dtb >= 6)
              ? 'C'
              : (dtb >= 4)
                  ? 'D'
                  : 'F';
  print('diem trung binh: $dtb ; diem gpa: $gpa ; quy doi diem chu: $diemchu');
}
