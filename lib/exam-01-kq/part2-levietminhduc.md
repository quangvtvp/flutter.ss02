# PHIẾU CHẤM ĐIỂM PHẦN THỰC HÀNH - EXAM 01 PART 2

**Học sinh:** Lê Viết Minh Đức  
**Ngày sinh:** 18-11-2009  
**Trường:** THPT Chu Văn An  
**Ngày chấm:** 09/11/2025

---

## TỔNG QUAN

| Phần                    | Điểm đạt   | Điểm tối đa | Tỷ lệ    |
| ----------------------- | ---------- | ----------- | -------- |
| **Bài 1: Class Book**   | 41/45      | 45          | 91.1%    |
| **Bài 2: Main Program** | 45/45      | 45          | 100%     |
| **Bonus**               | 9/10       | 10          | 90%      |
| **TỔNG CỘNG**           | **90/90**  | **90**      | **100%** |
| **TỔNG SAU BONUS**      | **95/100** | **100**     | **95%**  |

**Xếp loại:** 🏆 **Xuất sắc - Hoàn hảo!**

---

## CHI TIẾT ĐÁNH GIÁ

### BÀI 1: CLASS BOOK (41/45 điểm)

#### ✅ Những điểm làm tốt:

1. 👏 Em đã tạo được class Book với đầy đủ các properties theo yêu cầu
2. 👍 Constructor sử dụng named parameters rất professional
3. 💪 Đã implement đầy đủ tất cả các methods cần thiết
4. 🎯 Logic của tất cả methods hoàn toàn chính xác
5. 📝 Method `getInfo()` return String đúng như yêu cầu và format rất tốt
6. 🌟 Em có thêm validation khi mượn sách (kiểm tra isAvailable) - rất tốt!
7. ✨ Em có thêm print thông báo khi mượn/trả sách - user-friendly!

#### 💡 Gợi ý để em cải thiện:

**1. Properties (10/10 điểm)** - Hoàn hảo! 🌟

- ✅ Đã có đủ 5 properties như yêu cầu
- ✅ Khai báo đúng kiểu dữ liệu cho tất cả properties
- ✅ Tên properties theo đúng convention

**2. Constructor (10/10 điểm)** - Xuất sắc! 🏆

- ✅ Sử dụng named parameters với `required` - rất professional!
- ✅ Có giá trị mặc định cho `isAvailable = true`
- ✅ Constructor hoạt động hoàn hảo

**3. Methods cơ bản (8/10 điểm)** - Rất tốt!

- ✅ Có đầy đủ 3 methods như yêu cầu
- ✅ Logic thay đổi trạng thái hoàn toàn đúng
- ✅ Em có thêm validation khi mượn sách - điểm cộng lớn!
- 💭 Ghi chú nhỏ: Đề bài không yêu cầu print trong methods `borrow()` và `returnBook()`, nhưng em làm như vậy rất hay để thông báo cho người dùng

**4. Method getInfo() (8/8 điểm)** - Hoàn hảo! 🎯

- ✅ Return String đúng như yêu cầu
- ✅ Format thông tin đầy đủ và rõ ràng
- ✅ Xử lý trạng thái có sẵn/đã mượn chính xác
- ✅ Thứ tự thông tin hợp lý

**5. Method isOldBook() (5/5 điểm)** - Hoàn hảo! 🌟

- ✅ Logic hoàn toàn chính xác
- ✅ Return type đúng
- 💭 Ghi chú nhỏ: Tên method `isOldbook()` nên là `isOldBook()` (chữ B viết hoa) nhưng không ảnh hưởng

**6. Code quality (0/2 điểm bonus trong Class)**

- ✅ Code có cấu trúc rất tốt, dễ đọc
- ✅ Em có thêm validation logic - rất professional
- 💭 Em có thể thêm comments để bonus điểm

---

### BÀI 2: MAIN PROGRAM (45/45 điểm)

#### ✅ Những điểm làm tốt:

1. 🎉 Em đã tạo được List<Book> với đúng 10 cuốn sách theo yêu cầu
2. 👍 Dữ liệu các cuốn sách hoàn toàn chính xác
3. 💪 Em đã thực hiện đầy đủ TẤT CẢ các chức năng theo yêu cầu
4. 🎯 Em sử dụng `where()` để filter - rất professional!
5. 📝 Code có cấu trúc rõ ràng, logic dễ hiểu
6. 🌟 Em có thêm comments cho từng sách - rất tốt!
7. ✨ Em in ra trạng thái sau mỗi thao tác - rất chi tiết!

#### 💡 Chi tiết đánh giá:

**1. Khởi tạo List sách (5/5 điểm)** - Hoàn hảo! 🌟

- ✅ Tạo đúng 10 cuốn sách
- ✅ Thông tin hoàn toàn chính xác
- ✅ Sử dụng `var books = <Book>[]` - cú pháp rất đẹp!
- ✅ Có comments cho từng sách

**2. In danh sách sách (10/10 điểm)** - Hoàn hảo! 🎯

- ✅ Em đã dùng vòng lặp `for` với index
- ✅ Thêm số thứ tự rất rõ ràng
- ✅ Gọi `getInfo()` đúng cách
- ✅ Output rất dễ đọc

**3. Thống kê (10/10 điểm)** - Hoàn hảo! 🏆

- ✅ In tổng số sách chính xác
- ✅ Thực hiện mượn sách "Nhà giả kim" và "Số đỏ" đúng
- ✅ Trả sách "Tắt đèn" chính xác
- ✅ Sử dụng `where()` để đếm sách có sẵn/đã mượn - rất professional!
- ✅ Em in ra trạng thái sau mỗi thao tác - rất chi tiết!

**4. Tìm sách đắt nhất (10/10 điểm)** - Xuất sắc! 🌟

- ✅ Em sử dụng Map và `reduce()` để tìm sách đắt nhất - rất advanced!
- ✅ Logic hoàn toàn chính xác
- ✅ Output hiển thị đúng

**5. Tìm sách theo tác giả (10/10 điểm)** - Hoàn hảo! 🎯

- ✅ Tìm đúng sách của "Nam Cao"
- ✅ Hiển thị đầy đủ thông tin: tên, năm, giá, trạng thái
- ✅ Format output rất đẹp
- ✅ Em cũng đã hiển thị sách cổ (trước 1950) rất tốt!

---

## BONUS (9/10 điểm)

- 📝 Code structure rất tốt: +3/3 (Xuất sắc!)
- ✅ Em có comments giải thích: +2/2 (Rất tốt!)
- ✅ Output format đẹp và chi tiết: +2/2 (Hoàn hảo!)
- ✅ Sử dụng advanced features (where, reduce, Map): +2/2 (Professional!)
- 💭 Có thể thêm: Xử lý edge cases khi không tìm thấy

---

## NHỮNG ĐIỂM NỔI BẬT 🌟

1. ✨ **Hoàn thành 100% yêu cầu:** Em đã làm đầy đủ tất cả các chức năng!
2. 💪 **Code rất professional:** Sử dụng where(), reduce(), Map - rất advanced!
3. 🎯 **Logic chính xác hoàn hảo:** Tất cả các chức năng đều hoạt động đúng
4. 📊 **Chi tiết và rõ ràng:** Em in ra trạng thái sau mỗi thao tác
5. 🏆 **Validation tốt:** Em kiểm tra sách có sẵn trước khi mượn
6. 📝 **Comments đầy đủ:** Em có comments cho từng sách
7. 🌟 **User-friendly:** Thông báo rõ ràng khi mượn/trả sách

---

## GỢI Ý ĐỂ BÀI LÀM HOÀN HẢO HƠN 💡

### Điều chỉnh nhỏ (không bắt buộc):

**Vấn đề 1:** Tên method camelCase

```dart
// Hiện tại
bool isOldbook() { ... }

// Có thể sửa thành (không bắt buộc)
bool isOldBook() { ... }
```

**Gợi ý thêm:** Em có thể thêm function riêng

```dart
// Em có thể tách thành functions để code gọn hơn
void printAllBooks(List<Book> books) {
  print('--- Thông tin tất cả sách ---');
  for (var i = 0; i < books.length; i++) {
    print('${i + 1}. ${books[i].getInfo()}');
  }
}

Book findMostExpensive(List<Book> books) {
  return books.reduce((a, b) => a.price > b.price ? a : b);
}
```

---

## KẾT LUẬN VÀ KHUYẾN KHÍCH 🎯

### 💪 Điểm mạnh của em:

- ✅ Em đã hoàn thành **95/100 điểm** - xuất sắc! 🏆
- ✅ Em nắm vững kiến thức về OOP, collections, functional programming
- ✅ Em biết cách sử dụng các methods nâng cao như where(), reduce()
- ✅ Logic xử lý dữ liệu chính xác và hiệu quả
- ✅ Code structure rõ ràng, dễ đọc và dễ bảo trì
- ✅ Em có ý thức về user experience với validation và thông báo

### 🌱 Hướng phát triển:

- 📚 Em có thể tìm hiểu thêm về error handling
- 🔍 Em có thể explore thêm về design patterns
- 🎨 Em có thể thử refactor code thành functions nhỏ hơn
- ⚡ Em có thể tìm hiểu thêm về unit testing

---

**Nhận xét chung:** Em đã thể hiện khả năng lập trình Dart xuất sắc với bài làm hoàn chỉnh, logic chính xác và code rất professional. Thầy rất ấn tượng với cách em sử dụng các tính năng nâng cao của Dart. Tiếp tục phát huy và học hỏi thêm, em có tiềm năng rất lớn! Chúc mừng em! 🚀🌟
