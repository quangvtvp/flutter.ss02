class Book {
  String? title;
  String? author;
  int? year;
  Book({this.title, this.author, this.year});
  void displayInfo() {
    print('Title: $title, Author: $author, Year: $year');
  }
}

void main() {
  var books = [];
  Book book1 = Book(title: 'a', author: 'A', year: 2000);
  Book book2 = Book(title: 'b', author: 'B', year: 2010);
  books.add(book1);
  books.add(book2);
  for (var book in books) {
    book.displayInfo();
  }
}
