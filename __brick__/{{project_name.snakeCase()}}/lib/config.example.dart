class Environments {
  static const String production = 'prod';
  static const String staging = 'staging';
  static const String develop = 'dev';
  static const String local = 'local';
}

class ConfigEnvironments {
  static String get getCurrentEnviroment => _currentEnvironments;

  static const String _currentEnvironments = Environments.production;
  static const List<Map<String, String>> _availableEnvironments = [
    {
      'env': Environments.local,
      'url': 'http://192.168.0.2:5000/api/',
    },
    {
      'env': Environments.develop,
      'url': '',
    },
    {
      'env': Environments.staging,
      'url': '',
    },
    {
      'env': Environments.production,
      'url': 'https://api-ekko.herokuapp.com/api/',
    },
  ];

  static Map<String, String> getEnvironments() {
    return _availableEnvironments.firstWhere(
      (d) => d['env'] == _currentEnvironments,
    );
  }
}
