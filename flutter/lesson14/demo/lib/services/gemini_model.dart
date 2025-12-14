// Enum để chọn model Gemini
// Dễ dàng chuyển đổi giữa các model khác nhau

enum GeminiModel {
  // Gemma models - free tier friendly
  gemma3_27b('gemma-3-27b-it', 'Gemma 3 27B - Mạnh, nhiều quota'),
  gemma3_12b('gemma-3-12b-it', 'Gemma 3 12B - Cân bằng'),
  gemma3_4b('gemma-3-4b-it', 'Gemma 3 4B - Nhẹ, nhanh'),
  // Gemini models
  gemini25Flash(
      'gemini-2.5-flash', 'Gemini 2.5 Flash - Model mới nhất, chất lượng cao'),
  gemini25Pro('gemini-2.5-pro', 'Gemini 2.5 Pro - Model mạnh nhất'),
  geminiFlash('gemini-2.0-flash',
      'Gemini 2.0 Flash - Nhanh, phù hợp cho hầu hết tác vụ'),
  geminiPro(
      'gemini-1.5-pro', 'Gemini 1.5 Pro - Mạnh, phù hợp cho tác vụ phức tạp'),
  geminiFlash8b(
      'gemini-1.5-flash-8b', 'Gemini 1.5 Flash 8B - Nhẹ, tiết kiệm quota');

  final String modelId;
  final String description;

  const GeminiModel(this.modelId, this.description);
}
