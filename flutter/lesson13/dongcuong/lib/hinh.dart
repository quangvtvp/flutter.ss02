import 'package:flutter/material.dart';
import 'dart:math';
class Peolpe {
  final String ten;
  final String mota;
  final String Job;
  final Color avatarColor;
  Peolpe({
    required this.ten,
    required this.mota,
    required this.Job,
    required this.avatarColor,
  });
}


class MyGameScreen extends StatelessWidget {
  MyGameScreen({super.key});
  final ValueNotifier<List<Peolpe>> _counter = ValueNotifier([]);
  final TextEditingController _tenController = TextEditingController();
  final TextEditingController _motaController = TextEditingController();
  final Random _random = Random();
  final List<String> jobs = [
    'Kỹ sư phần mềm',
    'Bác sĩ',
    'Giáo viên',
    'Nghệ sĩ',
    'Nhà khoa học',
    'Doanh nhân',
    'Nhà văn',
    'Diễn viên',
    'Nhà thiết kế thời trang',
    'Đầu bếp nổi tiếng',
    'Phi hành gia',
    'Nhà thám hiểm',
    
  ];
  Color getRandomColor() {
    return Color.fromARGB(
      255,
      _random.nextInt(256),
      _random.nextInt(256),
      _random.nextInt(256),
    );
  }
  void _addMember(BuildContext context) {
    final ten = _tenController.text.trim();
    final mota = _motaController.text.trim();
    if (ten.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Vui lòng nhập tên người dùng để xem bói ')),
      );
      return;
    }
    final baomat = mota.isEmpty ? 'Người dùng bí ẩn' : mota;
    final job = jobs[_random.nextInt(jobs.length)];
    final Newmember = Peolpe(
      ten: ten,
      mota: baomat,
      Job: job,
      avatarColor: getRandomColor(),
    );
    _counter.value = [..._counter.value, Newmember];
    _tenController.clear();
    _motaController.clear();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 500),
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Máy Tiên Tri Nghề Nghiệp'),
              centerTitle: true,
              backgroundColor: const Color(0xFF7E57C2),
              foregroundColor: Colors.white,
              elevation: 0,
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // 1. Form nhập thông tin
                  _formInfo(context),

                  const SizedBox(height: 16),

                  const Text(
                    'Kết quả dự đoán nghề nghiệp',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),

                  // 2. Danh sách thành viên
                  // Dùng ValueListenableBuilder để lắng nghe thay đổi từ _membersNotifier
                  // Chỉ có phần này được vẽ lại khi danh sách thay đổi
                  Expanded(
                    child: ValueListenableBuilder<List<Peolpe>>(
                      valueListenable: _counter,
                      builder: (context, members, child) {
                        return SingleChildScrollView(
                          child: Column(
                            children: [
                              for (final member in members) _MemberCard(member: member),
                              if (members.isEmpty)
                                Padding(
                                  padding: const EdgeInsets.only(top: 32.0),
                                  child: Text(
                                    'Chưa có ai được tiên tri, nhập tên để bắt đầu',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.grey.shade600,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Widget Form nhập liệu
  Widget _formInfo(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color.fromARGB(255, 147, 123, 193), width: 2),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 147, 123, 193).withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Nhập thông tin để tiên tri',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 106, 72, 164),
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _tenController,
            decoration: const InputDecoration(
              labelText: 'Tên người dùng',
              hintText: 'Nhập tên người cần xem bói',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              prefixIcon: Icon(Icons.person_outline, color: Color.fromARGB(255, 104, 73, 157)),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color.fromARGB(255, 104, 73, 157), width: 2),
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              labelStyle: TextStyle(color: Color.fromARGB(255, 104, 73, 157)),
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _motaController,
            decoration: const InputDecoration(
              labelText: 'Mô tả bản thân',
              hintText: 'VD: Yêu thích công nghệ, thích khám phá...',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              prefixIcon: Icon(Icons.description_outlined, color: Color.fromARGB(255, 104, 73, 157)),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color.fromARGB(255, 104, 73, 157), width: 2),
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              labelStyle: TextStyle(color: Color.fromARGB(255, 104, 73, 157)),
            ),
            maxLines: 2,
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton.icon(
                onPressed: () => _addMember(context),
                icon: const Icon(Icons.auto_awesome),
                label: const Text('Tiên Tri Ngay'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 106, 72, 164),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Widget hiển thị thẻ thành viên
class _MemberCard extends StatelessWidget {
  final Peolpe member;

  const _MemberCard({required this.member});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 36, 19, 19).withOpacity(0.03),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: member.avatarColor,
            child: Text(
              member.ten.isNotEmpty ? member.ten[0].toUpperCase() : '?',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  member.ten,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  member.mota,
                  style: const TextStyle(fontSize: 13),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(
                      Icons.work_outline,
                      size: 16,
                      color: Colors.teal,
                    ),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        'Nghề nghiệp của: ${member.Job}',
                        style: const TextStyle(
                          fontSize: 13,
                          fontStyle: FontStyle.italic,
                          color: Colors.teal,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


        
  