void main() {
  printBooksUsingMap();
}

void printBooksUsingMap() {
  var books = [
    {
      'Tên tác giả': 'Nguyễn Nhật Ánh',
      'Thể loại': 'Văn học',
      'Tên sách': 'Mắt biếc',
      'Số trang': 250
    },
    {
      'Tên tác giả': 'Tô Hoài',
      'Thể loại': 'Văn học',
      'Tên sách': 'Dế mèn phiêu lưu ký',
      'Số trang': 180
    },
    {
      'Tên tác giả': 'J.K. Rowling',
      'Thể loại': 'Tiếng Anh',
      'Tên sách': 'Harry Potter',
      'Số trang': 350
    },
  ];

  for (int i = 0; i < books.length; i++) {
    print(
        '${i + 1}. "${books[i]['Tên sách']}" - Tác giả: ${books[i]['Tên tác giả']}, Thể loại: ${books[i]['Thể loại']}, Số trang: ${books[i]['Số trang']}');
  }
}
