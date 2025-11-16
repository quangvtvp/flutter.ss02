void main() {
  // Tạo danh sách 5 bài hát yêu thích
  List<String> songs = [
    'Anh nhớ em',
    'Đếm ngày xa em',
    'Lạc trôi',
    'Nàng thơ',
    'Chúng ta của hiện tại'
  ];

  print('=== DANH SÁCH BÀI HÁT YÊU THÍCH ===');
  for (var song in songs) {
    print(song);
  }

  // Sắp xếp theo thứ tự alphabet
  songs.sort();
  print('\n=== SAU KHI SẮP XẾP ALPHABET ===');
  for (var song in songs) {
    print(song);
  }

  // Lọc các bài hát có tên dài >= 10 ký tự
  List<String> longSongs = songs.where((song) => song.length >= 10).toList();

  print('\n=== BÀI HÁT CÓ TÊN DÀI >= 10 KÝ TỰ ===');
  if (longSongs.isEmpty) {
    print('Không có bài hát nào tên dài.');
  } else {
    for (var song in longSongs) {
      print(song);
    }
  }
}
