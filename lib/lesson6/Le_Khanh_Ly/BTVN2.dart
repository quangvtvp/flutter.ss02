void main() {
  List<String> favoriteSongs = [
    'Enchanted',
    'Attention',
    'We don\'t talk anymore',
    'Blank space',
    'Bad blood',
  ];
  favoriteSongs.sort();
  print('Danh sách bài hát sau khi sắp xếp: $favoriteSongs');
  List<String> longSongs =
      favoriteSongs.where((song) => song.length > 10).toList();
  print('Danh sách bài hát dài hơn 10 ký tự: $longSongs');
}
