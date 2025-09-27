void main() {
  int n = 5;

  // 1. Hình vuông rỗng
  print(' Hình vuông rỗng (n = $n)');
  for (var i = 1; i <= n; i++) {
    var line = '';
    for (var j = 1; j <= n; j++) {
      if (i == 1 || i == n || j == 1 || j == n) {
        line += '*';
      } else {
        line += ' ';
      }
    }
    print(line);
  }

  // 2. Tam giác vuông (canh trái)
  print(' Tam giác vuông (n = $n)');
  for (var i = 1; i <= n; i++) {
    var line = '';
    for (var j = 1; j <= i; j++) {
      line += '*';
    }
    print(line);
  }

  // 3. Tam giác cân đầy
  print(' Tam giác cân đầy (n = $n)');
  for (int i = 0; i < n; i++) {
    print(' ' * (n - i - 1) + '*' * (2 * i + 1));
  }
}
