//Bài 5 – GPA & quy đổi điểm chữ (dùng toán tử ba ngôi)
//Tính avg từ 3 môn.
//GPA ≈ avg / 2.5.
//Quy đổi A/B/C/D/F bằng toán tử ba ngôi.

void main() {
  List<double> diem = [8, 8.5, 10];
  double avg = (diem[0] + diem[1] + diem[2]) / 3;
  double gpa = avg / 2.5;
  String diemchu = (gpa >= 3.6)
      ? 'A'
      : (gpa >= 3.0)
          ? 'B'
          : (gpa >= 2.5)
              ? 'C'
              : (gpa >= 1.9)
                  ? 'D'
                  : 'F';
  print('với điểm trung bình môn là $avg, GPA là $gpa thì điểm chữ quy đổi là $diemchu');
}
