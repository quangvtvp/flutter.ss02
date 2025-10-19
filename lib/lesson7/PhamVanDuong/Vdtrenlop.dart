// khai báo danh sách các quyển sách bao gồm các thuộc tính: tác giả, môn học, tên sách, số trang
// dùng vòng for để in ra thông tin sách
main() {
  printbook();
}

void printbook() {
  var books = [
    {
      'Tacgia': 'Ha Huy Khoai',
      'Monhoc ': 'Toan',
      'Tensach': 'Toan 11 ',
      'Sotrang': 131
    },
    {
      'Tacgia': 'Bui Manh Hung',
      'Monhoc ': 'Van',
      'Tensach': 'Ngu Van 11 ',
      'Sotrang': 163
    },
    {
      'Tacgia': 'Le Kim Long',
      'Monhoc ': 'Hoa hoc',
      'Tensach': 'Hoa hoc 11',
      'Sotrang': 155
    },
    {
      'Tacgia': 'Vu Van Hung',
      'Monhoc ': 'Vat li',
      'Tensach': 'Vat li 11',
      'Sotrang': 115
    },
  ];
  for (int i = 0; i < books.length; i++) {
    print(
        '${i + 1}: ${books[i]['Tacgia']} ${books[i]['Monhoc ']} ${books[i]['Tensach']} ${books[i]['Sotrang']}');
  }
}
