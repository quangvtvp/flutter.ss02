class sanpham {
  String tensanpham;
  double _giasanpham;
  int _soluong;
  sanpham(this.tensanpham, this._giasanpham, this._soluong);
  double get giasanpham => _giasanpham;
  set giasanpham(double value) {
    if (value < 0) {
      print('Giá sản phẩm không hợp lệ! Giá phải lớn hơn hoặc bằng 0.');
    } else {
      _giasanpham = value;
      print('Cập nhật giá sản phẩm: $_giasanpham');
    }
  }
  int get soluong => _soluong;
  set soluong(int value) {
    if (value < 0) {
      print('Số lượng không hợp lệ! Số lượng phải lớn hơn hoặc bằng 0.');
    } else {
      _soluong = value;
      print('Cập nhật số lượng: $_soluong');
    }
  }
  double get thanhtien => _giasanpham * _soluong;
  String get trangthai {
    if (_soluong == 0) {
      return 'Hết hàng';
    } else {
      return 'Còn hàng';
    }
  }
  void inthongtin() {
    print('Tên sản phẩm: $tensanpham');
    print('Giá sản phẩm: $_giasanpham đồng');
    print('Số lượng: $_soluong');
    print('Thành tiền: $thanhtien đồng');
    print('Trạng thái: $trangthai');
  }
}
void main() {
  var product = [
    sanpham('Điện thoại', 10000000, 10),
    sanpham('Laptop', 15000000, 5),
    sanpham('Tai nghe', 140000, 0),
  ];
  print('--- Thông tin sản phẩm ---');
  for (var i in product) {
    i.inthongtin();
  }
  print('--- Cập nhật sản phẩm ---');
  product[0].giasanpham = 12000000;
  product[1].soluong = 0;
  product[2].giasanpham = -50000;
  for (var i in product) {
    i.inthongtin();
  }
  print('--- Tông giá trị kho hàng ---');
  double tonggiatri = 0;
  for (var i in product) {
    tonggiatri += i.thanhtien;
  }
  print('Tổng giá trị kho hàng: $tonggiatri đồng');
}