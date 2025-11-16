void main() {
  double Toan = 9.5;
  double Nguvan = 8.2;
  double Anh = 9.4;
  double avg = (Toan + Nguvan + Anh) / 3;
  double gpa = avg / 2.5;
  print("Điểm trung bình: $avg");
  print("GPA: $gpa");
  print(
      "Xếp loại : ${gpa >= 3.6 ? "A" : gpa >= 3.2 ? "B" : gpa >= 2.5 ? "C" : "D"}");
}
