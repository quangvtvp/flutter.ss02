import 'package:dart_basic/lesson8/quangle/constructor.dart';

void main() {
  BankAccount account = BankAccount(1000000);
  account.addInterest();
  // print('Số dư: ${account.balance}'); // Đã bị thay đổi!
}