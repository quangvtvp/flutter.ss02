main() {
  var cars = [];
  Car toyotaCar = Car(
    color: 'red',
    manufacturer: 'Toyota',
    price: 20000,
    year: 2020,
  );
  Car hondaCar = Car(
    color: 'blue',
    manufacturer: 'Honda',
    price: 18000,
    year: 2019,
  );
  Car fordCar = Car(
    color: 'black',
    manufacturer: 'Ford',
    price: 25000,
    year: 2021,
  );

  cars.add(toyotaCar);
  cars.add(hondaCar);
  cars.add(fordCar);
  for (var car in cars) {
    car.printCarInfos();
  }
}

class Student {
  String? name;
  double? avgScore;
  String? gender;
  String? className;

  Student({this.name, this.avgScore, this.gender, this.className});

  String kiemtraHocLuc() {
    if (avgScore! >= 8) {
      return "Giỏi";
    } else if (avgScore! >= 7) {
      return "Khá";
    } else {
      return "Trung bình";
    }
  }
}

void printStudentFromClass() {
  Student student1 = Student(
    name: 'Nguyen Van A',
    avgScore: 8.0,
    gender: 'nam',
    className: '12A6',
  );
  Student student2 = Student(
    name: 'Nguyen Van B',
    avgScore: 9.0,
    gender: 'nam',
    className: '12A6',
  );
  Student student3 = Student(
    name: 'Nguyen Van C',
    avgScore: 7.0,
    gender: 'nam',
    className: '12A7',
  );

  student1.avgScore = 6;

  var studentList = [student1, student2, student3];
  for (var student in studentList) {
    print(
      '${student.name} \t${student.avgScore} \t${student.className} \t${student.kiemtraHocLuc()}',
    );
  }
}

class Car {
  // màu sơn, hãng sản xuất, tên , giá
  String color;
  String manufacturer;
  double price;
  int year;

  Car({
    required this.color,
    required this.manufacturer,
    required this.price,
    required this.year,
  });

  void printCarInfos() {
    print(
      'Manufacturer: $manufacturer, Color: $color, Price: $price, Year: $year',
    );
  }
}

void printStudentsUsingMap() {
  // Tên, điểm, giới tính, lớp
  var mapStudents = [
    {'name': 'Nguyen Van A', 'score': 8.0, 'gender': 'nam', 'class': '12A6'},
    {'name': 'Tran Thi B', 'score': 9.5, 'gender': 'nu', 'class': '12A6'},
    {'name': 'Le Van C', 'score': 7.0, 'gender': 'nam', 'class': '12A7'},
    {'name': 'Pham Thi D', 'score': 6.5, 'gender': 'nu', 'class': '11A6'},
  ];

  for (int i = 0; i < mapStudents.length; i++) {
    print('${i + 1}: ${mapStudents[i]['name']} ${mapStudents[i]['class']}');
  }
}

// khai báo danh sách các quyển sách bao gồm các thuộc tính: tác giả, môn học, tên sách, số trang
// dùng vòng for để in ra thông tin sách

void printStudentsUsingRecord() {
  var students = [
    ('Nguyen Van A', 8.0, 'nam', '12A6'),
    ('Tran Thi B', 9.5, 'nu', '12A6'),
    ('Le Van C', 7.0, 'nam', '12A7'),
    ('Pham Thi D', 6.5, 'nu', '11A6'),
  ];

  // khó khăn trong việc tìm kiếm variable/ property cần sử dụng
  for (int i = 0; i < students.length; i++) {
    print(
      '${i + 1}: ${students[i].$1} \t${students[i].$2} \t${students[i].$4}',
    );
  }
}
