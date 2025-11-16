
Future<void> main() async {
  print('bat dau');
  print('dang lay thong tin xe moi nhat ...');
  var latestModel = await getLatestModel();
  print ('xe moi nhat: $latestModel');
  print ('lam viec khac');
}
class car {
  String? model;
  int? year;
  car(this.model ,this.year);
}
Future<String>getLatestModel() async {
  List<car> cars = [
    car('toyota', 2020),
    car('honda', 2022), 
    car('ford', 2021),
    car ('mazda', 2023),
  ];
  return Future.delayed(Duration(seconds: 2), () {
    cars.sort((a, b) => b.year!.compareTo(a.year!));
    return cars.first.model!;
  });
}
