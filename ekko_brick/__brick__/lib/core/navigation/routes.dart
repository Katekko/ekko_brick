class Routes {
  static Future<String> get initialRoute async {
    try {
      return home;
    } catch (err) {
      return home;
    }
  }

  static const home = '/home';
}
