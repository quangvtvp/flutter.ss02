
void main() {
  List<String> Songs = [
    'Noinaycoanh',
    'Chungtakhongthuocvenhau',
    'Lactroi',
    'Duongtoichoemve',
    'Ngaynaynamay'
  ];
  Songs.sort();

  var longSongs = Songs.where((song) => song.length >= 10);

  print('Danh sách sau khi sắp xếp:');
  print(Songs);

  print('\nCác bài hát có tên dài >= 10 ký tự:');
  print(longSongs.toList());
}
