// Bài tập 1: Viết chương trình in ra thông tin cá nhân của bạn.//
void main() {
  int age = 16;
  String Myname = 'Trần Anh Toàn';
  double height = 1.71;
  print('Tuổi $age');
  print('Tên $Myname');
  print('Chiều cao $height mét');
  print(
      'Xin chào, Tôi tên là $Myname, Năm nay tôi $age tuổi và cao $height mét.');
// Bài tập 2: Tính Toán//
  int number1 = 10;
  int number2 = 25;
  print('Số thứ nhất là $number1');
  print('Số thứ hai là $number2');
  print('Tổng hai số là ${number1 + number2}');
  print('Hiệu hai số là ${number2 - number1}');
  print('Tích hai số là ${number1 * number2}');
  print('Thương hai số là ${number2 / number1}');
// Bài tập 3: Gom nhóm thông tin bằng record.//
  String name = 'Trần anh Toàn';
  int tuoi = 16;
  double score = 29.92;
  String gioitinh = 'Nam';
  var ToanTran = ('Trần Anh Toàn', 16, 29.92, 'Nam');
  print(
      'Tên: ${ToanTran.$1}, Tuổi: ${ToanTran.$2}, Điểm thi Đại học: ${ToanTran.$3}, Giới tính: ${ToanTran.$4}');
// Bài tập 4: Hình chữ nhật.//
  double chieudai = 19.2;
  int chieurong = 16;
  print('Chiều dài hình chữ nhật là $chieudai');
  print('Chiều rộng hình chữ nhật là $chieurong');
  print('Diện tích hình chữ nhật là ${chieudai * chieurong}');
  print('Chu vi hình chữ nhật là ${(chieudai + chieurong) * 2}');
// Bài tập 5: GPA và Quy đổi điểm.//
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
