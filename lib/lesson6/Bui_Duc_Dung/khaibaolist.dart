void main() {
  List<String> MyFavouriteDrink = ['Trà đào 4 mùa', 'Matcha Latte', 'Xyanua'];
  print('First Drink: ${MyFavouriteDrink[0]}');
  MyFavouriteDrink.add('Juice');
  print('Summarize: ${MyFavouriteDrink.length}');

  MyFavouriteDrink.removeAt(1);
  MyFavouriteDrink[1] = 'Soda Chanh';
  print('Danh sách cuổi cùng: $MyFavouriteDrink');
}
