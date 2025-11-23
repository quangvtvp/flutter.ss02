class Product {
  String name;
  double _price;
  int _quanlity;

  Product(this.name, this._price, this._quanlity);

  double get price => _price;
  set price(double Nprice) {
    if (Nprice <= 0) {
      print('!!! Giá không hợp lệ !!!');
      return;
    } else {
      _price = Nprice;
      print('Cập nhật giá mới thành công');
    }
  }

  int get quanlity => _quanlity;
  set quanlity(int Nquanlity) {
    if (Nquanlity < 0) {
      print('!!! Số lượng không hợp lệ !!!');
      return;
    } else {
      _quanlity = Nquanlity;
      print('Cập nhật số lượng mới thành công');
    }
  }

  double get totalprice => _price * _quanlity;
  String get status {
    if (_quanlity == 0)
      return 'Hết hàng';
    else
      return 'Còn hàng';
  }

  void show() {
    print(
        'Tên sản phẩm: $name \tGiá: ${_price} VNĐ \tSố lượng: ${_quanlity} \tThành tiền: ${totalprice} VNĐ \tTrạng thái: ${status}');
  }
}

void main() {
  List<Product> products = [
    Product('Bút bi', 2000, 100),
    Product('Vở kẻ ngang', 5000, 0),
    Product('Tẩy', 1500, 50)
  ];

  print('_____Danh sách sản phẩm_____');
  for (var i in products) {
    i.show();
  }

  print('\nCập nhật thông tin sản phẩm:');
  products[1].price = -3000;
  products[1].quanlity = 20;
  products[0].price = 2500;

  print('\nDanh sách sản phẩm sau khi cập nhật:');
  for (var i in products) {
    i.show();
  }
}
