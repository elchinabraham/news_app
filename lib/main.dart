import 'package:flutter/material.dart';
import 'package:news_app/screens/home_screen.dart';
import 'package:provider/provider.dart';

import 'providers/theme_mode.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeModeNotifier()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        colorScheme: const ColorScheme.light(
          primary: Colors.black87,
        ),
      ),
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: const ColorScheme.dark(
          primary: Colors.white,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
              const Color.fromARGB(11, 34, 33, 33),
            ),
          ),
        ),
      ),
      themeMode: ThemeMode
          .system, //context.watch<ThemeModeNotifier>().currentThemeMode,
      home: const HomeScreen(),
    );
  }
}
