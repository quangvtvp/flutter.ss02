//Bài về nhà số 1: Quản lý xe cơ bản bằng class
class Car {
  String brand;
  int year;
  double price;
  Car({required this.brand, required this.year, required this.price,}); 
  void showInfo() {
    print('Thương hiệu: $brand, Năm sản xuất: $year, Giá: $price USD');
  }
}
void main() {
  var cars = <Car>[];
  Car car1 = Car(brand: 'Toyota', year: 2020, price: 30000);
  Car car2 = Car(brand: 'Honda', year: 2019, price: 25000);
  Car car3 = Car(brand: 'BMW', year: 2022, price: 50000);

  cars.add(car1);
  cars.add(car2);
  cars.add(car3);

  for (var car in cars) {
    car.showInfo();
  }
}
