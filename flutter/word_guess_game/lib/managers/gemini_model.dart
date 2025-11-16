/// Gemini model identifiers aligned with the official Gemini API model catalog.
/// See: https://ai.google.dev/gemini-api/docs/models
enum GeminiModel {
  gemini25Pro('gemini-2.5-pro'),
  gemini25Flash('gemini-2.5-flash'),
  gemini25FlashLite('gemini-2.5-flash-lite'),
  gemini20Flash('gemini-2.0-flash'),
  gemini20FlashLite('gemini-2.0-flash-lite'),
  gemini15Pro('gemini-1.5-pro'),
  gemini15Flash('gemini-1.5-flash'),
  gemini15Flash8B('gemini-1.5-flash-8b');

  const GeminiModel(this.id);

  final String id;
}
