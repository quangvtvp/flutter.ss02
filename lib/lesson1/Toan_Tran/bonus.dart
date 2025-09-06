// Bonus : Sử dụng list<double> và for.//
void main() {
  List<String> monhoc = ["Toán", "Lý", "Hóa", "Sinh", "Tin"];
  List<double> diem = [10, 10, 9.9, 9, 9.2];
  double tong = 0;
  for (int i = 0; i < monhoc.length; i++) {
    print("${monhoc[i]}: ${diem[i]}");
    tong = tong + diem[i];
  }
  double diemTB = tong / diem.length;
  print("Điểm trung bình: $diemTB");
}