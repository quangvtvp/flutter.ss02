class xe {
  String hang;
  int nam;
  double gia;

  xe(this.hang, this.nam, this.gia);

  void showInfo() {
    print('Hãng xe: $hang');
    print('Năm sản xuất: $nam');
    print('Giá: ${gia.toStringAsFixed(0)} VND');
    print('--------------------------');
  }
}

void main() {
  List<xe> carList = [
    xe('Toyota', 2020, 700000000),
    xe('Honda', 2021, 650000000),
    xe('VinFast', 2022, 800000000),
  ];
  for (var car in carList) {
    car.showInfo();
  }
}
