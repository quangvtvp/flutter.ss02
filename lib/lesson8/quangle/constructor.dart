class BankAccount {
  double _balance; // Public - không an toàn!

  BankAccount(this._balance);

  void addInterest() {
    _balance = _balance * 1.05; // Cộng 5% lãi
  }

  bool _validateAmount(double amount) {
    if (amount <= 0) {
      print('❌ Số tiền phải lớn hơn 0!');
      return false;
    }
    if (amount > 1000000) {
      print('❌ Ko hop le!');
      return false;
    }
    return true;
  }
}

void main() {
  var account = BankAccount(1000000);

  // ❌ Nguy hiểm: ai cũng có thể thay đổi số dư tùy ý!
  account._balance = 999999999;
  account._validateAmount(-500);
  
  print('Số dư: ${account._balance}'); // Đã bị thay đổi!

  // ❌ Nguy hiểm: có thể gọi logic nội bộ từ ngoài
  account.addInterest();
}
