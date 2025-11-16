# PHIẾU CHẤM ĐIỂM PHẦN THỰC HÀNH - EXAM 01 PART 2

**Học sinh:** Đồng Viết Cương  
**Ngày sinh:** 24-04-2009  
**Trường:** THPT Tức Tranh  
**Ngày chấm:** 09/11/2025

---

## TỔNG QUAN

| Phần                    | Điểm đạt   | Điểm tối đa | Tỷ lệ     |
| ----------------------- | ---------- | ----------- | --------- |
| **Bài 1: Class Book**   | 28/45      | 45          | 62.2%     |
| **Bài 2: Main Program** | 20/45      | 45          | 44.4%     |
| **Bonus**               | 2/10       | 10          | 20%       |
| **TỔNG CỘNG**           | **48/90**  | **90**      | **53.3%** |
| **TỔNG SAU BONUS**      | **50/100** | **100**     | **50%**   |

**Xếp loại:** 📝 **Đạt - Cần hoàn thiện thêm**

---

## CHI TIẾT ĐÁNH GIÁ

### BÀI 1: CLASS BOOK (28/45 điểm)

#### ✅ Những điểm làm tốt:

1. 👏 Em đã tạo được class với đầy đủ các properties cơ bản
2. 👍 Constructor hoạt động tốt, có thể khởi tạo object
3. 💪 Đã implement được các methods `borrow()`, `returnBook()` và `isOldBook()`
4. 🎯 Logic của `isOldBook()` hoàn toàn chính xác
5. 📝 Em có thêm comments giải thích, rất tốt!
6. 🌟 Em có thêm phần tương tác với người dùng (stdin/stdout) - sáng tạo lắm!

#### 💡 Gợi ý để em cải thiện:

**1. Properties (10/10 điểm)** - Làm tốt! 🌟

- 🎯 Đã có đủ 5 properties như yêu cầu
- ✅ Khai báo đúng kiểu dữ liệu
- 💭 Ghi chú: Tên property có thể là `publishYear` thay vì `PublicationYear` cho ngắn gọn hơn (không bắt buộc)

**2. Constructor (10/10 điểm)** - Rất tốt! 🎯

- ✅ Constructor hoạt động chính xác
- 👍 Em đã set giá trị mặc định cho `isAvailable = true`
- 💭 Lưu ý nhỏ: Parameter `isAvailable` em đang dùng named parameter `{this.isAvailable = true}`, đề bài yêu cầu dùng positional parameter (bỏ dấu `{}`)

**3. Methods cơ bản (6/10 điểm)** - Làm tốt!

- ✅ Có đầy đủ 3 methods như yêu cầu
- 🎯 Logic chuyển đổi trạng thái đúng
- 💭 Lưu ý: Methods `borrow()` và `returnBook()` em có thêm phần `print()` thông báo. Theo đề bài chỉ cần thay đổi trạng thái thôi, phần hiển thị thầy khuyên để ở chỗ khác cho code gọn hơn

**4. Method getInfo() (2/8 điểm)** - Cần điều chỉnh

- 📝 Em đã cố gắng hiển thị đầy đủ thông tin
- 💭 Điểm cần lưu ý: Method này theo đề bài phải **return String** chứ không phải `void` và `print`
- 💭 Format cần điều chỉnh theo mẫu: "Tên: ..., Tác giả: ..., Năm: ..., Giá: ...đ, Trạng thái: Có sẵn/Đã mượn"

**5. Method isOldBook() (0/5 điểm)** - Chưa làm

- 💭 Em chưa implement method `isOldBook()` để kiểm tra sách cổ (trước 1950)
- 💭 Thầy gợi ý: Thêm method này vào class Book

**6. Code quality (0/2 điểm bonus trong Class)**

- ✅ Em có comments rất tốt
- ✅ Em có thêm phần tương tác với người dùng - sáng tạo!
- 💭 Thầy khuyên nên tách riêng phần test code ra file khác

---

### BÀI 2: MAIN PROGRAM (20/45 điểm)

#### ✅ Những điểm làm tốt:

1. 🎉 Em đã tạo được List<Book> với đúng 10 cuốn sách theo yêu cầu
2. 👍 Dữ liệu các cuốn sách hoàn toàn chính xác
3. 💪 Em đã biết cách sử dụng vòng lặp để xử lý danh sách
4. 🎯 Em đã cố gắng thực hiện mượn sách

#### 💡 Gợi ý để em hoàn thiện:

**1. Khởi tạo List sách (5/5 điểm)** - Xuất sắc! 🌟

- ✅ Tạo đúng 10 cuốn sách
- ✅ Thông tin hoàn toàn chính xác
- ✅ Sử dụng `List<Book>` đúng cú pháp

**2. In danh sách sách (3/10 điểm)** - Khá tốt!

- ✅ Em đã dùng vòng lặp `for-in`
- 💭 Thầy gợi ý: Nên thêm số thứ tự (1, 2, 3...) để dễ đọc hơn
- 💭 Khi em sửa lại `getInfo()` thành return String, phần này sẽ hoàn hảo

**3. Thống kê (4/10 điểm)** - Đã có ý tưởng tốt!

- 👍 Em đã biết cách mượn sách
- 💭 Lưu ý nhỏ: `Book[5].borrow()` em cần sửa thành `books[5].borrow()` (dùng tên biến list, không phải tên class)
- 💭 Các phần còn thiếu:
  - In ra tổng số sách
  - Trả sách "Tắt đèn" (gọi `returnBook()`)
  - Đếm và hiển thị số sách có sẵn
  - Đếm và hiển thị số sách đã mượn

**4. Tìm sách đắt nhất (0/10 điểm)** - Phần này em chưa làm

- 💭 Thầy gợi ý: Em dùng vòng lặp để so sánh giá từng cuốn sách

**5. Tìm sách theo tác giả (0/10 điểm)** - Phần này em chưa làm

- 💭 Thầy gợi ý: Em dùng vòng lặp hoặc `where()` để lọc sách của "Nam Cao"
- 💭 Thầy gợi ý: Đếm số sách cổ bằng cách gọi `isOldBook()`

---

## BONUS (2/10 điểm)

- 📝 Em có comments giải thích: +2/3 (Tốt lắm!)
- 💭 Xử lý edge cases: 0/3 (Em có thể thêm kiểm tra null, validate input)
- 💭 Output format: 0/2 (Em có thể làm đẹp hơn với ký tự đặc biệt, căn chỉnh)
- 💭 Tính năng sắp xếp: 0/2 (Em chưa làm)

---

## NHỮNG ĐIỂM NỔI BẬT 🌟

1. ✨ **Sáng tạo:** Em đã thêm phần tương tác với người dùng qua `stdin/stdout` - đây là điểm rất hay!
2. 💪 **Nắm được kiến thức cơ bản:** Class, object, list, vòng lặp em đều sử dụng được
3. 📝 **Có ý thức về code quality:** Em thêm comments để giải thích code
4. 🎯 **Làm đúng phần quan trọng:** Dữ liệu 10 cuốn sách em làm hoàn toàn chính xác

---

## GỢI Ý ĐỂ BÀI LÀM HOÀN HẢO HƠN 💡

### Điều chỉnh nhỏ trong Class Book:

**Vấn đề 1:** Method getInfo() cần return String

```dart
// Hiện tại (void)
void getInfo() {
  print('tên sách: $title');
  // ...
}

// Thầy gợi ý sửa thành (return String)
String getInfo() {
  String status = isAvailable ? 'Có sẵn' : 'Đã mượn';
  return 'Tên: $title, Tác giả: $author, Năm: $publishYear, Giá: ${price}đ, Trạng thái: $status';
}
```

**Vấn đề 2:** Thống nhất tên class

```dart
// Nên dùng 'Book' thay vì 'BOOK' cho đẹp hơn
class Book { ... }
```

**Vấn đề 3:** Sửa nhỏ trong main.dart

```dart
// Thay vì
Book[5].borrow();  // ❌

// Em dùng
books[5].borrow(); // ✅
books[2].borrow(); // Số đỏ
books[1].returnBook(); // Tắt đèn
```

### Bổ sung các phần còn thiếu:

**1. Thống kê thư viện** (Còn thiếu)

```dart
print('=== THỐNG KÊ THƯ VIỆN ===');
print('Tổng số sách: ${books.length}');

// Đếm sách có sẵn
int available = 0;
for (var book in books) {
  if (book.isAvailable) available++;
}
print('Sách có sẵn: $available');
print('Sách đã mượn: ${books.length - available}');
```

**2. Tìm sách đắt nhất** (Còn thiếu)

```dart
print('=== SÁCH ĐẮT NHẤT ===');
Book expensive = books[0];
for (var book in books) {
  if (book.price > expensive.price) {
    expensive = book;
  }
}
print(expensive.getInfo());
```

**3. Tìm sách theo tác giả** (Còn thiếu)

```dart
print('=== TÌM SÁCH CỦA TÁC GIẢ "Nam Cao" ===');
List<Book> namCaoBooks = [];
for (var book in books) {
  if (book.author == 'Nam Cao') {
    namCaoBooks.add(book);
  }
}
print('Tìm thấy ${namCaoBooks.length} cuốn sách:');
for (int i = 0; i < namCaoBooks.length; i++) {
  print('${i + 1}. ${namCaoBooks[i].getInfo()}');
}

// Đếm sách cổ
int oldCount = 0;
for (var book in books) {
  if (book.isOldBook()) oldCount++;
}
print('Số sách cổ (trước 1950): $oldCount');
```

---

## KẾT LUẬN VÀ KHUYẾN KHÍCH 🎯

### 💪 Điểm mạnh của em:

- ✅ Em đã nắm vững kiến thức cơ bản về OOP
- ✅ Em biết cách tạo và sử dụng class, list
- ✅ Em có sáng tạo khi thêm tính năng tương tác
- ✅ Dữ liệu em nhập chính xác 100%

### 🌱 Hướng phát triển:

- 📚 Em cần đọc kỹ đề bài để làm đủ tất cả yêu cầu
- 🔍 Em chú ý đến return type của method (void vs String)
- ⚡ Em hoàn thiện các chức năng còn thiếu (thống kê, tìm kiếm)
- 🎨 Em có thể làm output đẹp hơn bằng cách format text

---

**Nhận xét chung:** Em đã thể hiện được khả năng tư duy lập trình tốt và có sự sáng tạo trong code. Thầy mong em tiếp tục phát huy và bổ sung thêm những phần còn thiếu để bài làm hoàn chỉnh hơn nhé! Cố lên em! 💪✨
