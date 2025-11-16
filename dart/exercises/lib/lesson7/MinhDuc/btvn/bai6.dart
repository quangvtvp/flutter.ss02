// Bài về nhà số 6: CLI mini-menu để quản lý sách với các chức năng:
// 1. Sắp xếp sách theo tiêu chí nhập vào (tác giả, tiêu đề, năm xuất bản, số trang).
// 2. Tìm kiếm sách theo từ khóa trong tiêu đề.
// 3. In top K sách theo số trang.
import 'dart:io';
class Book {
  String title;
  String author;
  int year;
  int pages;

  Book({required this.title, required this.author, required this.year, required this.pages});
  void showInfo() {
    print('Tên sách: $title, Tác giả: $author, Năm xuất bản: $year, Số trang: $pages');
  }
}
// Sắp xếp theo tiêu chí nhập
void sortBooks(List<Book> books, String criteria) {
  switch (criteria) {
    case 'author':
      books.sort((a, b) => a.author.compareTo(b.author));
      break;
    case 'title':
      books.sort((a, b) => a.title.compareTo(b.title));
      break;
    case 'year':
      books.sort((a, b) => b.year.compareTo(a.year));
      break;
    case 'pages':
      books.sort((a, b) => b.pages.compareTo(a.pages));
      break;
    default:
      print('Tiêu chí không hợp lệ.');
  }
}
// Tìm kiếm sách theo từ khóa
List<Book> searchBooks(List<Book> books, String keyword) {
  return books
      .where((book) => book.title.toLowerCase().contains(keyword.toLowerCase()))
      .toList();
}
// In top K sách theo số trang
List<Book> topKBooksByPages(List<Book> books, int k) {
  books.sort((a, b) => b.pages.compareTo(a.pages));
  return books.take(k).toList();
}
void main() {
  var books = <Book>[
    Book(title: 'Dart Programming', author: 'Alice', year: 2020, pages: 300),
    Book(title: 'Flutter Development', author: 'Bob', year: 2021, pages: 250),
    Book(title: 'Advanced Dart', author: 'Alice', year: 2019, pages: 200),
    Book(title: 'Mobile Apps', author: 'Charlie', year: 2022, pages: 400),
    Book(title: 'Dart for Beginners', author: 'Eve', year: 2021, pages: 150),
  ];

  while (true) {
    print('\n--- Quản lý sách ---');
    print('1. Sắp xếp sách');
    print('2. Tìm kiếm sách');
    print('3. In top K sách theo số trang');
    print('4. Thoát');
    stdout.write('Chọn một tùy chọn (1-4): ');
    String choice = stdin.readLineSync()!;

    if (choice == '1') {
      stdout.write('Nhập tiêu chí sắp xếp (author/title/year/pages): ');
      String criteria = stdin.readLineSync()!;
      if (criteria != 'author' &&
          criteria != 'title' &&
          criteria != 'year' &&
          criteria != 'pages') {
        print('Tiêu chí không hợp lệ. Vui lòng thử lại.');
        continue;
      }
      sortBooks(books, criteria);
      print('Sách sau khi sắp xếp:');
      for (var book in books) {
        book.showInfo();
      }
    } else if (choice == '2') {
      stdout.write('Nhập từ khóa tìm kiếm: ');
      String keyword = stdin.readLineSync()!;
      if (keyword.isEmpty) {
        print('Từ khóa không được để trống. Vui lòng thử lại.');
        continue;
      }
      var results = searchBooks(books, keyword);
      print('Kết quả tìm kiếm:');
      for (var book in results) {
        book.showInfo();
      }
    } else if (choice == '3') {
      stdout.write('Nhập K: ');
      int k = int.parse(stdin.readLineSync()!);
      if (k == null || k <= 0) {
        print('K phải là số nguyên dương. Vui lòng thử lại.');
        continue;
      }
      var topKBooks = topKBooksByPages(books, k);
      print('Top $k sách theo số trang:');
      for (var book in topKBooks) {
        book.showInfo();
      }
    } else if (choice == '4') {
      print('Thoát chương trình.');
      break;
    } else {
      print('Lựa chọn không hợp lệ. Vui lòng thử lại.');
    }
  }
}