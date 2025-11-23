class Product {
  final String _name;
  double _price;
  int _stock;

  Product(this._name, this._price, this._stock);

  set price(double Nprice) {
    if (Nprice <= 0) {
      print('Giá không hợp lệ');
    } else {
      _price = Nprice;
      print('Cập nhật giá thành công!');
    }
  }

  set stock(int Nstock) {
    if (Nstock < 0) {
      print('Số lượng không hợp lệ');
    } else {
      _stock = Nstock;
      print('Cập nhật số lượng thành công!');
    }
  }

  void sell(int quantity) {
    if (quantity <= _stock) {
      _stock -= quantity;
      print('Đã bán $quantity sản phẩm. Tồn kho còn lại: $_stock');
    } else {
      print(
          'Không đủ tồn kho để bán $quantity sản phẩm. Tồn kho hiện tại: $_stock');
    }
  }

  String get status {
    if (_stock == 0) {
      return 'Hết hàng';
    } else if (_stock < 5) {
      return 'Sắp hết hàng';
    } else {
      return 'Còn hàng';
    }
  }
}

void main() {
  Product product = Product('Điện thoại', 5000000, 10);

  print('Trạng thái sản phẩm: ${product.status}');

  product.sell(3);
  print('Trạng thái sản phẩm: ${product.status}');

  product.sell(7);
  print('Trạng thái sản phẩm: ${product.status}');

  product.price = -1000000;
  product.stock = -5;

  product.price = 4500000;
  product.stock = 15;

  print('Trạng thái sản phẩm: ${product.status}');
}
