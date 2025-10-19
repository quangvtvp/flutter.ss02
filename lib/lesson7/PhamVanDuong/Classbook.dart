main() {
  var books = <Book>[];
  Book book1 = Book(
    title: 'Toan 11',
    author: 'Ha Huy Khoai',
    subject: 'Toan',
    pages: 131,
  );
  Book book2 = Book(
    title: 'Ngu Van 11',
    author: 'Bui Manh Hung',
    subject: 'Van',
    pages: 163,
  );
  Book book3 = Book(
    title: 'Hoa hoc 11',
    author: 'Le Kim Long',
    subject: 'Hoa hoc',
    pages: 155,
  );
  Book book4 = Book(
    title: 'Vat li 11',
    author: 'Vu Van Hung',
    subject: 'Vat li',
    pages: 115,
  );

  books.add(book1);
  books.add(book2);
  books.add(book3);
  books.add(book4);

  for (var book in books) {
    book.printBookInfo();
  }
}

class Book {
  String title;
  String author;
  String subject;
  int pages;
  Book({
    required this.title,
    required this.author,
    required this.subject,
    required this.pages,
  });

  void printBookInfo() {
    print(
        'Tên sách: $title, Tác giả: $author, Môn học: $subject, Số trang: $pages');
  }
}
