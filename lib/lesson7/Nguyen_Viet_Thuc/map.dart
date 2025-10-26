void main() {
  printBooksUsingMap();
}

void printBooksUsingMap() {
  var books = [
    {
      'title': 'Sherlock Holmes',
      'author': 'Arthur Conan Doyle',
      'subject': 'Mystery',
    },
    {
      'title': 'Murder on the Orient Express',
      'author': 'Agatha Christie',
      'subject': 'Mystery',
    },
    {
      'title': 'Harry Potter',
      'author': 'J.K. Rowling',
      'subject': 'Fantasy',
    },
    {
      'title': 'The Lord of the Rings',
      'author': 'J.R.R. Tolkien',
      'subject': 'Fantasy',
    },
  ];
  for (int i = 0; i < books.length; i++) {
    print(
        '${i + 1}: ${books[i]['title']} - ${books[i]['author']} - ${books[i]['subject']}');
  }
}
