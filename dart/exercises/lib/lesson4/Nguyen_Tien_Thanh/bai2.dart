void main() {
  int n = 5;
  int result = 1;
  for (int i = 1; i <= n; i++) {
    result *= i; 
  }
  print('$n! = $result');
}