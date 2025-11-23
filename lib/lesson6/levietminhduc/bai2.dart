void main () {
  print('Xin chào bạn!');
  print('Chào mừng đến với danh sách nhạc yêu thích của tôi!');
  List<String> favoriteSongs = [
    'Bài 1: 有何不可  ',
    'Bài 2: 起风了',
    'Bài 3: 追光者',
    'Bài 4: 刚好遇见你',
    'Bài 5: Nơi này có anh',
  ];
  print('Sắp xếp theo thứ tự alphabet:');
  favoriteSongs.sort();
  for (var song in favoriteSongs) {
    print(song);
  }
  print('Các bài hát có tên dài hơn 10 ký tự:');
  var longTitleSongs = favoriteSongs.where((song) => song.substring(6).length > 10);
  for (var song in longTitleSongs) {
    print(song);
  }
}