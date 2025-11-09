class sach {
  String title;
  String author;
  int publishYear;
  double price;
  bool isAvailable;
  sach(this.title, this.author, this.publishYear, this.price, this.isAvailable);
  void borrowBook(sach book) {
    if (book.isAvailable) {
      book.isAvailable = false;
    }
  }
  void returnBook(sach book) {
    if (!book.isAvailable) {
      book.isAvailable = true;
    }
}
}
void main() {
  var book1 = sach('sachtoan123', 'Tran Huu Gia Bao', 2009, 30000000000000, true);
  print('Tên:${book1.title}, tác giả: ${book1.author}, năm xuất bản: ${book1.publishYear}, giá: ${book1.price}, trạng thái: ${book1.isAvailable}');
  book1.borrowBook(book1);
  print('Trạng thái sau khi mượn: ${book1.isAvailable}');
  book1.returnBook(book1);
  print('Trạng thái sau khi trả: ${book1.isAvailable}');
 bool isoldBook = book1.publishYear < 1950;
  if (isoldBook) {
    print('Sách cũ');
  } else {
    print('Sách mới');
  }
}

