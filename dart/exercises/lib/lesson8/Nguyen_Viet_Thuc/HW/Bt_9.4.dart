void main() {
  var product = Product("Laptop", 1500.0, 5);
  print("Sản phẩm: ${product.name}");
  print("Giá: ${product.price}");
  print("Số lượng: ${product.quantity}");
  print("Tổng giá trị: ${product.totalValue}");
  print("Trạng thái: ${product.status}");
  product.price = 1400.0;
  product.quantity = 0;
  print("Giá sau khi cập nhật: ${product.price}");
  print("Số lượng sau khi cập nhật: ${product.quantity}");
  print("Tổng giá trị sau khi cập nhật: ${product.totalValue}");
  print("Trạng thái sau khi cập nhật: ${product.status}");
}

class Product {
  String? name;
  double _price;
  int _quantity;

  Product(this.name, this._price, this._quantity);

  double get price => _price;

  set price(double value) {
    if (value >= 0) {
      _price = value;
    } else {
      print("Giá không hợp lệ.");
    }
  }

  int get quantity => _quantity;

  set quantity(int value) {
    if (value >= 0) {
      _quantity = value;
    } else {
      print("Số lượng không hợp lệ.");
    }
  }

  double get totalValue => _price * _quantity;

  String get status {
    if (_quantity > 0) {
      return "Còn hàng";
    } else {
      return "Hết hàng";
    }
  }
}
