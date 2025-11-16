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
  List<dynamic> library = [
    book(
        title: 'de men phieu luu ky',
        author: 'To Hoai',
        publicationYear: 1941,
        price: 50000.0,
        isAvailable: true),
    book(
        title: 'tat den',
        author: 'Ngo Tat To',
        publicationYear: 1939,
        price: 52000.0,
        isAvailable: false),
    book(
        title: 'so do',
        author: 'Vu Trong Phung',
        publicationYear: 1936,
        price: 48000.0,
        isAvailable: true),
    book(
        title: 'chi pheo',
        author: 'Nam Cao',
        publicationYear: 1941,
        price: 35000.0,
        isAvailable: true),
    book(
        title: 'lao hac',
        author: 'Nam Cao',
        publicationYear: 1943,
        price: 38000.0,
        isAvailable: false),
    book(
        title: 'nha gia kim',
        author: 'Paulo Coelho',
        publicationYear: 1988,
        price: 89000.0,
        isAvailable: true),
    book(
        title: 'dac nhan tam',
        author: 'Dale Carnegie',
        publicationYear: 1936,
        price: 95000.0,
        isAvailable: false),
    book(
        title: 'tuoi tre dang gia bao nhieu',
        author: 'Roise Nguyen',
        publicationYear: 2018,
        price: 78000.0,
        isAvailable: true),
    book(
        title: 'cay cam ngot cua toi',
        author: 'Jose Mauro de Vasconcelos',
        publicationYear: 1968,
        price: 105000.0,
        isAvailable: true),
    book(
        title: 'Sapiens-lich su loai nguoi',
        author: 'Yuval Noah Harari',
        publicationYear: 2011,
        price: 198000.0,
        isAvailable: true),
  ];
  print('danh sach sach trong thu vien:');
  for (int i = 0; i < library.length; i++) {
    print('quyen sach ${i + 1}: ${library[i].getInfo()}');
  }
  print('tong so sach co trong thu vien: ${library.length}');
  library[2].borrow();
  library[5].borrow();
  library[2].getInfo();
  library[5].getInfo();
  library[1].returnBook();
  library[1].getInfo();
  var sumtrue = 0;
  var sumfalse = 0;
  for (int i = 0; i < library.length; i++) {
    if (library[i].isAvailable == true) {
      sumtrue += 1;
    } else {
      sumfalse += 1;
    }
  }
  print('tong so sach dang co san: $sumtrue');
  print('tong so sach dang khong co san: $sumfalse');
  double maxprice = library[0].price!;
  int vitrimaxprice = 0;
  for (int i = 0; i < library.length; i++) {
    if (library[i].price! > maxprice) {
      maxprice = library[i].price!;
      vitrimaxprice = i;
    }
  }
  print(
      'gia sach cao nhat la: $maxprice cua quyen sach: ${library[vitrimaxprice].title}');
  library[vitrimaxprice].getInfo();
  var x = 0;
  for (int i = 0; i < library.length; i++) {
    if (library[i].author == 'Nam Cao') {
      library[i].getInfo();
      x += 1;
    }
  }
  var y = 0;
  print('tong so sach cua tac gia Nam Cao la: $x');
  for (int i = 0; i < library.length; i++) {
    if (library[i].isOldbook() == true) {
      library[i].getInfo();
      y += 1;
    }
  }
  print('tong so sach cu la: $y');
}
