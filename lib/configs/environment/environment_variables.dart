abstract class EnvironmentVariables {

  // to add a new config and set the default value you can run this --dart-define=variable name=value

  static String environmentValue = const String.fromEnvironment('ENV', defaultValue: 'uat');
}
