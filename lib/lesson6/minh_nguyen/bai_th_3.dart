void main() {
  List<double> diem = [7, 4.5, 8, 9.6, 4, 10];
  diem.where((d) => d >= 5).forEach((diem) => print('diem tren TB la:$diem'));
  diem
      .where((d) => d % 5 == 0)
      .forEach((diem2) => print('diem chia het cho 5 la:$diem2'));
}
