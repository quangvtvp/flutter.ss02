// tam giác cân
void main() {
  int n = 5;

  for (int i = 0; i < n; i++) {
    print(' ' * (n - i - 1) + '*' * (2 * i + 1));
  }
}
