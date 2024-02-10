import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyImageToggleScreen(),
    );
  }
}

class MyImageToggleScreen extends StatefulWidget {
  const MyImageToggleScreen({super.key});

  @override
  _MyImageToggleScreenState createState() => _MyImageToggleScreenState();
}

class _MyImageToggleScreenState extends State<MyImageToggleScreen> {
  bool isImageToggled = false;

  void toggleImageColor() {
    setState(() {
      isImageToggled = !isImageToggled;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Toggle Example'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: toggleImageColor,
          child: ClipRect(
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(
                Colors.blue, // Change the color to fill the internal area
                isImageToggled ? BlendMode.srcATop : BlendMode.srcIn,
              ),
              child: Image.asset(
                'assets/images/heart.png',
                height: 100,
                width: 100,
                color: const Color(0xff5C5D67),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
