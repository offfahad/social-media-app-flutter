import 'package:flutter/material.dart';
import 'package:social_media_app/screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Social UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 89, 89, 89),
        //useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}