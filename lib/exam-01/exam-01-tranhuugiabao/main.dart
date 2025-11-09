void main() {
  List<String> books = ['Dế Mèn Phiêu Lưu Ký','Tắt đèn','Số đỏ','Chí phèo','Lão hạc','Nhà giả kim','Đắc nhân tâm','Tuổi trẻ đáng giá bao nhiêu','Cây cam ngọt của tôi','Sapiens'];
  List<String> authors = ['Tô Hoài','Ngô Tất Tố','Vũ Trọng Phụng','Nam Cao','Nam Cao','Paulo Coelho','Dale Carnegie','Rosie Nguyễn','José Mauro de Vasconcelos','Yuval Noah Harari'];
  List<int> publishYears = [1941, 1939, 1936, 1941, 1943, 1988, 1936, 2018, 1968, 2011];
  List<double> prices = [45000, 52000, 48000, 35000, 38000,89000, 95000, 78000, 105000, 198000];
  List<bool> isAvailable = [true, false, true, true, false, true, false, true, true,true];
    for (int i = 0; i < books.length; i++) {
  print('Tên: ${books[i]}, Tác giả: ${authors[i]}, Năm xuất bản: ${publishYears[i]}, Giá: ${prices[i]}, Trạng thái: ${isAvailable[i]}');

    }
  print('tổng số sách: ${books.length}');
  prices.sort();
  print('Giá sách cao nhất ${prices.last}');
}

