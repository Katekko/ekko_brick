import 'package:flutter/services.dart' show rootBundle;

abstract class MockUtil {
  static Future<String> getMockFile(String path) async {
    try {
      final mock = await rootBundle.loadString(path);
      return mock;
    } catch (err) {
      rethrow;
    }
  }
}
