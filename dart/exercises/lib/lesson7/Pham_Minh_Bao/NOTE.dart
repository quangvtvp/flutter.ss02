void main() {
  book sach1 = book(name: 'Toan 11', tg: 'Nguyen Van A', trang: 100);
  book sach2 = book(name: 'Vat li 11', tg: 'Nguyen Van B', trang: 200);
  book sach3 = book(name: 'Tieng Anh 11', tg: 'Nguyen Van C', trang: 300);

  var list = [];
  list.addAll([sach1, sach2, sach3]);
  for (var i in list) {
    i.prints();
  }
}

class Student {
  String name;
  double score;
  String classname;
  Student({required this.name, required this.score, required this.classname});

  void prints() {
    print('$name \t$score \t$classname');
  }
}
//required: yêu cầu có đầy đủ thông tin, nếu không sẽ báo lỗi

class book {
  String? name;
  String? tg;
  int? trang;

  book({this.name, this.tg, this.trang});

  void prints() {
    print('$name \t$tg \t$trang');
  }
}
