import 'package:flutter/material.dart';
import 'package:matha_nosto_project/views/screens/social_media_screens/home_screen.dart';
import 'package:matha_nosto_project/views/screens/social_media_screens/post_details_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}
