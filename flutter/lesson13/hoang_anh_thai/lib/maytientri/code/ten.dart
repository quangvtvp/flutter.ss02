import 'package:flutter/material.dart';
import 'resource.dart';

// Widget hiển thị từng kết quả (thay thế cho phinel)
class KetQuaCard extends StatelessWidget {
  final DuLieuTienTri data;

  const KetQuaCard({required this.data, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 241, 216, 255), // Màu hồng nhạt
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Tên: ${data.ten}',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0XFF904CA3),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            'Sở thích/Tính cách: ${data.moTa}',
            style: const TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
          ),
          const Divider(),
          Text(
            '🔮 Nghề nghiệp tương lai: ${data.ngheNghiep}',
            style: const TextStyle(
              fontSize: 16,
              color: Colors.teal,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            '😂 Lời khuyên: ${data.joke}',
            style: const TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}

class KetQuaList extends StatelessWidget {
  const KetQuaList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Map<String, DuLieuTienTri>>(
      valueListenable: ketQuaNotifier,
      builder: (context, results, child) {
        if (results.isEmpty) {
          return const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              'Chưa có kết quả. Hãy nhập tên và mô tả để Máy Tiên Tri dự đoán!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          );
        }

        final resultList = results.values.toList().reversed.toList();

        return Column(
          children: resultList.map((data) {
            return KetQuaCard(data: data);
          }).toList(),
        );
      },
    );
  }
}
