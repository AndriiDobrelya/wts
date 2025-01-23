import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:wst/app_entry.dart';

void main(List<String> args) async {
  await configureApp();
  runApp(AppEntry());
}

Future configureApp() async {
  final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  try {} catch (exception, stackTrace) {}
}
