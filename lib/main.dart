import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:minimal_todo_list_app/pages/top_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  ThemeData lightTheme(ColorScheme? lightColorScheme) {
    final scheme = lightColorScheme ??
        ColorScheme.fromSeed(
            seedColor: const Color(0xffdbd3c7)
        );
    return ThemeData(
      colorScheme: scheme,
    );
  }

  ThemeData darkTheme(ColorScheme? darkColorScheme) {
    final scheme = darkColorScheme ??
        ColorScheme.fromSeed(
            seedColor: const Color(0xffdbd3c7)
        );
    return ThemeData(
      colorScheme: scheme,
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
        builder: (ColorScheme? lightDynamic,
        ColorScheme? darkDynamic) {
          return MaterialApp(
            theme: lightTheme(lightDynamic),
            darkTheme: darkTheme(darkDynamic),
            home: const TopPage(),
          );
        },
    );
  }
}