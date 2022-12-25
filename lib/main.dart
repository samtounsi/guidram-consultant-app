import 'package:flutter/material.dart';
import 'package:guideram/Booked_appointments.dart';
import 'package:guideram/Error_Screen.dart';
import 'package:guideram/Expert_profile.dart';
import 'package:guideram/signup.dart';
/*import 'package:guideram/Consulting%20pages/Business_and_management.dart';
import 'package:guideram/Consulting%20pages/Medical.dart';
import 'package:guideram/Error_Screen.dart';
import 'package:guideram/Expert_Screen.dart';
import 'package:guideram/Expert_profile.dart';
import 'package:guideram/Main_Screen.dart';
import 'package:guideram/shared/network/remote/dio_helper.dart';
import 'package:guideram/signup.dart';*/
import 'login.dart';

void main() {
  
  runApp( MyApp());
}

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      home: Booked_appointments(),
      theme: ThemeData(
        colorScheme: ThemeData().colorScheme.copyWith(
          primary: Colors.purple[800],
        ),
      ),
    );
  }
}
