void main() {
  var mapsach = [
    {
      'tác giả': 'Nguyễn Văn A',
      'môn học': 'Văn học',
      'tên sách': 'Văn học 11',
      'số trang': '300'
    },
    {
      'tác giả': 'Trần Thị B',
      'môn học': 'Toán học',
      'tên sách': 'Toán 12',
      'số trang': '250'
    },
    {
      'tác giả': 'Lê Văn C',
      'môn học': 'Vật lý',
      'tên sách': 'Vật lý 10',
      'số trang': '200'
    },
    {
      'tác giả': 'Phạm Thị D',
      'môn học': 'Hóa học',
      'tên sách': 'Hóa học 11',
      'số trang': '220'
    }
  ];
  for (int i = 0; i < mapsach.length; i++) {
    print(
        'Tác giả : ${mapsach[i]['tác giả']}, Môn học : ${mapsach[i]['môn học']}, Tên sách : ${mapsach[i]['tên sách']}, Số trang : ${mapsach[i]['số trang']}');
  }
}
