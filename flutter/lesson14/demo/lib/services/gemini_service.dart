import 'dart:convert';
import 'package:http/http.dart' as http;

import '../config/app_config.dart';
import 'gemini_model.dart';

// Service gọi Gemini API
// Dùng chung cho tất cả học viên

class GeminiService {
  // Model mặc định - thay đổi ở đây nếu bị hết quota
  static const GeminiModel defaultModel = GeminiModel.gemma3_27b;

  // Gợi ý ngành học dựa trên đặc điểm
  static Future<String> suggestMajor({
    required String name,
    required String description,
    GeminiModel model = defaultModel,
  }) async {
    final prompt = '''
Bạn là một chuyên gia tư vấn hướng nghiệp cho học sinh Việt Nam.

Thông tin học sinh:
- Tên: $name
- Đặc điểm: $description

Dựa trên đặc điểm trên, hãy gợi ý 2-3 ngành học phù hợp ở bậc đại học.
Trả lời ngắn gọn, thân thiện, bằng tiếng Việt.
Bắt đầu bằng: "Chào $name, rất vui được tư vấn cho em. Với những đặc điểm của $name thì..."
''';

    return await _callGemini(prompt, model);
  }

  // Hàm gọi Gemini API
  static Future<String> _callGemini(String prompt, GeminiModel model) async {
    final url = Uri.parse(
      '${AppConfig.geminiBaseUrl}/models/${model.modelId}:generateContent?key=${AppConfig.geminiApiKey}',
    );

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'contents': [
          {
            'parts': [
              {'text': prompt}
            ]
          }
        ],
        'generationConfig': {
          'temperature': 0.7,
          'maxOutputTokens': 2048,
        }
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final text = data['candidates']?[0]?['content']?['parts']?[0]?['text'];
      return text ?? 'Không thể phân tích. Vui lòng thử lại.';
    } else {
      throw Exception('Lỗi API: ${response.statusCode} - ${response.body}');
    }
  }
}
