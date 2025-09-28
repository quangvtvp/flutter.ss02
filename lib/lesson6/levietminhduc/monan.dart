void main() {
  List<String> food = ['Gâu gâu', 'Bánh mì', 'Gạo luộc', 'Dưa hấu', 'Bánh cuốn'];
    print('thức ăn là $food');
    print('Món ăn dầu tiên là ${food[0]}');
    food.add('Phở bò');
    print('Danh sách món ăn sau khi thêm là $food');
    dynamic n = food.length;
    print('số lượng món ăn là $n');
}