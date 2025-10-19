void main() {
  List<Map<String, dynamic>> books = [
    {
      'tacGia': 'Trần Anh Toàn',
      'monHoc': 'Toán 11',
      'tenSach': 'Định nghĩa dãy số',
      'soTrang': 225
    },
    {
      'tacGia': 'Trần Kim Ánh',
      'monHoc': 'Văn Học',
      'tenSach': 'Hai số phận',
      'soTrang': 299
    },
    {
      'tacGia': 'Học viện ABC',
      'monHoc': 'Lịch sử',
      'tenSach': 'Lịch sử thế giới',
      'soTrang': 555
    }
  ];
  for (int i = 0; i < books.length; i++) {
    print("Sách thứ ${i + 1}:");
    print("Tác giả: ${books[i]['tacGia']}");
    print("Môn học: ${books[i]['monHoc']}");
    print("Tên sách: ${books[i]['tenSach']}");
    print("Số trang: ${books[i]['soTrang']}\n");
  }
}
