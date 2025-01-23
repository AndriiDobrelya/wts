import 'package:wst/configs/app_config.dart';

class EnvironmentHelper {
  EnvironmentHelper({
    required AppConfig appConfig,
    required String environmentValue,
  })  : _appConfig = appConfig,
        _environmentValue = environmentValue;

  final AppConfig _appConfig;
  final String _environmentValue;

  ///Map string environment identifier given as environment variable to appropriate enum value
  EnvironmentType currentEnvironment() {
    final env = _environmentValue.toLowerCase();
    switch (env) {
      case 'prod':
        return EnvironmentType.PROD;
      case 'dev':
        return EnvironmentType.DEV;
      default:
        return _appConfig.defaultEnvironment;
    }
  }
}
