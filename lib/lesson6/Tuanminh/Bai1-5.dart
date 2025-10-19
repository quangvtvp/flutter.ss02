void main() {
  Map<String, double> chitieu = {
    "Ăn uống": 500000,
    "Đi lại": 200000,
    "Mua sắm": 300000,
    "Giải trí": 500000,
  };
  var tong = chitieu["Ăn uống"]! +
      chitieu["Đi lại"]! +
      chitieu["Mua sắm"]! +
      chitieu["Giải trí"]!;
  print("Tổng chi tiêu: $tong");
  var a = chitieu["Đi lại"];
  for (var key in chitieu.keys) {
    if (chitieu[key]! > a!) {
      a = chitieu[key];
    }
  }
  print("Khoản chi nhiều nhất là : $a");
}
