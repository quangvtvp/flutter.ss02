void main() {
  var listFriends = [
    {
      'name': 'Thái',
      'hoppy': ['Chơi game', 'Bóng đá']
    },
    {
      'name': 'Quang',
      'hoppy': ['Xem phim', 'Nghe nhạc']
    },
    {
      'name': 'Minh',
      'hoppy': ['Đọc sách', 'Chạy bộ']
    }
  ];
  for (var friend in listFriends) {
    print('Tên: ${friend['name']}, Sở thích: ${friend['hoppy']}');
  }
}
