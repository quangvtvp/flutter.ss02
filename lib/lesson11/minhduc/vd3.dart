Future<void> main(List<String> args) async {
  print('Bắt đầu lấy dữ liệu...');
  print('Đang chờ kết quả...');

  // Dùng await để chờ Future hoàn thành và lấy giá trị.
  // Code trông giống như code đồng bộ!
  var ketQua = await layDuLieuoto();
  var latestModel = await getLatestModel();

  // Dòng này chỉ được thực thi sau khi await ở trên hoàn thành.
  print('Kết quả nhận được: $ketQua');
  print('Ô tô cũ nhất đã được tìm thấy là: $latestModel');
  print('Chương trình kết thúc.');
}

class Car {
  String model;
  int year;
  Car(this.model, this.year);
}

Future<String> layDuLieuoto() async {
  List<Car> cars = [
    Car('Toyota', 2020),
    Car('Honda', 2019),
    Car('Ford', 2018),
    Car('Chevrolet', 2021),
    Car('BMW', 2022),
  ];
  return Future.delayed(Duration(seconds: 10), () {
    print('Dữ liệu ô tô đã được lấy.');
    cars.sort((a, b) => a.year.compareTo(b.year));
    return 'Danh sách ô tô đã được sắp xếp theo năm: ${cars.map((car) => '${car.model} (${car.year})').join(', ')}';
  });
  
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
