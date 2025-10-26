//Bài 1: Quản lý xe.//
class Car {
  String brand;
  int year;
  double price;

  Car(this.brand, this.year, this.price);

  void showInfo() {
    print(
        'Hãng xe: $brand | Năm SX: $year | Giá: ${price.toStringAsFixed(2)} triệu VNĐ');
  }
}

void main() {
  List<Car> cars = [
    Car('Toyota', 2020, 850.5),
    Car('Honda', 2022, 920.0),
    Car('Mercedes', 2023, 1850.7),
  ];

  print('Danh sách các xe');
  for (var c in cars) {
    c.showInfo();
  }
}