class Sach {
  String tacgia;
  String monhoc;
  int sotrang;
  String tensach;
  Sach(this.tacgia, this.monhoc, this.sotrang, this.tensach);
  void showInfo() {
    print(
        'Tên: $tensach, Tác giả: $tacgia, Môn học: $monhoc, Số trang: $sotrang');
  }
}

void main() {
  var s1 = Sach('Lê Văn Tuấn', 'Toán', 382, 'Nền tảng toán học');
  s1.showInfo();
}
