import 'dart:io';

class BOOK {
  String? title;
  String? author;
  int? PublicationYear;
  double? price;
  bool? isAvailable;
  BOOK(this.title, this.author, this.PublicationYear, this.price,
      {this.isAvailable = true});
  // mượn sách
  void borrow() {
    if (isAvailable == true) {
      print('sách $title đang có sẵn, bạn có thể mượn');
      isAvailable = false;
    } else {
      print('xin lỗi ,sách $title đã có người mượn.');
    }
  }

  // trả sách
  void returnBook() {
    if (isAvailable == false) {
      print('sách đã có sẵn $title');
      isAvailable = true;
    } else {
      print('sách $title không thuộc về thư viện chúng tôi.');
    }
  }

  // hiển thị thông tin sách
  void getInfo() {
    print('tên sách: $title');
    print('tác giả: $author');
    print('năm xuất bản: $PublicationYear');
    print('giá: $price nghìn đông');
    print('tình trạng: ${isAvailable == true ? "còn sách" : "hết sách"}');
  }

  // kiểm tra sách cũ
  bool isOldBook() {
    if (PublicationYear == null || PublicationYear! <= 0) {
      print("Năm xuất bản không hợp lệ!");
      return false;
    } else if (PublicationYear! < 1950) {
      return true;
    } else {
      return false;
    }
  }
}

void main() {
  var book1 = BOOK('dế mèn phiêu lưu ký', 'tô hoài', 1941, 50);
  book1.getInfo();

  // Hỏi người dùng có muốn mượn sách không
  stdout.write(" Bạn có muốn mượn cuốn sách này không? (co/khong): ");
  String? choice = stdin.readLineSync();

  if (choice?.toLowerCase() == 'co') {
    book1.borrow();
    print(" Bạn đã mượn cuốn sách.");
  } else {
    print(" Bạn đã không mượn cuốn sách.");
  }

  // Hỏi người dùng có muốn trả lại sách không
  if (book1.isAvailable == false) {
    stdout.write(" Bạn có muốn trả lại cuốn sách không? (co/khong): ");
    String? returnChoice = stdin.readLineSync();

    if (returnChoice?.toLowerCase() == 'co') {
      book1.returnBook();
      print(" Bạn đã trả lại cuốn sách.");
    } else {
      print(" Bạn vẫn đang giữ cuốn sách.");
    }
  }
  print("--- Trạng thái cuối cùng ---");
  book1.getInfo();
  if (book1.isOldBook() == true) {
    print('sách ${book1.title} là sách cũ vì xuất bản trước năm 1950');
  } else {
    print('sách ${book1.title} không phải sách cũ vì xuất bản sau năm 1950');
  }
}
