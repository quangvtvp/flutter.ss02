class Product {
  String name;
  double _price;
  int _quantity;
  Product(this.name, this._price, this._quantity);
  double get Price => _price;
  set Price(double value) {
    if (value < 0) {
      print('Giá không hợp lệ');

      return;
    }
    _price = value;
  }

  int get Quantity => _quantity;
  set Quantity(int value) {
    if (value < 0) {
      print('Số lượng không hợp lệ');
      return;
    }
    _quantity = value;
  }

  double get Totalvalue => _price * _quantity;
  String get status {
    if (_quantity == 0) {
      return 'Hết hàng';
    } else {
      return 'Còn hàng';
    }
  }

  void Showinfo() {
    print(
        'Tên sản phẩm: $name, Giá: $_price, Số lượng: $_quantity, Trị giá: ${Totalvalue}, Trạng thái: ${status}');
  }
}

void main() {
  var product = Product('IPhone 17', 68000000, 50);
  var product2 = Product('Samsung S24', 24000000, 0);
  var product3 = Product('Xiaomi 13', 15000000, 100);
  product.Showinfo();
  product2.Showinfo();
  product3.Showinfo();
}
