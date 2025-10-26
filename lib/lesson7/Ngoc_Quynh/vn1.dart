class Car {
  String? brand;
  String? year;
  double? price;
  Car({this.brand, this.year, this.price});
  void showInfo() {
    print('Hang: $brand, nam sx: $year, gia $price');
  }
}

void main() {
  var car = [];
  Car car1 = Car(brand: ' Honda', year: '2020', price: 50000);
  Car car2 = Car(brand: 'Honda', year: '2022', price: 70000);
  Car car3 = Car(brand: 'Honda', year: '2024', price: 90000);
  car.add(car1);
  car.add(car2);
  car.add(car3);
  for (var xe in car) {
    xe.showInfo();
  }
}
