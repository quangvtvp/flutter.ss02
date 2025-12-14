import 'package:flutter/material.dart';
class Mygamescreen extends StatelessWidget {
  const Mygamescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MemberData>(
      create: (BuildContext context) => MemberData(),
      builder: (BuildContext context, Widget? child) => MaterialApp(
        title: 'Máy Đoán Nghề Nghiệp',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFF7E57C2), // Màu tím chủ đạo
            foregroundColor: Colors.white,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF7E57C2), // Màu tím chủ đạo
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFF7E57C2)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFF7E57C2), width: 2),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.deepPurple.shade200),
            ),
            labelStyle: const TextStyle(color: Color(0xFF7E57C2)),
            hintStyle: TextStyle(color: Colors.grey.shade400),
            prefixIconColor: const Color(0xFF7E57C2),
          ),
        ),
        home: MemberFunnyGameScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class MemberFunnyGameScreen extends StatelessWidget {
  MemberFunnyGameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final MemberData memberData = Provider.of<MemberData>(context);

    return Scaffold(
      backgroundColor: Colors.grey.shade100, // Màu nền xám nhẹ
      appBar: AppBar(
        title: const Text('Máy Đoán Nghề Nghiệp'),
        centerTitle: true,
      ),
      body: SingleChildScrollView( 
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: const Color(0xFFEDE7F6), // Màu tím nhạt hơn
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFFB39DDB), width: 1),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Chào mừng đến với Máy Đoán Nghề Nghiệp Vui Nhộn!',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Hãy nhập tên của bạn hoặc bất kỳ ai bạn muốn, và chúng tôi sẽ dự đoán một nghề nghiệp siêu hài hước cho bạn. Cùng xem ai sẽ là "Thám tử mèo" hay "Chuyên gia nếm thử bánh quy miễn phí" nhé!',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16), // Bo góc
                  border:
                      Border.all(color: const Color(0xFFB39DDB), width: 2), // Viền tím nhạt
                  boxShadow: <BoxShadow>[
                    // Đổ bóng nhẹ
                    BoxShadow(
                      color: const Color(0xFFB39DDB).withOpacity(0.3),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    const Text(
                      'Nhập tên và mô tả để Đoán', // Updated title
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF7E57C2)),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Chia sẻ tên và một chút về bản thân để khám phá nghề nghiệp độc đáo đang chờ đón!', // Updated hint
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    const SizedBox(height: 12),
                    // Ô nhập Tên
                    TextField(
                      controller: memberData.nameController,
                      decoration: const InputDecoration(
                        labelText: 'Tên',
                        hintText: 'Nhập tên người cần xem bói',
                        prefixIcon: Icon(Icons.person_outline),
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: memberData.descriptionController,
                      decoration: const InputDecoration(
                        labelText: 'Mô tả bản thân (tùy chọn)',
                        hintText: 'Bạn thích làm gì? Sở thích, cá tính...',
                        prefixIcon: Icon(Icons.description_outlined),
                        alignLabelWithHint: true, 
                      ),
                      maxLines: 3,
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        ElevatedButton.icon(
                          onPressed: memberData.predictJob,
                          icon: const Icon(Icons.auto_awesome),
                          label: const Text('Dự đoán ngay'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),
              const Text(
                'Kết quả dự đoán nghề nghiệp',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Consumer<MemberData>(
                builder: (BuildContext context, MemberData memberData, Widget? child) {
                  if (memberData.members.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.psychology_alt_outlined,
                            size: 60,
                            color: Colors.grey.shade400,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Chưa có ai được Đoán',
                            style: TextStyle(
                                fontSize: 16, color: Colors.grey.shade600),
                          ),
                        ],
                      ),
                    );
                  }
                  return ListView.builder(
                    shrinkWrap: true, 
                    physics: const NeverScrollableScrollPhysics(), 
                    itemCount: memberData.members.length,
                    itemBuilder: (BuildContext context, int index) {
                      final Member member = memberData.members[index];
                      return MemberCard(member: member);
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MemberCard extends StatelessWidget {
  final Member member;

  const MemberCard({
    required this.member,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start, // Align top for multiline text
          children: <Widget>[
            CircleAvatar(
              radius: 28,
              backgroundColor: member.avatarColor,
              child: Text(
                member.name[0].toUpperCase(),
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    member.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF7E57C2),
                    ),
                  ),
                  const SizedBox(height: 4), 
                  Text(
                    'Mô tả: ${member.description}', 
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      color: const Color(0xFFB39DDB).withOpacity(0.2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      'Nghề nghiệp: ${member.funnyJob}',
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF7E57C2),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
<<<<<<< HEAD
=======
      body: Column(
        children: const [
          Text('Nhập:'),
          const SizedBox(height: 16),
          TextField(
            decoration: const InputDecoration(
              labelText: 'Họ và tên',
              hintText: 'tên bạn',
              prefixIcon: Icon(Icons.person),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                borderSide: BorderSide(
                  color: Color.fromARGB(255, 238, 6, 6),
                  width: 2,
                ),
              ),
            ),
          ),
          TextField(
            decoration: const InputDecoration(
              labelText: 'Mô tả',
              prefixIcon: Icon(Icons.description_outlined),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                borderSide: BorderSide(
                  color: Color.fromARGB(255, 238, 6, 6),
                  width: 2,
                ),
              ),
            ),
          ),
        ],
      ),
>>>>>>> d7e9a4ed204a2613b95dab1a0e01c8c6d93ac84b
    );
  }
}
