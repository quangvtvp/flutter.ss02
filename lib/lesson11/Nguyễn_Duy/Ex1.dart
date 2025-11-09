class Car {
  String model;
  String year;
  String color;
  Car(this.model, this.year, this.color);
}

void main() {
  List<Car> cars = [
    Car('Toyota', '2020', 'Red'),
    Car('Honda', '2019', 'Blue'),
    Car('Ford', '2018', 'Black'),
    Car('Vinfast', '2021', 'White'),
  ];
  print('start the app');
  print('fetching the latest car');
  cars.sort((a, b) => b.year.compareTo(a.year));
  Future.delayed(Duration(seconds: 3), () {
    print('Latest car: ${cars[0].model}');
    print('done');
  });
}
