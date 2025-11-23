import 'dart:io';

class Car {
  String? model;
  int? year;
  Car({this.model, this.year});
}

Future<String> getLatestCarModel() async {
  List<Car> cars = [
    Car(model: 'Toyota', year: 2000),
    Car(model: 'Honda', year: 2030),
    Car(model: 'Vinfast', year: 2019),
  ];
  for (var i = 0; i < 10; i++) {
    await Future.delayed(Duration(seconds: 1));
    stdout.write('.');
  }
  print('loading done');
  cars.sort((a, b) => b.year!.compareTo(a.year!));
  return cars.first.model!;
}

Future<void> main() async {
  print('start the app');
  var carModel = await getLatestCarModel();
  print('lastest car model: $carModel');
  print('do other work');
}
