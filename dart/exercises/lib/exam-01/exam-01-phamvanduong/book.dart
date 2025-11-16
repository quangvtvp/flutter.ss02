class Book {
  String title;
  String author;
  int PublishYear;
  double price;
  bool isAvailable;
  Book(this.title, this.author, this.PublishYear, this.price, this.isAvailable);
  void borrow() {
    isAvailable = false;
    print('Sách đã mượn ');
  }

  void returnBook() {
    isAvailable = true;
    print('Sách đã trả ');
  }

  String getInfo() {
    return ('Tên sách: $title, Tác giả: $author, Năm xuất bản : $PublishYear, Giá: $price, trạng thái: ${isAvailable ? "Còn sách" : "Hết sách"}');
  }

  bool isOldBook() {
    if (PublishYear < 2000) {
      return true;
    } else {
      return false;
    }
  }
}

void main() {
  var book1 = Book('Dê ́ Mèn phiêu lưu ký', 'Tô Hoài', 1941, 50000, true);
  print(book1.getInfo());
  book1.borrow();
  print(book1.getInfo());
  print(book1.isOldBook());
}
