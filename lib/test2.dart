import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

typedef LocalizationBuilder = Widget Function(BuildContext, Locale?);

class LocalizationProvider extends StatelessWidget {
  const LocalizationProvider({
    super.key,
    required this.builder,
    required this.future,
  });

  final LocalizationBuilder builder;
  final Future<Locale?> future;

  static ValueNotifier<Locale?> of(BuildContext context) => context.read<ValueNotifier<Locale?>>();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (context, result) {
        if (result.hasData) {
          final locale = result.data;
          return ListenableProvider<ValueNotifier<Locale?>>(
            create: (context) => ValueNotifier<Locale?>(locale),
            builder: (context, _) {
              final locale = context.watch<ValueNotifier<Locale?>>().value;
              return builder(context, locale);
            },
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
