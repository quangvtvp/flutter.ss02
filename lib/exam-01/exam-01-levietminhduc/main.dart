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

void main() {
  var books = <Book>[
    // Sách 1
    Book(title: 'Dế mèn phiêu lưu ký', author: 'To Hoài', publishYear: 1941, price: 45000, isAvailable: true),
    // Sách 2
    Book(title: 'Tắt đèn', author: 'Ngô Tất Tố', publishYear: 1939, price: 52000, isAvailable: false),
    // Sách 3
    Book(title: 'Số đỏ', author: 'Vũ Trọng Phụng', publishYear: 1936, price: 48000, isAvailable: true),
    // Sách 4
    Book(title: 'Chí Phèo', author: 'Nam Cao', publishYear: 1941, price: 35000, isAvailable: true),
    // Sách 5
    Book(title: 'Lão Hạc', author: 'Nam Cao', publishYear: 1943, price: 38000, isAvailable: false),
    // Sách 6
    Book(title: 'Nhà giả kim', author: 'Paulo Coelho', publishYear: 1988, price: 89000, isAvailable: true),
    // Sách 7
    Book(title: 'Đắc nhân tâm', author: 'Dale Carnegie', publishYear: 1936, price: 95000, isAvailable: false),
    // Sách 8
    Book(title: 'Tuổi trẻ đáng giá bao nhiêu', author: 'Rosie Nguyễn', publishYear: 2018, price: 78000, isAvailable: true),
    // Sách 9
    Book(title: 'Cây cam ngọt của tôi', author: 'José Mauro de Vasconcelos', publishYear: 1968, price: 105000, isAvailable: true),
    // Sách 10
    Book(title: 'Sapiens - Lược sử loài người', author: 'Yuval Noah Harari', publishYear: 2011, price: 198000, isAvailable: true)
  ];
  print('--- Thông tin tất cả sách ---');
  for (var i = 0; i < books.length; i++) {
    print('${i + 1}. ${books[i].getInfo()}');
  }
  print('Tổng số sách là: ${books.length}');
  print('Cho mượn sách "Nhà giả kim" và "Số đỏ"');
  books[5].borrow();
  books[2].borrow();
  print('Sách sau khi cho mượn:');
  for (var i = 0; i < books.length; i++) {
    print('${i + 1}. ${books[i].getInfo()}');
  }
  print('Trả lại sách "Tắt đèn"');
  books[1].returnBook();
  print('Sách sau khi trả lại:');
  for (var i = 0; i < books.length; i++) {
    print('${i + 1}. ${books[i].getInfo()}');
  }
  print('Số sách có sẵn là: ${books.where((book) => book.isAvailable).length}');
  print('Số sách đã mượn là: ${books.where((book) => !book.isAvailable).length}');
  print('Danh sách sách cũ (xuất bản trước năm 1950):');
  for (var book in books) {
    if (book.isOldbook()) {
      print('- ${book.title} (${book.publishYear})');
    }
    else {
      continue;
    }
  }
  print('Sách đắt nhất là:');
  var authorStats = <String, double>{};
  for (var book in books) {
    authorStats[book.title] = (authorStats[book.title] ?? 0) + book.price;
  }
  var mostExpensivetitle = authorStats.entries.reduce((a, b) => a.value > b.value ? a : b);
  print('${mostExpensivetitle.key} với giá ${mostExpensivetitle.value}đ.');
  print('Sách của tác giả Nam Cao:');
  for (var book in books) {
    if (book.author == 'Nam Cao') {
      print('- ${book.title} (${book.publishYear}) - Giá: ${book.price}đ - Tình trạng: ${book.isAvailable ? "Có sẵn" : "Đã mượn"}');
    }
  }
}
