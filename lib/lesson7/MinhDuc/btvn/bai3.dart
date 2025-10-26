//Bài về nhà số 3: Thư viện sách (multi-key sort + search + de-dup)
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
// Hàm lọc sách, trùng tên sách và tác giả thì giữ lại 1 cuốn có năm xuất bản mới nhất
List<Book> filterBooks(List<Book> books) {
  var uniqueBooks = <String, Book>{};
  for (var book in books) {
    var key = '${book.title}-${book.author}';
    if (!uniqueBooks.containsKey(key) || uniqueBooks[key]!.year < book.year) {
      uniqueBooks[key] = book;
    }
  }
  return uniqueBooks.values.toList();
}
// Sắp xếp nhiều khóa: author ↑, nếu trùng thì title ↑, nếu trùng tiếp thì year ↓.
void sortBooks(List<Book> books) {
  books.sort((a, b) {
    int authorComp = a.author.compareTo(b.author);
    if (authorComp != 0) return authorComp;
    int titleComp = a.title.compareTo(b.title);
    if (titleComp != 0) return titleComp;
    return b.year.compareTo(a.year);
  });
}
// Tìm kiếm sách theo tác phẩm, trả về top 5 sách có số trang giảm dần.
List<Book> searchBooks(List<Book> books, String keyword) {
  var filtered = books.where((book) => book.title.toLowerCase().contains(keyword.toLowerCase())).toList();
  filtered.sort((a, b) => b.pages.compareTo(a.pages));
  return filtered.take(5).toList();
}
// Thống kê tổng số trang theo từng tác giả, in tác giả có tổng trang cao nhất.
void printAuthorStats(List<Book> books) {
  var authorStats = <String, int>{};
  for (var book in books) {
    authorStats[book.author] = (authorStats[book.author] ?? 0) + book.pages;
  }
  var maxAuthor = authorStats.entries.reduce((a, b) => a.value > b.value ? a : b);
  print('Tác giả có tổng số trang cao nhất: ${maxAuthor.key} với ${maxAuthor.value} trang.');
}
void main() {
  var books = <Book>[
    Book(title: 'Dart Programming', author: 'Alice', year: 2020, pages: 300),
    Book(title: 'Flutter Development', author: 'Bob', year: 2021, pages: 250),
    Book(title: 'Dart Programming', author: 'Alice', year: 2021, pages: 320),
    Book(title: 'Advanced Dart', author: 'Alice', year: 2019, pages: 200),
    Book(title: 'Mobile Apps', author: 'Charlie', year: 2022, pages: 400),
    Book(title: 'Flutter Development', author: 'Bob', year: 2020, pages: 260),
    Book(title: 'Dart for Beginners', author: 'Eve', year: 2021, pages: 150),
    Book(title: 'Dart Programming', author: 'Alice', year: 2018, pages: 280),
    Book(title: 'Web Development', author: 'Frank', year: 2019, pages: 350),
    Book(title: 'Vật lý đại cương', author: 'Phạm Văn Đồng', year: 2018, pages: 180),
    Book(title: 'Hóa học cơ bản', author: 'Lê Văn Thiêm', year: 2020, pages: 120),
    Book(title: 'PT và HPT', author: 'Nguyễn Tài Chung', year: 2021, pages: 155),
    Book(title: 'BĐT Hình học', author: 'Hoàng NGọc Quang', year: 2019, pages: 160),
    Book(title: 'Các chuyên đề bồi dưỡng Hsg Toán', author: 'Trần Nam Dũng', year: 2020, pages: 450),

  ];

  // Lọc sách trùng
  books = filterBooks(books);
  print('Danh sách sách sau khi lọc trùng:');
  for (var book in books) {
    book.showInfo();
  }

  // Sắp xếp sách
  sortBooks(books);
  print('\nDanh sách sách sau khi sắp xếp:');
  for (var book in books) {
    book.showInfo();
  }

  // Tìm kiếm sách
  var searchResults = searchBooks(books, 'Dart');
  print('\nKết quả tìm kiếm cho top 5 sách có số trang giảm dần:');
  for (var book in searchResults) {
    book.showInfo();
  }

  // Thống kê tác giả
  print('\nThống kê tác giả:');
  printAuthorStats(books);
} 