class Book {
  String title;
  String author;
  int publishYear;
  double price;
  bool isAvailable = true;

  Book(this.title, this.author, this.publishYear, this.price, this.isAvailable);

  void borrow() {
    isAvailable = false;
  }

  void returnBook() {
    isAvailable = true;
  }

  String getInfo() {
    String status = (isAvailable) ? 'Có sắn' : 'Đã Mượn';
    return ('Tên: $title, Tác giả: $author, Năm: $publishYear, Giá: $priceđ, Trạng thái: $status ');
  }

  bool oldBook() {
    if (publishYear < 1950) {
      return true;
    } else {
      return false;
    }
  }
}

void main() {
  List<Book> books = [
    Book('De Men Phieu Luu ki', 'To Hoai', 1941, 45000, true),
    Book('Tat Den', 'Ngo Tat To', 1939, 52000, false),
    Book('So Do', 'Vu Trong Phung', 1936, 48000, true),
    Book('Chi Pheo', 'Nam Cao', 1941, 35000, true),
    Book('Lao Hac', 'Nam Cao', 1943, 38000, false),
    Book('Nha Gia Kim', 'Paulo Coelho', 1988, 89000, true),
    Book('Dac Nhan Tam', 'Dale Carnegie', 1936, 95000, false),
    Book('Tuoi tre dang gia bao nhieu', 'Rosie Nguyen', 2018, 78000, true),
    Book('Cay cam ngot cua toi', 'JMdV', 1968, 105000, true),
    Book(
        'Sapiens - luoc su loai nguoi', 'Yuval Noah Harari', 2011, 198000, true)
  ];

  //sắp xếp sách theo giá và in thông tin sách
  books.sort((a, b) => b.price.compareTo(a.price)); //sắp xếp theo giá giảm dần
  for (var i = 0; i < books.length; i++) {
    print('${i + 1}. ${books[i].getInfo()} '); //lặp và in thông tin bnagwf getInfo()
  }

  print('\n=====THỐNG KÊ THƯ VIỆN=====');
  //tổng số sách
  print('Tổng số sách: ${books.length}');

  //cho mượn sách
  books[2].borrow();
  books[5].borrow();

  //trả sách
  books[1].returnBook();

  // số sách mượn, có sẵn
  int cosan = 0, damuon = 0; //biến đếm số sách đã mượn/có sẵn
  for (var i in books) {
    if (i.isAvailable == true) {
      cosan++;
    } else {
      damuon++;
    }
  }
  print('Số sách có sẵn: $cosan');
  print('Số sách đã mượn: $damuon');

  //tìm sách đắt nhất
  books.sort((a, b) => b.price.compareTo(a.price));
  print('\n=====SÁCH ĐẮT NHẤT=====');
  print(books[0].getInfo()); //sách đắt nhất là sách ở đầu

  //tìm sách của Nam Cao
  List<Book> sachcuanamcao = []; //list chứa sách của Nam Cao
  for (var i = 0; i < books.length; i++) {
    if (books[i].author.toLowerCase() == 'nam cao') {
      sachcuanamcao.add(books[i]);
    }
  }
  print('\n=====TÌM SÁCH CỦA TÁC GIẢ "Nam Cao"=====');
  print('Tìm thấy ${sachcuanamcao.length} cuốn sách:');
  for (var i = 0; i < sachcuanamcao.length; i++) {
    print('${i + 1}. ${sachcuanamcao[i].getInfo()}');
  }

  //số sách cổ
  List<Book> sachco = []; //list chưa sách cổ
  for (var i in books) {
    if (i.oldBook()) {
      sachco.add(i);
    }
  }
  print('Số sách cổ (trước năm 1950): ${sachco.length}');
}
