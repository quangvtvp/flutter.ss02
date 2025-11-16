class Car {
  String brand;
  int year;
  double price;
  Car(this.brand, this.year, this.price);
  void showInfo() {
    print("Thương hiệu: $brand");
    print("Năm sản xuất: $year");
    print("Giá: ${price.toStringAsFixed(0)} USD");
  }
}

void main() {
  List<Car> carList = [
    Car("Toyota", 2020, 25000.0),
    Car("Honda", 2022, 30000.50),
    Car("Ford", 2018, 18500.0)
  ];
  for (var car in carList) {
    car.showInfo();
  }
}
