void main() {
  (double, double, double) diem = (9.5, 8.5, 8.0);
  double avg = (diem.$1 + diem.$2 + diem.$3) / 3;
  String quydoi = avg >= 8.5
      ? "A"
      : avg >= 7
          ? "B"
          : avg >= 5.5
              ? "C"
              : avg >= 4
                  ? "D"
                  : "F";
  print(
      "Diem Tb: ${avg.toStringAsFixed(2)} , GPA ${(avg / 2.5).toStringAsFixed(1)} , xep loai $quydoi");
}
