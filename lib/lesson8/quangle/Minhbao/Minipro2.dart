//Bài 2: Class Book (Getter/Setter)
//Thuộc tính: title, author, _year (private), _price (private)
//Getter/Setter: year (kiểm tra > 1900), price (kiểm tra > 0)
//Getter: ageOfBook (năm hiện tại - năm xuất bản)
//Phương thức: displayInfo()

class Book {
  String title, author;
  final int _year;
  final double _price;

  Book(this.title, this.author, this._year, this._price);

  int get year => _year;
  set year(int year) {
    if (year > 1900) {
      year = year;
    } else {
      print('Năm sản xuất không hợp lệ (>1900)');
      return;
    }
  }

  double get price => _price;

  set price(double price) {
    if (price > 0) {
      price = price;
    } else {
      print('Giá không hợp lệ (>0)');
      return;
    }
  }

  int get ageOfBook => 2025 - _year;

  void displayInfo() {
    print('Tiêu đề: $title');
    print('Tác giả: $author');
    print('Năm xuất bản: $_year');
    print('Giá: $_price VNĐ');
    print('Tuổi sách: $ageOfBook năm');
  }
}

void main() {
  Book book = Book('Yêu những điều không hoàn hảo', 'Hae Min', 2023, 140000);

  print('_______Thông tin sách_______');
  book.displayInfo();
  book.year = -2023; //muốn gắn lại năm, setter sẽ kiểm tra và gắn có điều kiện
  book.price = 140.000; //muốn gắn lại giá, setter sẽ kiểm tra và gắn có điều kiện
}
