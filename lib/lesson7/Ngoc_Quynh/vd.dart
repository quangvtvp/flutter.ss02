void main() {
  var mapbooks = [
    {'book': ' A', 'Tacgia': 'a', 'mon': 'toan', 'sotrang': '100'},
    {'book': 'B', 'Tacgia': 'b', 'mon': 'li', 'sotrang': '111'},
    {'book': 'C ', 'Tacgia': 'c', 'mon': 'hoa', 'sotrang': '222'},
  ];
  for (int i = 0; i < mapbooks.length; i++) {
    print(
        '${i + 1}: ${mapbooks[i]['book']}, ${mapbooks[i]['Tacgia']}, ${mapbooks[i]['sotrang']}, ${mapbooks[i]['mon']}');
  }
}
