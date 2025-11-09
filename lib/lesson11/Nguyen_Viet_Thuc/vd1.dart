Future<void> main() async {
  print('Start the app');
  print('Fetching the latest model car...');
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
  return Future.delayed(Duration(seconds: 15), () {
    cars.sort((a, b) => b.year.compareTo(a.year));
    return cars.first.model;
  });
}
