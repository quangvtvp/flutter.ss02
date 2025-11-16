import 'dart:html' as html;

Future<String?> readBrowserStringImpl(String key) async {
  return html.window.localStorage[key];
}

Future<void> writeBrowserStringImpl(String key, String? value) async {
  if (value == null || value.isEmpty) {
    html.window.localStorage.remove(key);
  } else {
    html.window.localStorage[key] = value;
  }
}
