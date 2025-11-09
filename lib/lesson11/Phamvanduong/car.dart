Future<void> main() async {
  print('start the app');
  print('fetching the lastest model');
  var modelname = await getlastestmodel();
  print('Lastest model is $modelname');
  print(' do other work');
}

class Car {
  String model;
  int year;
  Car(this.model, this.year);
}

Future<String> getlastestmodel() async {
  List<Car> models = [
    Car('Toyota', 2020),
    Car('Honda', 2019),
    Car('Ford', 2018),
    Car('BMW', 2021),
    Car('Audi', 2022)
  ];
  return Future.delayed(Duration(seconds: 10), () {
    models.sort((a, b) => b.year.compareTo(a.year));
    return models.first.model;
  });
}
