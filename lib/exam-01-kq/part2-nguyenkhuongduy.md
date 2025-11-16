# PHIẾU CHẤM ĐIỂM PHẦN THỰC HÀNH - EXAM 01 PART 2

**Học sinh:** Nguyễn Khương Duy  
**Ngày sinh:** 08-09-2009  
**Trường:** THPT Sông Công  
**Ngày chấm:** 09/11/2025

---

## TỔNG QUAN

| Phần                    | Điểm đạt   | Điểm tối đa | Tỷ lệ     |
| ----------------------- | ---------- | ----------- | --------- |
| **Bài 1: Class Book**   | 40/45      | 45          | 88.9%     |
| **Bài 2: Main Program** | 15/45      | 45          | 33.3%     |
| **Bonus**               | 1/10       | 10          | 10%       |
| **TỔNG CỘNG**           | **44/90**  | **90**      | **48.9%** |
| **TỔNG SAU BONUS**      | **45/100** | **100**     | **45%**   |

**Xếp loại:** 📝 **Cần cố gắng thêm**

---

## CHI TIẾT ĐÁNH GIÁ

### BÀI 1: CLASS BOOK (29/45 điểm)

#### ✅ Những điểm làm tốt:

1. 👏 Em đã tạo được class Book với đầy đủ các properties theo yêu cầu
2. 👍 Constructor hoạt động tốt với positional parameters
3. 💪 Đã implement được tất cả các methods cần thiết
4. 🎯 Logic của `isOldBook()` hoàn toàn chính xác
5. 📝 Em có thêm validation trong methods `borrow()` và `returnBook()` - rất tốt!

#### 💡 Gợi ý để em cải thiện:

**1. Properties (10/10 điểm)** - Hoàn hảo! 🌟

- ✅ Đã có đủ 5 properties như yêu cầu
- ✅ Khai báo đúng kiểu dữ liệu
- ✅ Tên properties theo đúng convention

**2. Constructor (10/10 điểm)** - Xuất sắc! 🎯

- ✅ Sử dụng positional parameters đúng như yêu cầu
- ✅ Constructor hoạt động hoàn hảo
- ✅ Có thể khởi tạo object dễ dàng

**3. Methods cơ bản (7/10 điểm)** - Khá tốt!

- ✅ Có đầy đủ 3 methods như yêu cầu
- ✅ Logic thay đổi trạng thái đúng
- ✅ Em có thêm validation - rất tốt!
- 💭 Ghi chú nhỏ: Đề bài không yêu cầu print trong methods, nhưng không sao

**4. Method getInfo() (6/8 điểm)** - Cần điều chỉnh

- 📝 Em đã cố gắng hiển thị đầy đủ thông tin
- 💭 Điểm cần lưu ý: Method này theo đề bài phải **return String** chứ không phải `void` và `print`
- 💭 Em cần sửa thành:
  ```dart
  String getInfo() {
    String status = isAvailable ? 'Có sẵn' : 'Đã mượn';
    return 'Tên: $title, Tác giả: $author, Năm: $publishYear, Giá: ${price}đ, Trạng thái: $status';
  }
  ```
- 💭 Lưu ý: Em đang in `$isAvailable` (true/false) thay vì "Có sẵn"/"Đã mượn"

**5. Method isOldBook() (5/5 điểm)**

- ✅ Logic hoàn toàn chính xác
- ✅ Return type đúng
- ✅ Hoạt động tốt

**6. Code quality (2/2 điểm bonus trong Class)**

- ✅ Code có cấu trúc tốt
- 💭 Em có thể thêm comments để giải thích code

---

### BÀI 2: MAIN PROGRAM (15/45 điểm)

#### ✅ Những điểm làm tốt:

1. 🎉 Em đã tạo được List<Book> với đúng 10 cuốn sách theo yêu cầu
2. 👍 Dữ liệu các cuốn sách hoàn toàn chính xác
3. 💪 Em đã biết cách sử dụng vòng lặp
4. 🎯 Em đã thực hiện mượn và trả sách

#### 💡 Gợi ý để em hoàn thiện:

**1. Khởi tạo List sách (5/5 điểm)** - Hoàn hảo! 🌟

- ✅ Tạo đúng 10 cuốn sách
- ✅ Thông tin hoàn toàn chính xác
- ✅ Có thể dùng `List<Book>` thay vì `List` cho type-safe hơn

**2. In danh sách sách (3/10 điểm)** - Cần cải thiện

- 💭 **Lỗi quan trọng:** Em dùng `for (var i = 1; i < boook; i++)` - bắt đầu từ 1 nên thiếu sách đầu tiên (index 0)
- 💭 Thầy gợi ý sửa thành: `for (var i = 0; i < books.length; i++)`
- ✅ Em có in số thứ tự - tốt lắm!

**3. Thống kê (5/10 điểm)** - Cần điều chỉnh

- 💭 **Lỗi logic nghiêm trọng:** Dòng `if (books[i].isAvailable = true) ;`
  - Em đang dùng `=` (gán) thay vì `==` (so sánh)
  - Có dấu `;` ngay sau if nên code bên trong không chạy đúng
  - Kết quả: `tongsach` luôn bằng 10 (sai)
- ✅ Em đã mượn 2 sách và trả 1 sách đúng
- 💭 Thiếu: In số sách có sẵn và số sách đã mượn

**4. Tìm sách đắt nhất (0/10 điểm)** - Chưa hoàn thành

- 💭 Em có code tìm giá nhưng logic chưa đúng:
  - `if (books[i].price > i)` - đang so sánh price với index i (sai)
  - Biến `price` được khai báo trong vòng lặp nên reset mỗi lần
  - Chưa in ra sách đắt nhất
- 💭 Thầy gợi ý:
  ```dart
  int maxPrice = books[0].price;
  int maxIndex = 0;
  for (var i = 1; i < books.length; i++) {
    if (books[i].price > maxPrice) {
      maxPrice = books[i].price;
      maxIndex = i;
    }
  }
  print('Sách đắt nhất: ${books[maxIndex].title} - Giá: $maxPrice đ');
  ```

**5. Tìm sách theo tác giả (0/10 điểm)** - Phần này em chưa làm

- 💭 Em chưa tìm sách của "Nam Cao"
- 💭 Em chưa đếm số sách cổ (trước 1950)
- 💭 Thầy gợi ý:

  ```dart
  print('=== SÁCH CỦA NAM CAO ===');
  for (var book in books) {
    if (book.author == 'Nam Cao') {
      print(book.getInfo());
    }
  }

  print('=== SÁCH CỔ (TRƯỚC 1950) ===');
  int oldCount = 0;
  for (var book in books) {
    if (book.isOldBook()) {
      oldCount++;
    }
  }
  print('Số sách cổ: $oldCount');
  ```

---

## BONUS (1/10 điểm)

- 📝 Code structure: +1/3 (Em có cấu trúc nhưng chưa hoàn chỉnh)
- 💭 Comments: 0/2 (Em chưa có comments)
- 💭 Logic: 0/2 (Có một số lỗi logic)
- 💭 Code quality: 0/2 (Cần cải thiện)
- 💭 Output format: 0/1 (Chưa format đẹp)

---

## NHỮNG ĐIỂM NỔI BẬT 🌟

1. ✨ **Khởi tạo tốt:** Em đã tạo được 10 cuốn sách đúng thông tin
2. 💪 **Có ý thức validation:** Em thêm kiểm tra trong borrow/returnBook
3. 🎯 **Class Book tốt:** Em làm được phần class khá ổn
4. 📝 **Có cố gắng:** Em đã cố gắng làm tất cả các phần

---

## GỢI Ý ĐỂ BÀI LÀM HOÀN HẢO HƠN 💡

### Các lỗi cần sửa ngay:

**Lỗi 1:** Vòng lặp in danh sách thiếu sách đầu tiên

```dart
// Hiện tại (SAI - thiếu sách đầu)
for (var i = 1; i < boook; i++) {
  print(i);
  books[i].getInfo();
}

// Thầy gợi ý sửa
for (var i = 0; i < books.length; i++) {
  print('${i + 1}. ${books[i].getInfo()}');
}
```

**Lỗi 2:** Đếm sách có sẵn sai logic

```dart
// Hiện tại (SAI - dùng = thay vì ==)
for (var i = 0; i < boook; i++) {
  if (books[i].isAvailable = true) ;  // ❌ Dấu ; và dùng =
  tongsach++;
}

// Thầy gợi ý sửa
int available = 0;
for (var i = 0; i < books.length; i++) {
  if (books[i].isAvailable == true) {  // ✅ Dùng ==
    available++;
  }
}
print('Số sách có sẵn: $available');
print('Số sách đã mượn: ${books.length - available}');
```

**Lỗi 3:** Logic tìm sách đắt nhất

```dart
// Code hiện tại không hoạt động đúng
// Thầy gợi ý viết lại hoàn toàn
int maxPrice = books[0].price;
int maxIndex = 0;
for (var i = 1; i < books.length; i++) {
  if (books[i].price > maxPrice) {
    maxPrice = books[i].price;
    maxIndex = i;
  }
}
print('=== SÁCH ĐẮT NHẤT ===');
print('${books[maxIndex].title} - Giá: $maxPrice đ');
```

---

## KẾT LUẬN VÀ KHUYẾN KHÍCH 🎯

### 💪 Điểm mạnh của em:

- ✅ Em đã khởi tạo dữ liệu chính xác 100%
- ✅ Em nắm được cơ bản về class, object, list
- ✅ Em biết cách sử dụng vòng lặp
- ✅ Em có validation trong methods - rất tốt!

### 🌱 Hướng phát triển:

- 📚 Em cần chú ý đến chi tiết: `=` vs `==`, vòng lặp bắt đầu từ 0
- 🔍 Em cần hoàn thiện các phần còn thiếu (tìm sách đắt nhất, tìm theo tác giả)
- 🎨 Em cần sửa method `getInfo()` thành return String
- ⚡ Em nên thêm comments để giải thích code
- 💡 Em nên review code cẩn thận trước khi submit

---

**Nhận xét chung:** Em đã có nền tảng tốt về OOP và biết cách khởi tạo dữ liệu chính xác. Tuy nhiên em cần chú ý hơn đến các chi tiết logic (`=` vs `==`, index vòng lặp) và hoàn thiện đủ tất cả yêu cầu của đề bài. Với sự cố gắng thêm một chút, em sẽ tiến bộ rất nhanh! 💪
