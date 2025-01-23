// ignore_for_file: constant_identifier_names

enum EnvironmentType { PROD, DEV }

class AppConfig {
  /// Used in case environment identifier wasn't provided or incorrect
  EnvironmentType defaultEnvironment = EnvironmentType.DEV;

  /// Set of environment data sets.
  Map<EnvironmentType, EnvironmentValues> get environmentsData => {
        EnvironmentType.DEV: const EnvironmentValues(
          portalUrl: 'https://dog.ceo',
          hiveBoxPrefix: 'dev_',
        ),
        EnvironmentType.PROD: const EnvironmentValues(
          portalUrl: 'https://dog.ceo',
          hiveBoxPrefix: 'prod_',
        ),
      };
}

// Object that enlists environment specific variables
class EnvironmentValues {
  const EnvironmentValues({
    required this.portalUrl,
    required this.hiveBoxPrefix,
  });

  final String portalUrl;
  final String hiveBoxPrefix;
}
