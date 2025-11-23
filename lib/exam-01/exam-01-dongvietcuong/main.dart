// Định nghĩa lớp Book
class Book {
  String? title;
  String? author;
  int? PublicationYear;
  double? price;
  bool? isAvailable;
  Book(this.title, this.author, this.PublicationYear, this.price,
      {this.isAvailable = true});
  void borrow() {
    if (isAvailable == true) {
      print('sách $title đang có sẵn, bạn có thể mượn');
      isAvailable = false;
    } else {
      print('xin lỗi ,sách $title đã có người mượn.');
    }
  }

  void returnBook() {
    if (isAvailable == false) {
      print('sách đã có sẵn $title');
      isAvailable = true;
    } else {
      print('sách $title không thuộc về thư viện chúng tôi.');
    }
  }

  void getInfo() {
    print('tên sách: $title');
    print('tác giả: $author');
    print('năm xuất bản: $PublicationYear');
    print('giá: $price nghìn đông');
    print('tình trạng: ${isAvailable == true ? "còn sách" : "hết sách"}');
  }
}

void main() {
  List<Book> books = [
    Book('Dế Mèn phiêu lưu ký', 'Tô Hoài', 1941, 45000, isAvailable: true),
    Book('Tắt đèn', 'Ngô Tất Tố', 1939, 52000, isAvailable: false),
    Book('Số đỏ', 'Vũ Trọng Phụng', 1936, 48000, isAvailable: true),
    Book('Chí Phèo', 'Nam Cao', 1941, 35000, isAvailable: true),
    Book('Lão Hạc', 'Nam Cao', 1943, 38000, isAvailable: false),
    Book('Nhà giả kim', 'Paulo Coelho', 1988, 89000, isAvailable: true),
    Book('Đắc nhân tâm', 'Dale Carnegie', 1936, 95000, isAvailable: false),
    Book('Tuổi trẻ đáng giá bao nhiêu', 'Rosie Nguyễn', 2018, 78000,isAvailable: true),
    Book('Cây cam ngọt của tôi', 'José Mauro de Vasconcelos', 1968, 105000, isAvailable: true),
    Book('Sapiens - Lược sử loài người', 'Yuval Noah Harari', 2011, 198000,isAvailable: true),
  ];

  // in thông tin sách
  for (var book in books) {
    book.getInfo();
    print('-----------------------');
  }
//mượn sách
 Book[5].borrow();
 Book[2].borrow();
  //trả sách


}
