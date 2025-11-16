import 'dart:io';

class Book {
  String title;
  String author;
  int year;
  int pages;
  Book(this.title, this.author, this.year, this.pages);
  void displayInfo() {
    print('$title - $author ($year) | $pages trang');
  }
}

void main() {
  print('Nhập số lượng sách:');
  int n = _readInt();
  List<Book> books = [];
  for (int i = 0; i < n; i++) {
    print('\n--- Sách thứ ${i + 1} ---');
    stdout.write('Nhập tên sách: ');
    String title = stdin.readLineSync()!;
    stdout.write('Nhập tác giả: ');
    String author = stdin.readLineSync()!;
    print('Nhập năm xuất bản: ');
    int year = _readInt();
    print('Nhập số trang: ');
    int pages = _readInt();
    books.add(Book(title, author, year, pages));
  }
  Map<String, Book> uniqueBooks = {};
  for (var b in books) {
    String key = '${b.title.toLowerCase()}_${b.author.toLowerCase()}';
    if (!uniqueBooks.containsKey(key) || b.year > uniqueBooks[key]!.year) {
      uniqueBooks[key] = b;
    }
  }
  books = uniqueBooks.values.toList();
  books.sort((a, b) {
    int authorCompare = a.author.compareTo(b.author);
    if (authorCompare != 0) return authorCompare;
    int titleCompare = a.title.compareTo(b.title);
    if (titleCompare != 0) return titleCompare;
    return b.year.compareTo(a.year);
  });
  print('\n Thư viện sách của bạn:');
  for (var b in books) {
    b.displayInfo();
  }
  stdout.write('\nNhập từ khóa cần tìm trong tiêu đề: ');
  String keyword = stdin.readLineSync()!.toLowerCase();
  List<Book> searchResult =
      books.where((b) => b.title.toLowerCase().contains(keyword)).toList();

  searchResult.sort((a, b) => b.pages.compareTo(a.pages));
  print('\n Top 5 kết quả tìm kiếm theo số trang giảm dần:');
  for (int i = 0;
      i < (searchResult.length < 5 ? searchResult.length : 5);
      i++) {
    searchResult[i].displayInfo();
  }
  Map<String, int> pagesByAuthor = {};
  for (var b in books) {
    pagesByAuthor[b.author] = (pagesByAuthor[b.author] ?? 0) + b.pages;
  }
  String topAuthor = '';
  int maxPages = 0;
  pagesByAuthor.forEach((author, total) {
    if (total > maxPages) {
      maxPages = total;
      topAuthor = author;
    }
  });

  print('\n Tổng số trang theo từng tác giả:');
  pagesByAuthor.forEach((a, p) => print('$a: $p trang'));

  print('\n Tác giả có tổng số trang cao nhất: $topAuthor ($maxPages trang)');
}

int _readInt() {
  while (true) {
    stdout.write('> ');
    String? input = stdin.readLineSync();
    if (input == null || input.trim().isEmpty) {
      print('Không được để trống. Vui lòng nhập lại.');
      continue;
    }
    try {
      return int.parse(input);
    } catch (e) {
      print('Vui lòng nhập một số hợp lệ!');
    }
  }
}
