import 'dart:io';

String? prompt(String message) {
  stdout.write(message);
  return stdin.readLineSync();
}

int readPositiveInteger(String promptMessage, String errorMessage) {
  int? value;
  while (value == null || value <= 0) {
    final String? input = prompt(promptMessage);
    value = int.tryParse(input ?? '');
    if (value == null || value <= 0) {
      print(errorMessage);
    }
  }
  return value;
}

double readDouble(String promptMessage, String errorMessage) {
  double? value;
  while (value == null) {
    final String? input = prompt(promptMessage);
    value = double.tryParse(input ?? '');
    if (value == null) {
      print(errorMessage);
    }
  }
  return value;
}

String? findKeyCaseInsensitive(Map<String, double> map, String searchKey) {
  final String lowerSearchKey = searchKey.toLowerCase();
  for (final String key in map.keys) {
    if (key.toLowerCase() == lowerSearchKey) {
      return key;
    }
  }
  return null;
}

void main() {
  Map<String, double> bangDiem = {};
  print('CHƯƠNG TRÌNH QUẢN LÝ ĐIỂM HỌC SINH');

  final int soMon = readPositiveInteger(
    'Nhập số môn học có điểm: ',
    'Vui lòng nhập số nguyên dương hợp lệ cho số môn học: ',
  );

  for (int i = 0; i < soMon; i++) {
    String? tenMon;
    while (true) {
      tenMon = prompt('Nhập tên môn học thứ ${i + 1}: ');
      if (tenMon != null && tenMon.trim().isNotEmpty) {
        tenMon = tenMon.trim();
        break;
      } else {
        print('Tên môn học không được để trống. Vui lòng nhập lại.');
      }
    }
    double diem;
    while (true) {
      diem = readDouble(
        'Nhập điểm cho môn "$tenMon": ',
        'Vui lòng nhập số thực hợp lệ cho điểm: ',
      );
      if (diem >= 0 && diem <= 10) {
        break;
      } else {
        print('Điểm phải từ 0 đến 10. Vui lòng nhập lại.');
      }
    }

    final String? existingKey = findKeyCaseInsensitive(bangDiem, tenMon);

    if (existingKey != null) {
      print('Môn "$existingKey" đã tồn tại. Cập nhật điểm.');
      bangDiem[existingKey] = diem;
    } else {
      bangDiem[tenMon] = diem;
    }
  }

  print('\n=== BẢNG ĐIỂM ===');
  if (bangDiem.isEmpty) {
    print('Chưa có môn học nào được nhập.');
  } else {
    bangDiem.forEach((mon, diem) {
      print('$mon: ${diem.toStringAsFixed(2)} điểm');
    });

    double tongDiem = bangDiem.values.fold(0.0, (sum, diem) => sum + diem);
    double diemTrungBinh = tongDiem / bangDiem.length;
    print('\nĐiểm trung bình: ${diemTrungBinh.toStringAsFixed(2)}');

    final List<String> monGioi = bangDiem.entries
        .where((entry) => entry.value >= 8.0)
        .map((entry) => entry.key)
        .toList();

    if (monGioi.isNotEmpty) {
      print('Các môn đạt điểm Giỏi (>= 8.0): ${monGioi.join(', ')}');
    } else {
      print('Chưa có môn nào đạt điểm Giỏi (>= 8.0)');
    }

    print('\n--- TÌM KIẾM MÔN HỌC ---');
    String? monCanTim;
    while (true) {
      monCanTim = prompt('Nhập tên môn muốn tìm: ');
      if (monCanTim != null && monCanTim.trim().isNotEmpty) {
        monCanTim = monCanTim.trim();
        break;
      } else {
        print('Tên môn học không được để trống. Vui lòng nhập lại.');
      }
    }

    final String? foundKey = findKeyCaseInsensitive(bangDiem, monCanTim);

    if (foundKey != null) {
      print(
        'Điểm môn $foundKey: ${bangDiem[foundKey]!.toStringAsFixed(2)} điểm',
      );
    } else {
      print('Không tìm thấy môn học "$monCanTim"');
    }
  }

  print('\nChương trình kết thúc.');
}
