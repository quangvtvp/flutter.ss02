void main() {
 
  Map<String, String> nguoi1 = {  'ten': 'Hoàng Anh Thái',
  'soThich': 'Nghe nhạc,xem phim,chơi game',
  };

  Map<String, String> nguoi2 = {
   'ten': 'Quang',
   'soThich': 'Nghe nhạc,xem phim,chơi game',
  };
  
  Map<String, String> nguoi3 = {
  'ten': 'Minh',
  'soThich': 'Nghe nhạc,xem phim,chơi game',
  };

  List<Map<String, String>> danhSach = [nguoi1, nguoi2, nguoi3];
  for (var nguoi in danhSach) {
   print('Tên: ${nguoi['ten']}, Sở thích: ${nguoi['soThich']}');
  }
}