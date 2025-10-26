void main() {
  var books = [];
  Book book1 = Book(
    title: 'Sherlock Holmes',
    author: 'Arthur Conan Doyle',
    subject: 'Mystery',
  );
  Book book2 = Book(
    title: 'Murder on the Orient Express',
    author: 'Agatha Christie',
    subject: 'Mystery',
  );
  Book book3 = Book(
    title: 'Harry Potter',
    author: 'J.K. Rowling',
    subject: 'Fantasy',
  );
  Book book4 = Book(
    title: 'The Lord of the Rings',
    author: 'J.R.R. Tolkien',
    subject: 'Fantasy',
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

  Book({
    required this.title,
    required this.author,
    required this.subject,
  });

  void printBookInfo() {
    print('$title - $author - $subject');
  }
}
