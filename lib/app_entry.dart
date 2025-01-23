import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';
import 'package:wst/generated/l10n.dart';
import 'package:wst/navigation/app_router.dart';
import 'package:wst/solution_injection.dart';
import 'package:wst/domain/repository/solution_repository_interface.dart';
import 'package:wst/test2.dart';

class AppEntry extends StatelessWidget {
  AppEntry({super.key}) : _router = AppRouter();

  final AppRouter _router;

  Future<Locale> getLocale(BuildContext buildContext) async => const Locale('en');

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return MultiProvider(
      providers: SolutionInjection.getDiList(context),
      child: Builder(
        builder: (BuildContext context) {
          return LocalizationProvider(
            future: getLocale(context),
            builder: (context, locale) {
              return MaterialApp.router(
                title: 'Silverstone',
                routerDelegate: _router.delegate(),
                routeInformationParser: _router.defaultRouteParser(),
                localizationsDelegates: const [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: S.delegate.supportedLocales,
                locale: const Locale("en_US"),
              );
            },
          );
        },
      ),
    );
  }
}
