import 'dart:io';

class Book {
  String title;
  String author;
  int publicationYear;
  double price;
  bool isAvailable;

  Book(this.title, this.author, this.publicationYear, this.price,
      this.isAvailable);
}

void main() {
  List<Book> books = [];

  Book book1 = Book('Dế Mèn phiêu lưu ký', 'Tô Hoài', 1941, 45000, true);
  Book book2 = Book('Tắt đèn', 'Ngô Tất Tố ́', 1939, 52000, true);
  Book book3 = Book('Số đỏ ̉', 'Vũ Trọng Phụng', 1936, 48000, true);
  Book book4 = Book('Chí Phèo', 'Nam Cao', 1941, 35000, true);
  Book book5 = Book('Lão Hạc', 'Nam Cao', 1943, 38000, true);

  books.add(book1);
  books.add(book2);
  books.add(book3);
  books.add(book4);
  books.add(book5);
  print(' Danh sach cac cuon sach con hang: ');
  for (var book in books) {
    if (book.isAvailable) {
      print(
          ' Title: ${book.title}, Author: ${book.author}, Year: ${book.publicationYear}, Price: ${book.price}, Available: ${book.isAvailable} ');
    } else {
      print('Khong con sach');
      print(
          ' Title: ${book.title}, Author: ${book.author}, Year: ${book.publicationYear}, Price: ${book.price}, Available: ${book.isAvailable} ');
    }
  }
  for (int i = 0; i < books.length; i++) {
    print('Nhap ten sach muon muon: ');
    String? book = stdin.readLineSync();
    for (var book in books) {
      if (book.isAvailable) {
        book.isAvailable = true;
        print(' Ban da muon sach: ${book.title} thanh cong');
      } else {
        print(' Sach: ${book.title} hien khong con hang');
      }
    }
  }
}
