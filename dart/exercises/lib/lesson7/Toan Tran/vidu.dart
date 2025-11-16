class Book {
  String tacGia;
  String monHoc;
  String tenSach;
  int soTrang;
  Book(this.tacGia, this.monHoc, this.tenSach, this.soTrang);
  void printInfo(int index) {
    print("Sách thứ $index:");
    print("Tác giả: $tacGia");
    print("Môn học: $monHoc");
    print("Tên sách: $tenSach");
    print("Số trang: $soTrang\n");
  }
}
void main() {
  List<Book> books = [
    Book('Trần Anh Toàn', 'Toán 11', 'Định nghĩa dãy số', 225),
    Book('Trần Kim Ánh', 'Văn Học', 'Hai số phận', 299),
    Book('Học viện ABC', 'Lịch sử', 'Lịch sử thế giới', 555)
  ];
  for (int i = 0; i < books.length; i++) {
    books[i].printInfo(i + 1);
  }
}
