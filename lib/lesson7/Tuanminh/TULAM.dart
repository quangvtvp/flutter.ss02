void main() {
  var booklist = [];
  book book1 = book(
      author: 'Nam Cao',
      subject: 'Văn học',
      bookname: 'Chí Phèo',
      numberpages: 120);
  book book2 = book(
      author: 'Tô Hoài',
      subject: 'Văn học',
      bookname: 'Dế Mèn phiêu lưu ký',
      numberpages: 150);
  booklist.addAll([book1, book2]);

  for (var book in booklist) {
    print(
        'Tác giả : ${book.author}, Môn học: ${book.subject}, Tên sách: ${book.bookname}, số trang : ${book.numberpages}');
  }
}

class book {
  String author;
  String subject;
  String bookname;
  int numberpages;
  book({
    required this.author,
    required this.subject,
    required this.bookname,
    required this.numberpages,
  });
}
