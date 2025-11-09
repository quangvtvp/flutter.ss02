class Car {
  String model;
  int year;
  Car(this.model, this.year);
}

Future<String> getLastestModel() async {
  List<Car> cars = [
    Car('ABC - 123', 2020),
    Car('GHI - 456', 2023),
    Car('XYZ - 789', 2019),
    Car('MNP - 135', 2021)
  ];
  return Future.delayed(Duration(seconds: 10), () {
    cars.sort((a, b) => a.year.compareTo(b.year));
    return cars[0].model;
  });
}

Future<void> main(List<String> args) async {
  print('START THE APP');
  print('Finding for the lastest car ...');
  var newestcar = await getLastestModel();
  print('Result: the lastest car model is $newestcar');
  print('Thank you for using our app! ');
}
