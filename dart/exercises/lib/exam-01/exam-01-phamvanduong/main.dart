List<String> books = [
  'Dế mèn phiêu lưu ký',
  'Tắt đèn',
  'Số đỏ',
  'Chí phèo',
  'Lão hạc',
  'Nhà giả Kim',
  'Đắc nhân tâm',
  'Tuổi trẻ đáng giá bao nhiêu',
  'Cây cam ngọt của tôi',
  'Sapiens - Lược sử loài người'
];
List<String> authors = [
  'Tô Hoài',
  'Ngô Tất Tố',
  'Vũ Trọng Phụng',
  'Nam Cao',
  'Nam Cao',
  'Paulo Coelho',
  'Dale Carnegie',
  'Rosie Nguyễn',
  'José Mauro de Vasconcelos',
  'Yuval Noah Harari'
];
List<int> publishYears = [
  1941,
  1939,
  1936,
  1941,
  1943,
  1988,
  1936,
  2018,
  1968,
  2011
];
List<double> prices = [
  45000,
  52000,
  48000,
  35000,
  38000,
  89000,
  95000,
  78000,
  105000,
  198000
];
List<bool> availabilities = [
  true,
  true,
  true,
  true,
  true,
  true,
  true,
  true,
  true
];

void getInfo() {
  for (int i = 0; i < books.length; i++) {
    print('Số thứ tự: ${i + 1}');
    print('Tên sách: ${books[i]}');
    print('Tác giả: ${authors[i]}');
    print('Năm xuất bản: ${publishYears[i]}');
    print('Giá: ${prices[i]}');
  }
}

void maxprice() {
  double max = prices[0];
  for (int i = 1; i < prices.length; i++) {
    if (prices[i] > max) {
      max = prices[i];
    }
    break;
  }

  print('Giá sách cao nhất là: $max');
}

void main() {
  print('==Danh sách sách trong thư viện==');
  getInfo();
  maxprice();
  print('Tổng số sách hiện có: ${books.length}');
}
