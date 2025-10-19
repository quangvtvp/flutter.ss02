void main() {
  var listFriends = {
    'Thái': ['Chơi game', 'Bóng đá'],
    'Quang': ['Xem phim', 'Nghe nhạc'],
    'Minh': ['Đọc sách', 'Chạy bộ']
  };

  listFriends.forEach((name, hobbies) {
    print('Tên: $name, Sở thích: $hobbies');
  });
}
