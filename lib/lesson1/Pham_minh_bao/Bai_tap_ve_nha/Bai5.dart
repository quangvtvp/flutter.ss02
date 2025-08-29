//Bài 5 – GPA & quy đổi điểm chữ (dùng toán tử ba ngôi)
//Tính avg từ 3 môn.
//GPA ≈ avg / 2.5.
//Quy đổi A/B/C/D/F bằng toán tử ba ngôi.

void main() {
  List<double> diem = [8.5, 7, 10]; //cấu trúc danh sách dạng List: List<kiểu dữ liệu> "tên list" = [giá trị 1, giá trị 2, ...]
  double avg = (diem[0] + diem[1] + diem[2]) / 3; //danh sách có n phần tử, thứ tự các phần tử chạy từ 0 --> n-1
  double gpa = avg / 2.5;
  String diemchu = (gpa >=3.6) ? 'A' : (3.59 >= gpa && gpa >=3.2) ? 'B' : (3.19 >= gpa && gpa >=2.5) ? 'C' : (2.49 >= gpa && gpa >=2.0) ? 'D' : 'F';
  print('điểm GPA là: $gpa tương ứng với điểm chữ là: $diemchu');
}
//cấu trúc toán tử 3 ngôi:
//<kiểm tra điều kiện> ? <nếu đúng thì thực hiện> : <nếu sai thì thực hiện>
// '&&' là toán tử AND (điều kiện đúng khi cả 2 vế đều đúng)