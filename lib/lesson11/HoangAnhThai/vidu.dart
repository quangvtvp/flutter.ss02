import 'dart:io';
import 'dart:async';
import 'dart:math';

Future<void> main() async {
  List<Car> cars = [
    Car('Toyota', 'Camry', 2020),
    Car('Honda', 'Civic', 2019),
    Car('Ford', 'Mustang', 2021),
    Car('Chevrolet', 'Malibu', 2018),
    Car('Nissan', 'Altima', 2022),
    Car('BMW', '3 Series', 2021),
    Car('Audi', 'A4', 2020),
    Car('Mercedes-Benz', 'C-Class', 2019),
    Car('Redbull', 'RB21', 2021),
    Car('McLaren', '720S', 2020),
    Car('Ferrari', '488 GTB', 2019),
    Car('Lamborghini', 'Huracan', 2022),
    Car('Porsche', '911', 2021),
    Car('Volkswagen', 'Passat', 2018),
    Car('Hyundai', 'Sonata', 2020),
    Car('Kia', 'Optima', 2019),
    Car('Mazda', '6', 2021),
    Car('Subaru', 'Legacy', 2022),
    Car('Tesla', 'Model 3', 2021),
    Car('Volvo', 'S60', 2020),
    Car('Jaguar', 'XE', 2019),
    Car('Alfa Romeo', 'Giulia', 2021),
    Car('Cadillac', 'CT5', 2020),
    Car('Infiniti', 'Q50', 2019),
    Car('Acura', 'TLX', 2021),
    Car('Genesis', 'G70', 2022),
    Car('Lincoln', 'MKZ', 2020),
    Car('Buick', 'Regal', 2019),
    Car('Chrysler', '300', 2021),
  ];

  print('latest models is printing');
  const total = 100;
  const barLength = 30;

  for (int i = 0; i <= total; i++) {
    int randomDelay = Random().nextInt(100);
    double percent = i / total;
    int filled = (percent * barLength).round();
    int empty = barLength - filled;

    String bar =
        '[${'*' * filled}${'_' * empty}] ${(percent * 100).toStringAsFixed(0)}%';
    stdout.write('\r$bar');
    await Future.delayed(Duration(milliseconds: randomDelay));
  }
  print(' DONE\n');
  getLatestModels(cars);
}

Future<String> processingimg() async {
  print('Processing image...');
  await Future.delayed(Duration(seconds: 2)); // Simulate a delay
  print('Image processed successfully!');
  return 'Image data';
}

class Car {
  String brand;
  String model;
  int year;
  Car(this.brand, this.model, this.year);
}

Future<void> getLatestModels(List<Car> cars) async {
  await Future.delayed(Duration(seconds: 1));
  for (var car in cars) {
    if (car.year >= 2022) {
      print('${car.brand} ${car.model} - ${car.year}');
    }
  }
}
