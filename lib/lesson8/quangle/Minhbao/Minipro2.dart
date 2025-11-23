//Bài 2: Class Book (Getter/Setter)
//Thuộc tính: title, author, _year (private), _price (private)
//Getter/Setter: year (kiểm tra > 1900), price (kiểm tra > 0)
//Getter: ageOfBook (năm hiện tại - năm xuất bản)
//Phương thức: displayInfo()

class Book {
  String title, author;
  int _year;
  double _price;

  Book(this.title, this.author, this._year, this._price);

  int get year => _year;
  set year(int _year) {
    if (_year > 1900) {
      _year = _year;
    } else {
      print('Năm sản xuất không hợp lệ (>1900)');
      return;
    }
  }

  double get price => _price;

  set price(double _price) {
    if (_price > 0) {
      _price = _price;
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
