void main(){
  List<Book> books = [
    Book('Dế Mèn Phiêu Lưu Ký','Tô Hoài', 1941, 45000, true),
    Book('Tắt Đèn','Ngô Tất Tố', 1939, 52000, false),
    Book('Số Đỏ','Vũ Trọng Phụng', 1936, 48000, true),
    Book('Chí Phèo','Nam cao', 1941, 35000, true),
    Book('Lão Hạc','Nam cao', 1943, 38000, false),
    Book('Nhà Giả Kim','Paulo Coelho', 1988, 89000, true),
    Book('Đắc Nhân Tâm','Dale Carnegie', 1936, 95000, false),
    Book('Tuổi Trẻ Đáng Giá Bao Nhiêu','Lê Thẩm Dương', 2018, 78000, true),
    Book('Cây Cam Ngọt CỦa Tôi', 'José Mauro de Vasconcelos', 1968, 105000, true),
    Book('Sapiens-Lược Sử Loài Người','Yuval Noah Harari', 2011, 198000, true),
  ];
  for(var book in books){
    print(book.getBookInfo());

  }
  }
