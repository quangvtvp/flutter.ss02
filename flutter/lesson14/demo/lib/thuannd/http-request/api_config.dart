// =============================================================================
// API CONFIG - Cấu hình API
// =============================================================================
// Tách riêng cấu hình để:
// - Dễ thay đổi khi deploy lên production
// - Không lặp lại URL và API key ở nhiều nơi
// - Bảo mật hơn (có thể đọc từ environment variables)
// =============================================================================

class ApiConfig {
  // Base URL của API
  static const String baseUrl =
      'https://izbvwgyrqnilggqzdnht.supabase.co/rest/v1';

  // API Key để xác thực
  static const String apiKey =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Iml6YnZ3Z3lycW5pbGdncXpkbmh0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjkyNjI4MTEsImV4cCI6MjA4NDgzODgxMX0.HEBj_6mLEEJhx4PsAf7cxAXW05mgz5t8GeArigXW6lc';

  // App key của bạn - ĐỔI TÊN CỦA BẠN Ở ĐÂY
  static const String appKey = 'student_name';
}
