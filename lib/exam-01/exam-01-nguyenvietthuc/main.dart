import '../exam-01-nguyenvietthuc/book.dart';

void main() {
  List<Book> book = [
    Book('Dế Mèn phiêu lưu ký', 'Tô Hoài', 1941, 45000, true),
    Book('Tắt đèn', 'Ngô Tất Tố', 1939, 52000, false),
    Book('Số đỏ', 'Vũ Trọng Phụng', 1936, 48000, true),
    Book('Chí Phèo', 'Nam Cao', 1941, 35000, true),
    Book('Lão Hạc', 'Nam Cao', 1943, 38000, false),
    Book('Nhà giả kim', 'Paulo Coelho', 1988, 89000, true),
    Book('Đắc nhân tâm', 'Dale Carnegie', 1936, 95000, false),
    Book('Tuổi trẻ đáng giá bao nhiêu', 'Rosie Nguyễn', 2018, 78000, true),
    Book('Cây cam ngọt của tôi', 'José Mauro de Vasconcelos', 1968, 105000,
        true),
    Book(
        'Sapiens - Lược sử loài người', 'Yuval Noah Harari', 2011, 198000, true)
  ];

  print("=== DANH SÁCH TẤT CẢ SÁCH ===");
  for (var b = 0; b < book.length; b++) {
    print("${b + 1}. ${book[b].getInfo()}");
  }

  print("");
  print("=== THỐNG KÊ THƯ VIỆN ===");
  print("Tổng số sách: ${book.length}");
  book[5].borrow();
  book[2].borrow();
  book[1].returnBook();
  int borrowedCount = 0;
  int availableCount = 0;
  for (var b in book) {
    if (b.isAvailable) {
      availableCount++;
    } else {
      borrowedCount++;
    }
  }
  print("Sách có sẵn: $availableCount");
  print("Sách đã mượn: $borrowedCount");

  print("");
  print("=== SÁCH ĐẮT NHẤT ===");
  int mostExpensiveIndex = 0;
  for (var b = 0; b < book.length; b++) {
    if (book[b].price > book[mostExpensiveIndex].price) {
      mostExpensiveIndex = b;
    }
  }
  print(book[mostExpensiveIndex].getInfo());

  print("");
  print("=== TÌM SÁCH CỦA TÁC GIẢ \"Nam Cao\" ===");
  int countNamCao = 0;
  int bookIndex = 1;
  for (var b in book) {
    if (b.author == "Nam Cao") {
      countNamCao++;
    }
  }
  print("Tìm thấy $countNamCao cuốn sách:");
  for (var b in book) {
    if (b.author == "Nam Cao") {
      print("${bookIndex++}. ${b.getInfo()}");
    }
  }

  int oldBookCount = 0;
  for (var b in book) {
    if (b.isOldBook()) {
      oldBookCount++;
    }
  }
  print("Số sách cổ (trước 1950): $oldBookCount");
}
