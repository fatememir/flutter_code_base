import 'package:flutter/material.dart';

import '../router/router.dart';
import '../themes/app_theme.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Code Base',
      // router
      routerDelegate: AppRouter.router.routerDelegate,
      routeInformationParser: AppRouter.router.routeInformationParser,
      routeInformationProvider: AppRouter.router.routeInformationProvider,
      // theme
      theme: CustomTheme.lightTheme,
      darkTheme: CustomTheme.darkTheme,
      // language
      locale: const Locale('en', ''),
    );
  }
}
