class Book {
  String tensach;
  int sotrang;
  String tacgia;
  Book(this.tensach, this.sotrang, this.tacgia);
  void printInfo() {
    print('Tên sách: $tensach');
    print('Số trang: $sotrang');
    print('Tác giả: $tacgia');
    print('sách tiếp theo');
  }
}

void main() {
  List<Book> books = [
    Book('Ngữ Văn 11', 180, 'Bộ Giáo Dục và Đào Tạo'),
    Book('Toán 11 - Đại số và Giải tích', 220, 'Bộ Giáo Dục và Đào Tạo'),
    Book('Vật Lí 11', 160, 'Bộ Giáo Dục và Đào Tạo'),
  ];
  for (var book in books) {
    book.printInfo();
  }
}
