Future<void> main(List<String> args) async {
  print('Start the app');
  print('fetching the latest model');
  var model = await getLatestModel();
  print('Latest model:$model');
  print('do other work');
} 
class Car {
  String model;
  int year;
  Car(this.model,this.year);
}
Future<String> getLatestModel() async {
  List<Car> models = [
    Car('Toyota', 2020),
    Car('Honda', 2021),
    Car('Ford', 2022),
    Car('Chevrolet', 2023),
  ];
  return Future.delayed(Duration(seconds: 10), () {
    models.sort((a, b) => b.year.compareTo(a.year));
    return models.first.model;
  });
}