class Book {
  String title;
  String author;
  int publishYear;
  int price;
  bool isAvailable;
  Book(this.title, this.author, this.publishYear, this.price, this.isAvailable);
  void getInfo() {
    print(
        'Tên: $title, Tác giả: $author, Năm xuất bản: $publishYear, Giá: $price đ, Trạng thái: $isAvailable');
  }

  void borrow() {
    if (isAvailable == true) {
      isAvailable = false;
    }
  }

  void returnBook() {
    if (isAvailable == false) {
      isAvailable = true;
    }
  }

  bool isOldBook() {
    if (publishYear < 1950) {
      return true;
    } else {
      return false;
    }
  }
}

void main() {
  List<Book> books = [
    Book('Dế Mèn phiêu lưu ký', 'Tô Hoài', 1941, 45000, true),
    Book('Tắt đèn', 'Ngô Tất Tố', 1939, 52000, false),
    Book('Số đỏ', 'Vũ Trọng Phụng', 1936, 48000, true),
    Book('Chí Phèo', 'Nam Cao', 1941, 35000, true),
    Book('Lão Hạc', 'Nam Cao', 1943, 38000, false),
    Book('Nhà giả kim', 'Paulo Coelho', 1988, 89000, true),
    Book('Đắc nhân tâm', 'Dale Carnegie', 1936, 95000, false),
    Book('Tuổi trẻ đáng giá bao nhiêu', 'Rosie Nguyễn', 2018, 78000, true),
    Book('Cây cam ngọt của tôi', 'José Mauro de Vasconcelos', 1968, 105000,
        true),
    Book('Sapiens - Lược sử loài người', 'Yuval Noah Harari', 2011, 198000,
        true),
  ];
  var boook = books.length;
  for (var i = 1; i < boook; i++) {
    print(i);
    books[i].getInfo();
  }
  var tongsach = 0;
  for (var i = 0; i < boook; i++) {
    if (books[i].isAvailable = true) ;
    tongsach++;
  }
  print('Tổng số sách hiện có: $tongsach');
  books[2].borrow();
  books[5].borrow();
  print('đã cho mượn ${books[2].title} và ${books[5].title}');
  books[1].returnBook();
  print('đã trả cuốn ${books[1].title}');
  for (var i = 0; i < boook; i++) {
    books[i].getInfo();
  }
}
