void main() {
  Map<String, String> Info = {
    "Thức": "Chơi game, xem phim, đọc sách",
    "Hiếu": "Chơi game, chơi thể thao, học bài",
    "Bằng": "Đọc sách, nghe nhạc, học bài"
  };
  for (String key in Info.keys) {
    print("Sở thích của $key là: ${Info[key]}");
  }
}
