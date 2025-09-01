//Bài 3 – Thông tin sinh viên
//Khai báo: họ tên, tuổi, điểm TB, giới tính, MSSV.
//Gán giá trị và in thông tin.
//(Tuỳ chọn) Gom nhóm bằng Record.

//Cách 1
void main() {
  String hoten = "Phạm Minh Bảo";
  int tuoi = 16;
  double diemtb = 8.5;
  String gioitinh = "Nam";
  String mssv = 'ABC12345';
  print('thông tin sinh viên:');
  print(
      'tên: $hoten, tuổi: $tuoi, điểm trung bình: $diemtb, giới tính: $gioitinh, Mã số sinh viên: $mssv');
}

//Cách 2: Gom nhóm bằng Record.
void main1() {
  (String, int, double, String, String) thongtin =
      ("Phạm Minh bảo", 16, 8.5, "Nam", "ABC12345");
  print('thông tin học sinh:');
  print(
      'tên: ${thongtin.$1}, tuổi: ${thongtin.$2}, điểm trung bình: ${thongtin.$3}, giới tính: ${thongtin.$4}, Mã số sinh viên: ${thongtin.$5}');
}
