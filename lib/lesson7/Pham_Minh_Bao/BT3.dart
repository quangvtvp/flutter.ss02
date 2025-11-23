//Bài 3: Thư viện sách (multi-key sort + search + de-dup)
//Class Book { String title; String author; int year; int pages; }, danh sách ≥ 10 sách.
//Yêu cầu:
//Loại bỏ trùng (title, author), giữ bản mới nhất (year lớn nhất).
//Sắp xếp nhiều khóa: author ↑, nếu trùng thì title ↑, nếu trùng tiếp thì year ↓.
//Tìm kiếm trong title (case-insensitive), trả về top 5 theo pages ↓.
//Thống kê tổng số trang theo từng tác giả, in tác giả có tổng trang cao nhất.

import 'dart:io';

class Book {
  String title;
  String author;
  int year;
  int pages;

  Book(this.title, this.author, this.year, this.pages);

  void si() {
    print('$title - $author \t| xuất bản: $year \t| số trang $pages');
  }
}

void main() {
  List<Book> books = [
    Book('The Hobbit', 'Tolkien', 1937, 310),
    Book('The Hobbit', 'Tolkien', 1951, 320),
    Book('1984', 'George Orwell', 1949, 328),
    Book('Animal Farm', 'George Orwell', 1945, 112),
    Book('Dune', 'Frank Herbert', 1965, 412),
    Book('Dune Messiah', 'Frank Herbert', 1969, 256),
    Book('Foundation', 'Isaac Asimov', 1951, 255),
    Book('Dune', 'Isaac Asimov', 1980, 300),
    Book('I, robot', 'Isaac Asimov', 1950, 224),
    Book('Brave New World', 'Aldous Huxley', 1932, 268),
  ];

  var list = [];
//Loại bỏ trùng (title, author), giữ bản mới nhất (year lớn nhất).
  for (var a = 0; a < books.length; a++) {
    var aa = books[a];
    for (var b = 0; b < books.length; b++) {
      var bb = books[b];
      if (aa != bb &&
          aa.title.toLowerCase() == bb.title.toLowerCase() &&
          aa.author == bb.author) {
        if (aa.year < bb.year) {
          books[a] = books[b];
          books.remove(books[b]);
        }
      }
    }
  }

//Sắp xếp nhiều khóa: author ↑, nếu trùng thì title ↑, nếu trùng tiếp thì year ↓.
  books.sort((x, y) {
    int Author = x.author.toLowerCase().compareTo(y.author.toLowerCase());
    if (Author != 0) return Author;
    int Title = x.title.toLowerCase().compareTo(y.title.toLowerCase());
    if (Title != 0) return Title;
    return y.year.compareTo(x.year);
  });
  for (var i in books) i.si();
//tìm theo từ khóa
  print('Nhập từ khso sách cần tìm:');
  String n = stdin.readLineSync()!;
  var ketqua = [];
  for (var find in books) {
    if (find.title.toLowerCase().contains(n.toLowerCase())) {
      ketqua.add(find);
    }
  }
  ketqua.sort((a, b) => b.pages.compareTo(a.pages));
  print(
      'danh sách 5 kết quả phù hợp nhất --------------------------------------');
  if (ketqua.length <= 5) {
    for (var q in ketqua) q.si();
  } else {
    for (var k = 0; k < 5; k++) {
      ketqua[k].si();
    }
  }
}
