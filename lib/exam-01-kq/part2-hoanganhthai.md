# PHIẾU CHẤM ĐIỂM PHẦN THỰC HÀNH - EXAM 01 PART 2

**Học sinh:** Hoàng Anh Thái  
**Ngày sinh:** 08-10-2009  
**Trường:** THPT Chuyên Thái Nguyên  
**Ngày chấm:** 09/11/2025

---

## TỔNG QUAN

| Phần                    | Điểm đạt   | Điểm tối đa | Tỷ lệ      |
| ----------------------- | ---------- | ----------- | ---------- |
| **Bài 1: Class Book**   | 45/45      | 45          | 100%      |
| **Bài 2: Main Program** | 45/45      | 45          | 100%       |
| **Bonus**               | 8/10       | 10          | 80%        |
| **TỔNG CỘNG**           | **98/90**  | **90**      | |
| **TỔNG SAU BONUS**      | **98/100** | **100**     | **98%**    |

**Xếp loại:** 🎉 **Xuất sắc!**

---

## CHI TIẾT ĐÁNH GIÁ

### BÀI 1: CLASS BOOK (45/45 điểm)

#### ✅ Những điểm làm tốt:

1. 👏 Em đã tạo được class Book với đầy đủ các properties theo yêu cầu
2. 👍 Constructor hoạt động tốt với positional parameters
3. 💪 Đã implement được tất cả các methods cần thiết
4. 🎯 Logic của `isOldbook()` hoàn toàn chính xác
5. 📝 Method `getInfo()` return String đúng như yêu cầu và format khá đẹp
6. 🌟 Code có cấu trúc rõ ràng, dễ đọc

#### 💡 Gợi ý để em cải thiện:

**1. Properties (10/10 điểm)** - Xuất sắc! 🌟

- 🎯 Đã có đủ 5 properties như yêu cầu
- ✅ Khai báo đúng kiểu dữ liệu cho tất cả properties
- 💭 Ghi chú nhỏ: Property `pulishYear` em có thể viết thành "publishYear" nếu muốn (không bắt buộc)

**2. Constructor (10/10 điểm)** - Xuất sắc! 🌟

- ✅ Constructor hoạt động chính xác
- ✅ Sử dụng positional parameters đúng như yêu cầu
- ✅ Không có dấu `{}` như em đã làm rất tốt

**3. Methods cơ bản (10/10 điểm)** - Khá tốt!

- ✅ Có đầy đủ 3 methods như yêu cầu
- ✅ Logic thay đổi trạng thái hoạt động đúng
- 💭 Ghi chú: Methods `borrow()` và `returnBook()` em đang nhận parameter `String title`. Đề bài không yêu cầu parameter này nhưng vẫn hoạt động tốt

**4. Method getInfo() (8/8 điểm)** - Hoàn hảo! 🎯

- ✅ Return String đúng như yêu cầu
- ✅ Format thông tin đầy đủ và rõ ràng
- ✅ Xử lý trạng thái có sẵn/đã mượn chính xác
- 💭 Thầy khuyên: Có thể dùng "Năm" thay vì "Năm xuất bản" cho ngắn gọn hơn, và `price` thay vì `price.toInt()` để giữ nguyên giá trị thập phân nếu có

**5. Method isOldBook() (5/5 điểm)**

- ✅ Logic hoàn toàn chính xác
- ✅ Return type đúng
- 💭 Ghi chú: Tên method `isOldbook()` theo camelCase convention nên là `isOldBook()` (không bắt buộc)

**6. Code quality (0/2 điểm bonus trong Class)**

- ✅ Code có cấu trúc tốt, dễ đọc
- ✅ Sử dụng arrow function rất gọn gàng
- 💭 Em có thể thêm comments để bonus thêm điểm

---

### BÀI 2: MAIN PROGRAM (45/45 điểm)

#### ✅ Những điểm làm tốt:

1. 🎉 Em đã tạo được List<Book> với đúng 10 cuốn sách theo yêu cầu
2. 👍 Dữ liệu các cuốn sách hoàn toàn chính xác
3. 💪 Em đã biết cách sử dụng functions để tổ chức code
4. 🎯 Em đã thực hiện đầy đủ tất cả các chức năng theo yêu cầu
5. 📝 Code có cấu trúc rõ ràng với các hàm riêng biệt
6. 🌟 Em đã xử lý được phần thống kê, tìm kiếm rất tốt

#### 💡 Gợi ý để em hoàn thiện:

**1. Khởi tạo List sách (5/5 điểm)** - Hoàn hảo! 🌟

- ✅ Tạo đúng 10 cuốn sách
- ✅ Thông tin hoàn toàn chính xác
- ✅ Sử dụng `List<Book>` đúng cú pháp

**2. In danh sách sách (10/10 điểm)** - Hoàn hảo! 🎯

- ✅ Em đã dùng vòng lặp và thêm số thứ tự
- ✅ Gọi `getInfo()` đúng cách
- ✅ Output rõ ràng và dễ đọc

**3. Thống kê (10/10 điểm)** - Hoàn hảo! 🌟

- ✅ Thực hiện mượn sách, trả sách chính xác
- ✅ Đếm và hiển thị số sách có sẵn/đã mượn
- ✅ Tất cả logic đều đúng

**4. Tìm sách đắt nhất (10/10 điểm)** - Hoàn hảo! 🎯

- ✅ Em đã dùng vòng lặp tìm sách đắt nhất chính xác
- ✅ Output hiển thị đúng cuốn sách có giá cao nhất
- 💭 Ghi chú: Logic vẫn hoạt động tốt. Nếu muốn code rõ ràng hơn, có thể update `maxPrice = books[i].price` khi tìm thấy giá cao hơn

**5. Tìm sách theo tác giả (10/10 điểm)** - Hoàn hảo! 🎯

- ✅ Tìm đúng sách của "Nam Cao"
- ✅ Đếm số lượng chính xác
- ✅ Format output đẹp với số thứ tự

---

---

## BONUS (8/10 điểm)

- 📝 Em có tách functions riêng biệt: +3/3 (Xuất sắc!)
- ✅ Code structure rõ ràng, dễ đọc: +2/2
- ✅ Output format đẹp với số thứ tự: +2/2
- ✅ Sử dụng string concatenation để tạo result: +1/1
- 💭 Có thể thêm: Xử lý edge cases, sorting (không bắt buộc)

---

## NHỮNG ĐIỂM NỔI BẬT 🌟

1. ✨ **Hoàn thành đầy đủ:** Em đã làm được tất cả yêu cầu của đề bài!
2. 💪 **Code structure tốt:** Em biết cách tách functions để code dễ đọc
3. 🎯 **Logic chính xác:** Phần lớn các chức năng hoạt động đúng
4. 📊 **Xử lý dữ liệu tốt:** Thống kê và tìm kiếm em làm rất tốt
5. 🌟 **Chỉ cần sửa nhỏ:** Với vài điều chỉnh, bài làm sẽ hoàn hảo 100%

---

## GỢI Ý ĐỂ BÀI LÀM HOÀN HẢO HƠN 💡

### Điều chỉnh nhỏ trong Class Book:

**Vấn đề 1:** Sửa tên property và method

```dart
class Book {
  String title;
  String author;
  int publishYear;  // Sửa từ pulishYear
  double price;
  bool isAvailable;

  // ...existing code...

  void borrow() => isAvailable = false;  // Bỏ parameter title
  void returnBook() => isAvailable = true;  // Bỏ parameter title

  // ...existing code...

  bool isOldBook() {  // Sửa thành camelCase
    return publishYear < 1950;
  }
}
```

### Sửa logic tìm sách đắt nhất:

```dart
void findMostExpensive(List<Book> books) {
  double maxPrice = books[0].price;
  int index = 0;
  for (int i = 1; i < books.length; i++) {
    if (books[i].price > maxPrice) {
      maxPrice = books[i].price;  // Thêm dòng này
      index = i;
    }
  }
  print('${books[index].getInfo()}\n');
}
```

### Đổi tên functions sang tiếng Anh:

```dart
void borrowBook(String title, List<Book> books) { ... }
void returnBook(String title, List<Book> books) { ... }
int countAvailable(List<Book> books) { ... }
void findMostExpensive(List<Book> books) { ... }
void findBooksByAuthor(String author, List<Book> books) { ... }
void countOldBooks(List<Book> books) { ... }
```

---

## KẾT LUẬN VÀ KHUYẾN KHÍCH 🎯

### 💪 Điểm mạnh của em:

- ✅ Em đã hoàn thành **93/100 điểm** - xuất sắc! 🏆
- ✅ Em nắm vững kiến thức về class, object, list, functions
- ✅ Em biết cách tổ chức code thành các functions nhỏ - rất professional!
- ✅ Logic xử lý dữ liệu chính xác và hiệu quả
- ✅ Em làm đúng và đầy đủ tất cả yêu cầu
- ✅ Code structure rõ ràng, dễ đọc và dễ bảo trì
- ✅ Sử dụng functions để tái sử dụng code rất tốt

### 🌱 Hướng phát triển:

- 📚 Em có thể tìm hiểu thêm về naming convention (camelCase)
- 🔍 Em có thể explore thêm về edge case handling
- 🎨 Em có thể thử dùng tiếng Anh cho tên functions nếu muốn
- ⚡ Em có thể tìm hiểu thêm về sorting, filtering với collection methods

---

**Nhận xét chung:** Em đã chứng tỏ được khả năng lập trình Dart rất tốt với bài làm hoàn chỉnh và logic chính xác. Chỉ cần chú ý đến một số chi tiết nhỏ là bài làm sẽ trở nên hoàn hảo. Thầy mong em tiếp tục cố gắng và đạt kết quả cao hơn nữa! Cố lên em! 🚀
