import 'package:flutter/material.dart';

import 'presentation/screens/home_movie_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeMoviePage(),
      theme: ThemeData(brightness: Brightness.dark, primaryColor: Colors.red),
    );
  }
}

