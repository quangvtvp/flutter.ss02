class SanPham {
  String ten;
  double _gia;
  int _soLuong;

  SanPham(this.ten, this._gia, this._soLuong);

  double get gia => _gia;

  set gia(double value) {
    if (value <= 0) {
      print('❌ Giá phải lớn hơn 0!');
      return;
    }
    _gia = value;
    print('✅ Đã cập nhật giá: $_gia đồng');
  }

  int get soLuong => _soLuong;

  set soLuong(int value) {
    if (value < 0) {
      print('❌ Số lượng không thể âm!');
      return;
    }
    _soLuong = value;
    print('✅ Đã cập nhật số lượng: $_soLuong');
  }

  double get tongGiaTri => _gia * _soLuong;

  String get trangThai => _soLuong == 0 ? 'Hết hàng' : 'Còn hàng';

  void hienThiThongTin() {
    print(
      '$ten - Giá: ${_gia.toStringAsFixed(0)}đ - Số lượng: $_soLuong - Tổng: ${tongGiaTri.toStringAsFixed(0)}đ - ($trangThai)',
    );
  }
}

void main() {
  var danhSachSach = [
    SanPham('Sách Toán 11', 25000, 10),
    SanPham('Sách Vật Lý 11', 27000, 0),
    SanPham('Sách Hóa Học 11', 26000, 1000),
  ];

  print('=== DANH SÁCH SÁCH LỚP 11 ===');
  for (var sach in danhSachSach) {
    sach.hienThiThongTin();
  }

  print('\n=== KIỂM TRA HỢP LỆ ===');
  danhSachSach[0].gia = -5000;
  danhSachSach[1].soLuong = -3;

  print('\n=== CẬP NHẬT HỢP LỆ ===');
  danhSachSach[1].soLuong = 5;
  danhSachSach[1].hienThiThongTin();

  print('\n=== TỔNG GIÁ TRỊ KHO SÁCH ===');
  double tong = danhSachSach.fold(0.0, (sum, sp) => sum + sp.tongGiaTri);
  print('Tổng giá trị kho sách: ${tong.toStringAsFixed(0)}đ');
}
