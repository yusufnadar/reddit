import 'package:flutter/material.dart';
import 'src/core/constants/theme/theme_constants.dart';
import 'src/core/exports/constants_exports.dart';
import 'src/core/services/navigation/navigation_route.dart';
import 'src/core/services/navigation/navigation_service.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: MaterialApp(
        title: AppConstants.appName,
        debugShowCheckedModeBanner: false,
        theme: ThemeConstants.lightTheme,
        darkTheme: ThemeConstants.darkTheme,
        initialRoute: NavigationConstants.home,
        onGenerateRoute: NavigationRoute.instance.generateRoute,
        navigatorKey: NavigationService.instance.navigatorKey,
      ),
    );
  }
}

