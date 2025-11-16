class Book {
  String title;
  String author;
  int pulishYear;
  double price;
  bool isAvailable;

  Book(this.title, this.author, this.pulishYear, this.price, this.isAvailable);

  void borrow(String title) => isAvailable = false;
  void returnBook(String title) => isAvailable = true;
  String getInfo() {
    return 'Tên: $title, Tác giả: $author, Năm xuất bản: $pulishYear, Giá: ${price.toInt()}đ, Trạng thái: ${isAvailable ? "Có sẵn" : "Đã mượn"}';
  }

  bool isOldbook() {
    return pulishYear < 1950;
  }
}
