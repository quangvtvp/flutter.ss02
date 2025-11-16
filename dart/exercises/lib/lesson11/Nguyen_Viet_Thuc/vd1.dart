import 'dart:io';

Future<void> main() async {
  print('Start the app');
  print('Fetching the latest model car');
  var latestModel = await getLatestModel();
  print('Latest model car: $latestModel');
  print('Do other work');
}

class Car {
  String model;
  int year;
  Car(this.model, this.year);
}

Future<String> getLatestModel() async {
  List<Car> cars = [
    Car('Toyota', 2020),
    Car('Honda', 2022),
    Car('Ford', 2021),
  ];
  for (var i = 0; i < 10; i++) {
    stdout.write('.'); // Simulate doing other work
    await Future.delayed(Duration(seconds: 1));
  }
  print('\nFinished fetching car data.');
  cars.sort((a, b) => b.year.compareTo(a.year));
  return cars.first.model;
}
