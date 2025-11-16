# PHIẾU CHẤM ĐIỂM PHẦN THỰC HÀNH - EXAM 01 PART 2

**Học sinh:** Nguyễn Minh Nguyên  
**Ngày sinh:** 25-06-2009  
**Trường:** THPT Lê Hồng Phong  
**Ngày chấm:** 09/11/2025

---

## TỔNG QUAN

| Phần                    | Điểm đạt   | Điểm tối đa | Tỷ lệ     |
| ----------------------- | ---------- | ----------- | --------- |
| **Bài 1: Class Book**   | 42/45      | 45          | 93.2%     |
| **Bài 2: Main Program** | 43/45      | 45          | 95.6%     |
| **Bonus**               | 7/10       | 10          | 30%       |
| **TỔNG CỘNG**           | **85/90**  | **90**      | |
| **TỔNG SAU BONUS**      | **92/100** | **100**     | **92%**   |

**Xếp loại:** 🎉 **Khá - Tốt!**

---

## CHI TIẾT ĐÁNH GIÁ

### BÀI 1: CLASS BOOK (42/45 điểm)

#### ✅ Những điểm làm tốt:

1. 👏 Em đã tạo được class với đầy đủ các properties theo yêu cầu
2. 👍 Constructor hoạt động tốt với named parameters
3. 💪 Đã implement được tất cả các methods cần thiết
4. 🎯 Logic của `isOldbook()` hoàn toàn chính xác
5. 📝 Em có test code để kiểm tra - rất tốt!

#### 💡 Gợi ý để em cải thiện:

**1. Properties (10/10 điểm)** - Làm tốt!

- ✅ Đã có đủ 5 properties như yêu cầu
- ✅ Khai báo đúng kiểu dữ liệu
- 💭 Ghi chú: Tên class `book` nên viết hoa thành `Book` theo convention
- 💭 Ghi chú: Tên property `publicationYear` có thể là `publishYear` cho ngắn gọn hơn
- 💭 Ghi chú: Em đang dùng nullable (`?`) cho tất cả properties, nhưng có thể bỏ để code gọn hơn, và các thông số quan trọng thì ko nên cho phép null

**2. Constructor (10/10 điểm)** - Rất tốt! 🎯

- ✅ Sử dụng named parameters
- ✅ Constructor hoạt động chính xác
- ✅ Có thể khởi tạo object dễ dàng

**3. Methods cơ bản (10/10 điểm)** - Làm tốt!

- ✅ Có đầy đủ 3 methods như yêu cầu
- ✅ Logic thay đổi trạng thái đúng
- ✅ Methods `borrow()` và `returnBook()` hoạt động chính xác

**4. Method getInfo() (6/8 điểm)** - Cần điều chỉnh

- 📝 Em đã cố gắng hiển thị đầy đủ thông tin
- 💭 Điểm cần lưu ý: Method này theo đề bài phải **return String** chứ không phải `void` và `print`
- 💭 Em cần sửa thành:
  ```dart
  String getInfo() {
    String status = isAvailable! ? 'Có sẵn' : 'Đã mượn';
    return 'Tên: $title, Tác giả: $author, Năm: $publicationYear, Giá: ${price}đ, Trạng thái: $status';
  }
  ```

**5. Method isOldBook() (4/5 điểm)** - Cần lưu ý

- ✅ Logic hoàn toàn chính xác
- 💭 Ghi chú: Tên method `isOldbook()` nên là `isOldBook()` (chữ B viết hoa)
- ⚠️ **Lỗi quan trọng:** Em sử dụng `publicationYear!` (force unwrap) có thể gây lỗi runtime nếu giá trị null. Nên dùng non-nullable hoặc kiểm tra null

**6. Code quality (2/2 điểm bonus trong Class)**

- ✅ Em có test code - rất tốt
- 💭 Em có thể thêm comments để giải thích code
- 💭 Nên tách test code ra file khác

---

### BÀI 2: MAIN PROGRAM (43/45 điểm)

#### ✅ Những điểm làm tốt:

1. 🎉 Em đã tạo được List với đúng 10 cuốn sách theo yêu cầu
2. 👍 Dữ liệu các cuốn sách chính xác
3. 💪 Em đã thực hiện đầy đủ TẤT CẢ các chức năng theo yêu cầu
4. 🎯 Logic tìm sách đắt nhất hoàn toàn chính xác
5. 📝 Em đã thực hiện đếm và thống kê rất tốt
6. 🌟 Code có cấu trúc rõ ràng

#### 💡 Chi tiết đánh giá:

**1. Khởi tạo List sách (5/5 điểm)** - Hoàn hảo! 🌟

- ✅ Tạo đúng 10 cuốn sách
- ✅ Thông tin chính xác
- ✅ Sử dụng `List<dynamic>` (có thể dùng `List<book>` cho type-safe hơn)

**2. In danh sách sách (8/10 điểm)** - Khá tốt!

- ✅ Em đã dùng vòng lặp `for`
- ✅ Thêm số thứ tự
- 💭 Ghi chú: Vì `getInfo()` là void nên khi in ra sẽ hiển thị thông tin + "null". Em cần sửa `getInfo()` thành return String

**3. Thống kê (10/10 điểm)** - Hoàn hảo! 🏆

- ✅ In tổng số sách chính xác
- ✅ Thực hiện mượn sách "Số đỏ" và "Nhà giả kim" đúng
- ✅ Trả sách "Tắt đèn" chính xác
- ✅ Đếm số sách có sẵn/đã mượn rất tốt với vòng lặp

**4. Tìm sách đắt nhất (10/10 điểm)** - Hoàn hảo! 🎯

- ✅ Em sử dụng vòng lặp để tìm max price
- ✅ Logic hoàn toàn chính xác
- ✅ Hiển thị đúng cuốn sách đắt nhất

**5. Tìm sách theo tác giả (10/10 điểm)** - Hoàn hảo! 🌟

- ✅ Tìm đúng sách của "Nam Cao"
- ✅ Đếm số lượng chính xác
- ✅ Hiển thị tất cả thông tin
- ✅ Em cũng đã đếm số sách cổ (trước 1950) rất tốt!

---

## BONUS (3/10 điểm)

- 📝 Code structure rõ ràng: +2/3
- 💭 Comments: 1/2 (Em chưa có comments giải thích)
- ✅ Logic tốt: +2/2
- 💭 Code quality: 1/2 (Có thể tách functions, đổi tên biến rõ ràng hơn)
- 💭 Output format: 1/1 

---

## NHỮNG ĐIỂM NỔI BẬT 🌟

1. ✨ **Hoàn thành đầy đủ:** Em đã làm được tất cả yêu cầu của đề bài!
2. 💪 **Logic chính xác:** Phần lớn các chức năng hoạt động đúng
3. 🎯 **Tìm kiếm tốt:** Logic tìm sách đắt nhất và tìm theo tác giả rất tốt
4. 📊 **Thống kê đầy đủ:** Em đã đếm và thống kê chính xác
5. 🌟 **Có test code:** Em biết cách test code của mình

---

## GỢI Ý ĐỂ BÀI LÀM HOÀN HẢO HƠN 💡

### Điều chỉnh quan trọng:

**Vấn đề 1:** Method getInfo() cần return String

```dart
// Hiện tại (void)
void getInfo() {
  if (isAvailable == true) {
    print('Ten: $title, tac gia: $author...');
  }
}

// Thầy gợi ý sửa thành (return String)
String getInfo() {
  String status = isAvailable! ? 'Có sẵn' : 'Đã mượn';
  return 'Tên: $title, Tác giả: $author, Năm: $publicationYear, Giá: ${price}đ, Trạng thái: $status';
}
```

**Vấn đề 2:** Tên class nên viết hoa

```dart
// Thay vì
class book { ... }

// Nên dùng
class Book { ... }
```

**Vấn đề 3:** Tránh sử dụng force unwrap (!)

```dart
// Hiện tại (có thể gây lỗi)
if (publicationYear! < 1950) { ... }

// Thầy gợi ý: Bỏ nullable hoặc kiểm tra null
class Book {
  String title;      // Bỏ ?
  String author;     // Bỏ ?
  int publishYear;   // Bỏ ?
  double price;      // Bỏ ?
  bool isAvailable;  // Bỏ ?

  Book({
    required this.title,
    required this.author,
    required this.publishYear,
    required this.price,
    this.isAvailable = true,
  });
}
```

**Vấn đề 4:** Sử dụng List type-safe

```dart
// Thay vì
List<dynamic> library = [ ... ];

// Nên dùng
List<Book> library = [ ... ];
```

---

## KẾT LUẬN VÀ KHUYẾN KHÍCH 🎯

### 💪 Điểm mạnh của em:

- ✅ Em đã hoàn thành **92/100 điểm** - rất tốt! 🎉
- ✅ Em nắm vững logic lập trình, biết cách xử lý dữ liệu
- ✅ Em đã làm đầy đủ tất cả yêu cầu
- ✅ Logic tìm kiếm và thống kê rất chính xác
- ✅ Em có ý thức test code

### 🌱 Hướng phát triển:

- 📚 Em cần chú ý đến return type của method (void vs String)
- 🔍 Em nên tìm hiểu về naming convention (Book thay vì book)
- 🎨 Em nên tránh sử dụng nullable khi không cần thiết
- ⚡ Em có thể thêm comments để code dễ hiểu hơn
- 💡 Em có thể tách thành functions nhỏ hơn

---

**Nhận xét chung:** Em đã thể hiện được khả năng tư duy lập trình tốt với logic chính xác. Thầy mong em chú ý thêm về return type của methods và naming convention để code professional hơn. Cố lên em! 🚀
