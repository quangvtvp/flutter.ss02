# ĐỀ KIỂM TRA GIỮA KỲ - PHẦN 2

## KHÓA HỌC LẬP TRÌNH FLUTTER & DART

**Thời gian:** 90 phút

**Quy định:**

- Được sử dụng tài liệu và Internet
- Nộp bài qua GitHub (tạo repository với tên: `exam-01-[ten-hoc-sinh]`)
- Làm bài độc lập, không trao đổi với người khác
- KHÔNG sử dụng AI hỗ trợ code như ChatGPT, Copilot

---

## PHẦN THỰC HÀNH

**Điểm:** 70% tổng điểm

### **YÊU CẦU TỔNG QUAN**

Xây dựng chương trình **Quản lý Thư viện Sách** với các chức năng sau:

---

### **Bài 1: Class Book (35 điểm)**

Tạo file `book.dart` và implement class `Book`:

**Yêu cầu:**

- Properties:

  - `String title` - Tên sách
  - `String author` - Tác giả
  - `int publishYear` - Năm xuất bản
  - `double price` - Giá sách
  - `bool isAvailable` - Trạng thái có sẵn (mặc định: true)

- Constructors:

  - Default constructor với tất cả parameters

- Methods:
  - `void borrow()` - Đổi trạng thái thành không có sẵn (isAvailable = false)
  - `void returnBook()` - Đổi trạng thái thành có sẵn (isAvailable = true)
  - `String getInfo()` - Trả về thông tin đầy đủ của sách
    - Format: "Tên: [title], Tác giả: [author], Năm: [publishYear], Giá: [price]đ, Trạng thái: [Có sẵn/Đã mượn]"
  - `bool isOldBook()` - Kiểm tra sách cổ (xuất bản trước năm 1950)
    - Return: `true` nếu publishYear < 1950, ngược lại `false`

**Ví dụ:**

```dart
void main() {
  var book1 = Book('Dế Mèn phiêu lưu ký', 'Tô Hoài', 1941, 50000, true);
  print(book1.getInfo());
  // Output: Tên: Dế Mèn phiêu lưu ký, Tác giả: Tô Hoài, Năm: 1941, Giá: 50000đ, Trạng thái: Có sẵn

  book1.borrow();
  print(book1.getInfo());
  // Output: Tên: Dế Mèn phiêu lưu ký, Tác giả: Tô Hoài, Năm: 1941, Giá: 50000đ, Trạng thái: Đã mượn

  print(book1.isOldBook());
  // Output: true (vì năm 1941 < 1950)
}
```

---

### **Bài 2: Chương trình chính (35 điểm)**

Tạo file `main.dart` để sử dụng class `Book`:

#### **Yêu cầu:**

1. **Khởi tạo danh sách sách** (10 điểm)
   - Tạo `List<Book>` với tên biến `books`
   - **BẮT BUỘC thêm CHÍNH XÁC 10 cuốn sách sau đây:**

```dart
// Sách 1
Book('Dế Mèn phiêu lưu ký', 'Tô Hoài', 1941, 45000, true)
// Sách 2
Book('Tắt đèn', 'Ngô Tất Tố', 1939, 52000, false)
// Sách 3
Book('Số đỏ', 'Vũ Trọng Phụng', 1936, 48000, true)
// Sách 4
Book('Chí Phèo', 'Nam Cao', 1941, 35000, true)
// Sách 5
Book('Lão Hạc', 'Nam Cao', 1943, 38000, false)
// Sách 6
Book('Nhà giả kim', 'Paulo Coelho', 1988, 89000, true)
// Sách 7
Book('Đắc nhân tâm', 'Dale Carnegie', 1936, 95000, false)
// Sách 8
Book('Tuổi trẻ đáng giá bao nhiêu', 'Rosie Nguyễn', 2018, 78000, true)
// Sách 9
Book('Cây cam ngọt của tôi', 'José Mauro de Vasconcelos', 1968, 105000, true)
// Sách 10
Book('Sapiens - Lược sử loài người', 'Yuval Noah Harari', 2011, 198000, true)
```

2. **In danh sách tất cả sách** (5 điểm)

   - Sử dụng vòng lặp để in thông tin của tất cả sách
   - Format: đánh số thứ tự từ 1 đến 10
   - Sử dụng method `getInfo()` của mỗi Book

3. **Tính toán và hiển thị thống kê** (10 điểm)

   - Tổng số sách
   - Thực hiện cho mượn sách `Nhà giả kim`,`Số đỏ` bằng cách gọi hàm `borrow()`
   - Thực hiện trả sách `Tắt đèn` bằng cách gọi hàm `returnBook()`
   - Số sách có sẵn (isAvailable = true)
   - Số sách đã mượn (isAvailable = false)

4. **Tìm sách đắt nhất** (5 điểm)

   - Sử dụng vòng lặp để tìm sách có giá cao nhất
   - In thông tin sách đắt nhất

5. **Tìm sách theo tác giả** (5 điểm)
   - Tìm tất cả sách của tác giả "Nam Cao"
   - In số lượng sách tìm được
   - Đếm và in số sách cổ (sử dụng method `isOldBook()`)
   - In danh sách các sách tìm được

---

## TIÊU CHÍ CHẤM ĐIỂM

### **Phần Thực hành (70%):**

| Mục                       | Điểm | Tiêu chí                                  |
| ------------------------- | ---- | ----------------------------------------- |
| **Bài 1: Class Book**     | 35   |                                           |
| - Properties đầy đủ       | 8    | Đúng kiểu dữ liệu, có giá trị mặc định    |
| - Constructors            | 8    | Default + fromMap                         |
| - Methods cơ bản          | 8    | borrow(), returnBook(), isOldBook()       |
| - Method getInfo()        | 6    | Format đúng, xử lý trạng thái             |
| - Code sạch, đặt tên đúng | 5    | Conventions, comments                     |
| **Bài 2: Main program**   | 35   |                                           |
| - Khởi tạo List sách      | 5    | Đúng 10 sách, thông tin chính xác         |
| - In danh sách sách       | 5    | Vòng lặp đúng, format rõ ràng             |
| - Tính toán thống kê      | 10   | Đầy đủ 5 thông tin, tính toán chính xác   |
| - Tìm sách đắt nhất       | 5    | Logic đúng, hiển thị đúng                 |
| - Tìm sách theo tác giả   | 5    | Tìm đúng "Nam Cao", hiển thị đủ thông tin |
| - Code logic và trình bày | 5    | Vòng lặp hợp lý, output dễ đọc            |

### **Bonus (Tối đa +10 điểm):**

- Code có comments đầy đủ: +3 điểm
- Xử lý edge cases tốt: +3 điểm
- Output đẹp, có format rõ ràng: +2 điểm
- Thêm tính năng sắp xếp sách theo giá: +2 điểm

---

## HƯỚNG DẪN NỘP BÀI

1. **Tạo GitHub repository:**

   - Tên: `exam-01-[ten-hoc-sinh]`
   - Ví dụ: `exam-01-nguyenvana`

2. **Cấu trúc thư mục:**

   ```
   exam-01-nguyenvana/
   ├── answers.txt      # Đáp án trắc nghiệm (Phần 1)
   ├── book.dart        # Bài 1: Class Book
   ├── main.dart        # Bài 2: Main program
   └── README.md        # Hướng dẫn chạy
   ```

3. **Nộp bài:**

   - Commit và push lên GitHub
   - Đảm bảo code chạy được với lệnh: `dart main.dart`

4. **README.md phải có:**
   - Họ tên học sinh
   - Ngày sinh
   - Tên trường đang học
   - Hướng dẫn chạy chương trình

---

## MẪU OUTPUT MONG MUỐN

**Với dữ liệu 10 cuốn sách bắt buộc ở trên, kết quả mong đợi:**

```
=== DANH SÁCH TẤT CẢ SÁCH ===
1. Tên: Dế Mèn phiêu lưu ký, Tác giả: Tô Hoài, Năm: 1941, Giá: 45000đ, Trạng thái: Có sẵn
2. Tên: Tắt đèn, Tác giả: Ngô Tất Tố, Năm: 1939, Giá: 52000đ, Trạng thái: Đã mượn
3. Tên: Số đỏ, Tác giả: Vũ Trọng Phụng, Năm: 1936, Giá: 48000đ, Trạng thái: Có sẵn
4. Tên: Chí Phèo, Tác giả: Nam Cao, Năm: 1941, Giá: 35000đ, Trạng thái: Có sẵn
5. Tên: Lão Hạc, Tác giả: Nam Cao, Năm: 1943, Giá: 38000đ, Trạng thái: Đã mượn
6. Tên: Nhà giả kim, Tác giả: Paulo Coelho, Năm: 1988, Giá: 89000đ, Trạng thái: Có sẵn
7. Tên: Đắc nhân tâm, Tác giả: Dale Carnegie, Năm: 1936, Giá: 95000đ, Trạng thái: Đã mượn
8. Tên: Tuổi trẻ đáng giá bao nhiêu, Tác giả: Rosie Nguyễn, Năm: 2018, Giá: 78000đ, Trạng thái: Có sẵn
9. Tên: Cây cam ngọt của tôi, Tác giả: José Mauro de Vasconcelos, Năm: 1968, Giá: 105000đ, Trạng thái: Có sẵn
10. Tên: Sapiens - Lược sử loài người, Tác giả: Yuval Noah Harari, Năm: 2011, Giá: 198000đ, Trạng thái: Có sẵn

=== THỐNG KÊ THƯ VIỆN ===
Tổng số sách: 10
Sách có sẵn: 6
Sách đã mượn: 4

=== SÁCH ĐẮT NHẤT ===
Tên: Sapiens - Lược sử loài người, Tác giả: Yuval Noah Harari, Năm: 2011, Giá: 198000đ, Trạng thái: Có sẵn

=== TÌM SÁCH CỦA TÁC GIẢ "Nam Cao" ===
Tìm thấy 2 cuốn sách:
1. Tên: Chí Phèo, Tác giả: Nam Cao, Năm: 1941, Giá: 35000đ, Trạng thái: Có sẵn
2. Tên: Lão Hạc, Tác giả: Nam Cao, Năm: 1943, Giá: 38000đ, Trạng thái: Đã mượn
Số sách cổ (trước 1950): 6
```

---

**CHÚC CÁC EM LÀM BÀI TỐT! 🎯📚**
