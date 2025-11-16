void main() {
  var book1 = Book('Dế Mèn phiêu lưu ký', 'Tô Hoài', 1941, 50000, true);
  print(book1.getInfo());

  book1.borrow();
  print(book1.getInfo());

  print(book1.isOldBook());
}

class Book {
  String title;
  String author;
  int publishYear;
  double price;
  bool isAvailable = true;

  Book(this.title, this.author, this.publishYear, this.price, this.isAvailable);

  void borrow() {
    isAvailable = false;
  }

  void returnBook() {
    isAvailable = true;
  }

  String getInfo() {
    return "Tên: $title, Tác giả: $author, Năm: $publishYear, Giá: ${price.toStringAsFixed(0)}đ, Trạng thái: ${isAvailable ? "Có sẵn" : "Đã mượn"}";
  }

  bool isOldBook() {
    if (publishYear < 1950) {
      return true;
    } else {
      return false;
    }
  }
}
