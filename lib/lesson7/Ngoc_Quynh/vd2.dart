class Book {
  String? tensach;
  String? tacgia;
  String? monhoc;
  int? sotrang;
  Book({this.tensach, this.tacgia, this.monhoc, this.sotrang});

  void printBookInfo() {
    print(
        'Ten sach: $tensach, Tac gia: $tacgia, Mon hoc: $monhoc, So trang: $sotrang');
  }
}

void main() {
  var books = [];
  Book book1 = Book(
    tensach: 'A',
    tacgia: 'a',
    monhoc: 'toan',
    sotrang: 100,
  );
  Book book2 = Book(
    tensach: 'B',
    tacgia: 'b',
    monhoc: 'ly',
    sotrang: 200,
  );
  books.add(book1);
  books.add(book2);
  for (var book in books) {
    book.printBookInfo();
  }
}
