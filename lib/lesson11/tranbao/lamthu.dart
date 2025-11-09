Future<void> main(List<String> args) async {
  print('start the app');
  print('fetching the latest car model');
  var carModel = await getLatestModel();
  print('Latest car model: $carModel');
  print('do other work');
}
class Car {
  String model;
  int year;
  Car(this.model, this.year);
}
Future<String> getLatestModel() async {
  List<Car> cars = [
    Car('vinfast', 2023),
    Car('honda', 2020),
    Car('toyota', 2022),
    Car('ford', 2021),
  ];
  return Future.delayed(Duration(milliseconds: 360), () {
    cars.sort((a, b) => b.year.compareTo(a.year));
    return cars.first.model;
  }); 
}