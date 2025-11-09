class Product {
  String name;
  double _price;
  int _quantity;

  Product(this.name, double price, int quantity)
      : _price = price > 0 ? price : 0,
        _quantity = quantity >= 0 ? quantity : 0;

  // Getter và Setter cho price
  double get price => _price;

  set price(double value) {
    if (value > 0) {
      _price = value;
    } else {
      print("Gia phai lon hon 0!");
    }
  }

  // Getter và Setter cho quantity
  int get quantity => _quantity;

  set quantity(int value) {
    if (value >= 0) {
      _quantity = value;
    } else {
      print("So luong phai lon hon hoac bang 0!");
    }
  }

  // Getter tính tổng giá trị
  double get totalValue => _price * _quantity;

  // Getter tình trạng hàng
  String get status => _quantity == 0 ? "Het hang" : "Con hang";

  // Phương thức hiển thị thông tin sản phẩm
  void showInfo() {
    print("San pham: $name");
    print("Gia: $_price");
    print("So luong: $_quantity");
    print("Tong gia tri: $totalValue");
    print("Tinh trang: $status");
    print("---------------------------");
  }
}

void main() {
  // Tạo 3 sản phẩm
  var p1 = Product("Ban phim", 250000, 5);
  var p2 = Product("Chuot may tinh", 150000, 0);
  var p3 = Product("Man hinh", 3500000, 2);

  // Hiển thị thông tin
  p1.showInfo();
  p2.showInfo();
  p3.showInfo();

  // Test setter
  p1.price = -100; // Sai giá
  p2.quantity = -3; // Sai số lượng
  p3.price = 4000000; // Cập nhật đúng

  // Hiển thị lại để kiểm tra cập nhật
  p3.showInfo();
}
