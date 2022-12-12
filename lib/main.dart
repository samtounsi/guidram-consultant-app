import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
        appBarTheme: AppBarTheme(
          backwardsCompatibility: false,
          systemOverlayStyle:SystemUiOverlayStyle(
            statusBarColor: Colors.white38,
            statusBarIconBrightness: Brightness.dark,
          ),
        ),
        colorScheme: ThemeData().colorScheme.copyWith(
          primary: Colors.purple[800],
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
