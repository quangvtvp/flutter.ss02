import 'browser_storage_stub.dart'
    if (dart.library.html) 'browser_storage_web.dart';

Future<String?> readBrowserString(String key) {
  return readBrowserStringImpl(key);
}

Future<void> writeBrowserString(String key, String? value) {
  return writeBrowserStringImpl(key, value);
}
