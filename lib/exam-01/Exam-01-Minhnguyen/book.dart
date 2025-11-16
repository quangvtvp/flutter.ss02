class book {
  String? title;
  String? author;
  int? publicationYear;
  double? price;
  bool? isAvailable;
  book(
      {this.title,
      this.author,
      this.publicationYear,
      this.price,
      this.isAvailable});
  void borrow() {
    isAvailable = false;
  }

  void returnBook() {
    isAvailable = true;
  }

  bool isOldbook() {
    if (publicationYear! < 1950) {
      return true;
    } else {
      return false;
    }
  }

  void getInfo() {
    if (isAvailable == true) {
      print(
          'Ten: $title, tac gia: $author, Nam: $publicationYear, gia sach: $price, trang thai:co san');
    } else {
      print(
          'Ten: $title, tac gia: $author, Nam: $publicationYear, gia sach: $price, trang thai:khong co san');
    }
  }
}

void main() {
  var book1 = book(
      title: 'de men phieu luu ky',
      author: 'to hoai',
      publicationYear: 1941,
      price: 50000.0,
      isAvailable: true);
  book1.getInfo();
  book1.borrow();
  book1.getInfo();
  print(book1.isOldbook());
}
