import 'book.dart';
import 'dart:io';

void borow(String title, List<Book> books) {
  for (int i = 0; i < books.length; i++) {
    if (books[i].title == title) {
      books[i].borrow(title);
    }
  }
}

void returnn(String title, List<Book> books) {
  for (int i = 0; i < books.length; i++) {
    if (books[i].title == title) {
      books[i].returnBook(title);
    }
  }
}

int cosan(List<Book> books) {
  int count = 0;
  for (var book in books) {
    if (book.isAvailable) {
      count++;
    }
  }
  return count;
}

void motexpensive(List<Book> books) {
  double maxPrice = books[0].price;
  int sach = 0;
  for (int i = 1; i < books.length; i++) {
    if (books[i].price > maxPrice) {
      sach = i;
    }
  }
  print('${books[sach].getInfo()}\n');
}

void timsachtheotacgia(String author, List<Book> books) {
  String result = '';
  int count = 0;
  int format = 1;
  for (var book in books) {
    if (book.author == author) {
      result += '$format. ${book.getInfo()}\n';
      count++;
    }
  }
  print('Tìm thấy $count cuốn sách:\n$result');
}

int sachco(String author, List<Book> books) {
  int count = 0;
  for (var book in books) {
    if (book.author == author && book.isOldbook()) {
      count++;
    }
  }
  return count;
}

void main() {
  List<Book> books = [
    Book('Dế mèn phiêu lưu ký', 'Tô Hoài', 1941, 45000, true),
    Book('Tắt đèn', 'Ngô Tất Tố', 1939, 52000, false),
    Book('Số đỏ', 'Vũ Trọng Phụng', 1936, 48000, true),
    Book('Chí Phèo', 'Nam Cao', 1941, 35000, true),
    Book('Lão Hạc', 'Nam Cao', 1943, 38000, false),
    Book('Nhà giả kim', 'Paulo Coelho', 1988, 89000, true),
    Book('Đắc nhân tâm', 'Dale Carnegie', 1936, 95000, false),
    Book('Tuổi trẻ đáng giá bao nhiêu', 'Rosie Nguyễn', 2018, 78000, true),
    Book('Cây cam ngọt của tôi', 'José Mauro de Vasconcelos', 1968, 105000,
        true),
    Book(
        'Sapiens: Lược sử loài người', 'Yuval Noah Harari', 2011, 198000, true),
  ];
  print('=== DANH SÁCH TẤT CẢ SÁCH ===');
  int format = 1;
  for (var book in books) {
    stdout.write('$format. ');
    print(book.getInfo());
    format++;
  }
  print('=== THỐNG KÊ THƯ VIỆN ===');
  print('Tổng số sách: ${books.length}');
  borow('Nhà giả kim', books);s
  borow('Số đỏ', books);
  returnn('Tắt đèn', books);
  print('Số sách có sẵn: ${cosan(books)}');
  print('Số sách đã mượn: ${books.length - cosan(books)}');
  print('=== SÁCH ĐẮT NHẤT ===');
  motexpensive(books);
  print('=== TÌM SÁCH CỦA TÁC GIẢ "NAM CAO"===');
  timsachtheotacgia('Nam Cao', books);
  print('Số sách cổ (trước 1950): ${sachco('Nam Cao', books)}');
}
