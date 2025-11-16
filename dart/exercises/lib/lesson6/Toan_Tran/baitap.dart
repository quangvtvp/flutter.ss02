void main() {
  List<Map<String, dynamic>> name = [
    {'name': 'Toàn', 'hobby': 'play gomoku'},
    {'name': 'Đức', 'hobby': 'Cầu lông'},
    {'name': 'Việt Anh', 'hobby': 'Nghe nhạc'},
  ];
  for (var hocsinh in name) {
    print('Tên: ${hocsinh['name']}, Sở thích: ${hocsinh['hobby']}');
  }
}
