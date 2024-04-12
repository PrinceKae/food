
import 'package:flutter/material.dart';
import 'package:food/data/dummy_data.dart';
import 'package:food/screens/meals.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:food/screens/categories.dart';


final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 78, 222, 210),
  ),
  textTheme: GoogleFonts.latoTextTheme(),
);

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: const CategoriesScreen(),
    );
  }
}
