class Car {
  String hang;
  String xe;
  int namSX;
  double giatien;
  Car(this.hang, this.xe, this.namSX, this.giatien);
  void showInfo() {
    print('Tên: $xe, Năm: $namSX, hãng: $hang, Giá: $giatien');
  }
}

void main() {
  var s1 = Car('Honda', 'Civic', 2020, 700000);
  var s2 = Car('Toyota', 'Corolla', 2021, 750000);

  s1.showInfo();
  s2.showInfo();
}
