void main() {
  List<String> baihat = [
    "Hãy trao cho anh",
    "Ca kỹ",
    "Lệch",
    "Gặp lại nhau khi mùa hoa nở nhé",
    "Nhắm mắt thấy mùa hè"
  ];
  List<String> list = [];
  for (var i = 0; i < baihat.length; i++) {
    var list1 = baihat[i].split(" ");
    var list2 = list1.join();
    if (list2.length > 10) {
      list.add(baihat[i]);
    }
  }
  print(list);
}
