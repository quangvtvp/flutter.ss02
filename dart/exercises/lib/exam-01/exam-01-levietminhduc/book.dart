class Book {
  String title;
  String author;
  int publishYear;
  double price;
  bool isAvailable;
  Book({
    required this.title,
    required this.author,
    required this.publishYear,
    required this.price,
    this.isAvailable = true,
  });
  void borrow() {
    if (isAvailable) {
      isAvailable = false;
      print('Bạn đã mượn "$title".');
    } else {
      print('"$title" hiện đang không có sẵn.');
    }
  }
  void returnBook() {
    isAvailable = true;
    print('Bạn đã trả lại "$title".');
  }
  String getInfo() {
    return 'Tác giả: $author, Tên: $title, Năm: $publishYear, Giá: $priceđ, Tình trạng: ${isAvailable ? "Có sẵn" : "Đã mượn"}';
  }
  bool isOldbook() {
    if (publishYear < 1950) {
      return true;
    } else {
      return false;
    }
  }
}
