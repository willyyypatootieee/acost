import 'package:flutter/material.dart';
import '../core/theme/app_theme.dart';
import './app_route.dart';

class AcostApp extends StatelessWidget {
  const AcostApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Acost',
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: ThemeMode.system,
      initialRoute: AppRoutes.splash,
      routes: AppRoutes.map,
    );
  }
}
