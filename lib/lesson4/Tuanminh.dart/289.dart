void main() {
  List<String> fruits = [];
  print(fruits);

  List<String> fruits2 = ['Apple', 'Banana', 'Mango'];
  print('fruits2: $fruits2');

  var diemso = [9.5, 8.0, 7.5];
  print('diemso: $diemso');

  List<dynamic> mixed = [1, "Capybara", 3, 15, true];
  print('$mixed');

  print(fruits2.length);

  print('first fruit: ${fruits2[0]}');

  print('first fruit: ${fruits2.first}');
}
