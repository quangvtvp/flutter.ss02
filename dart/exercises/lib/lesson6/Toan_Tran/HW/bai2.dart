//Bài 2: Danh sách yêu thích.//
import 'dart:io';

void main() {
  List<String> favoriteSongs = [];
  print(" Hãy nhập 5 bài hát yêu thích của bạn:");
  for (int i = 1; i <= 5; i++) {
    stdout.write("Bài hát số $i: ");
    String? song = stdin.readLineSync();
    if (song == null || song.trim().isEmpty) {
      print("Bạn chưa nhập tên bài hát. Hãy nhập lại!");
      i--;
      continue;
    }
    favoriteSongs.add(song.trim());
  }
  favoriteSongs.sort();
  print("\n Danh sách bài hát yêu thích (đã sắp xếp theo alphabet):");
  for (var song in favoriteSongs) {
    print("- $song");
  }
  var longSongs = favoriteSongs.where((song) => song.length >= 10).toList();
  print("\n Các bài hát có tên dài >= 10 ký tự:");
  if (longSongs.isEmpty) {
    print("- Không có bài hát nào tên dài >= 10 ký tự.");
  } else {
    for (var song in longSongs) {
      print("- $song");
    }
  }
}
