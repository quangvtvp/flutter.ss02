void main() {
  int n = 5;
  for (int i = 0; i < n; i++) {
    int spaces = n - i - 1;
    int stars = 2 * i + 1;

    String left = ' ' * spaces;
    String mid = '*' * stars;
    print(left + mid);
  }
}
