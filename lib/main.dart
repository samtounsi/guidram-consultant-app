import 'package:flutter/material.dart';
import 'package:guideram/choose.dart';
import 'package:guideram/signup.dart';

import 'login.dart';

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
      theme: ThemeData(
        colorScheme: ThemeData().colorScheme.copyWith(
              primary: const Color.fromARGB(255, 127, 15, 218),
            ),
      ),
      title: 'Guideram',
      initialRoute: '/login',
      routes: {
        //'/':(context) => ,
        //'/home' :(context) => ,
        '/login': (context) => const LoginPage(title: ''),
        '/signup': (context) => const RegisterPage1(title: ''),
        '/users': (context) => const RegisterPage(title: '')
      },
    );
  }
}
