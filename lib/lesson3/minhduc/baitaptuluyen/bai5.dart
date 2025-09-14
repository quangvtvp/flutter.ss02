import 'dart:io';
void main() {
    print('Bài 5:Mật khẩu an toàn');
    print('Xin chào bạn!');
    print('Nhập mật khẩu(có ít nhất 10 ký tự, có chữ hoa, chữ thường và số, ký tự đặc biệt):');
    String? password = stdin.readLineSync();
    if (isValidPassword(password)) {
        print('Mật khẩu hợp lệ(đủ mạnh).');
    } else {
        print('Mật khẩu chưa đạt.');
    }
}

bool isValidPassword(String? password) {
    if (password == null || password.length < 10) return false;
    bool hasUpper = false, hasLower = false, hasDigit = false, hasSpecial = false;
    String specialCharacters = r'!@#$%^&*()-+';
    for (int i = 0; i < password.length; i++) {
        if (password[i].contains(RegExp(r'[A-Z]'))) hasUpper = true;
        if (password[i].contains(RegExp(r'[a-z]'))) hasLower = true;
        if (password[i].contains(RegExp(r'[0-9]'))) hasDigit = true;
        if (specialCharacters.contains(password[i])) hasSpecial = true;
    }
    return hasUpper && hasLower && hasDigit && hasSpecial;
}