class Car {
  String? model;
  int? year;
  Car({this.model, this.year});
}

Future<String> getLatestCarModel() async {
  List<Car> cars = [
    Car(model: 'Toyota', year: 2000),
    Car(model: 'Honda', year: 2010),
    Car(model: 'Vinfast', year: 2019),
  ];
  return Future.delayed(Duration(seconds: 10), () {
    cars.sort((a, b) => b.year!.compareTo(a.year!));
    return cars.first.model!;
  });
}

Future<void> main() async {
  print('start the app');
  var carModel = await getLatestCarModel();
  print('lastest car model: $carModel');
  print('do other work');
}
