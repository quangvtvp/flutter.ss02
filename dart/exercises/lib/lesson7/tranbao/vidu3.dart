class TruongDaiHoc {
  String tenTruong;
  String diaChi;
  double diemDauVao;

  // Constructor
  TruongDaiHoc(this.tenTruong, this.diaChi, this.diemDauVao);

  // Phương thức in thông tin
  void inThongTin() {
    print('Tên trường: $tenTruong');
    print('Địa chỉ: $diaChi');
    print('Điểm đầu vào: $diemDauVao');
    print('---------------------------');
  }
}

void main() {
  List<TruongDaiHoc> danhSachTruong = [
    TruongDaiHoc('Đại học Bách Khoa Hà Nội', 'Số 1 Đại Cồ Việt, Hai Bà Trưng, Hà Nội', 28.5),
    TruongDaiHoc('Đại học Khoa học Tự nhiên TP.HCM', '227 Nguyễn Văn Cừ, Quận 5, TP.HCM', 26.75),
    TruongDaiHoc('Đại học Ngoại thương Hà Nội', '91 Chùa Láng, Đống Đa, Hà Nội', 29.4),
  ];
  for (var truong in danhSachTruong) {
    truong.inThongTin();
  }
}
