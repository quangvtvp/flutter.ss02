main() {
  var books = <Book>[];
  Book book1 = Book(
    tensach: 'Cac chuyên đề bồi dưỡng Hsg Toán',
    tacgia: 'Trần Nam Dũng',
    monhoc: 'Toán',
    sotrang: 135,
  );
  Book book2 = Book(
    tensach: 'BĐT Hình học',
    tacgia: 'hoàng NGọc Quang',
    monhoc: 'Toán',
    sotrang: 160,
  );
  Book book3 = Book(
    tensach: 'PT và HPT',
    tacgia: 'Nguyễn Tài Chung',
    monhoc: 'Toán',
    sotrang: 155,
  );
  Book book4 = Book(
    tensach: 'Vật lý đại cương',
    tacgia: 'Phạm Văn Đồng',
    monhoc: 'Vật lý',
    sotrang: 180,
  );
  Book book5 = Book(
    tensach: 'Hóa học cơ bản',
    tacgia: 'Lê Văn Thiêm',
    monhoc: 'Hóa học',
    sotrang: 120,
  );

  books.add(book1);
  books.add(book2);
  books.add(book3);
  books.add(book4);
  books.add(book5);

  for (var book in books) {
    book.printBookInfo();
  }
}

class Book {
  String tensach;
  String tacgia;
  String monhoc;
  int sotrang;
  Book({
    required this.tensach,
    required this.tacgia,
    required this.monhoc,
    required this.sotrang,
  });

  void printBookInfo() {
    print(
        'Tên sách: $tensach, Tác giả: $tacgia, Môn học: $monhoc, Số trang: $sotrang');
  }
}
