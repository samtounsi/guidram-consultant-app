
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guideram/model/Appointment.dart';
import 'package:guideram/model/Expert.dart';
import "package:guideram/globalvariables.dart" as globals;
import "package:http/http.dart" as http;

import '../Main_Screen.dart';

class AuthController extends GetxController{
  var isLoading=false.obs;
   var isAuth=false.obs;

  String stateToken="";
  int stateId=0;
  bool isExpert=false;



login(String email,String password,BuildContext context)async{
  try{
    isLoading(true);
    var response = await http.post(Uri.parse('${globals.Uri}/api/login'),body: {
      'email' : email,
      "password" : password
    });
  print(response.body);
    var responseData = json.decode(response.body);
    if(responseData['token'] != null) {
      var token = responseData['token'];
      isAuth(true);

      //  store in some state management
      globals.tokken=token;
      stateToken=token;
      stateId=responseData['user_id'];
      isExpert=responseData['is_expert'];
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) {
        return Main_Screen();
      }));
    } else {
      print("errrrrrrrrrrr");
      isAuth(false);
    }
  }catch(e){
    print(e);
  }
  finally{
    isLoading(false);
  }
}

CreateUser(String name,String phone,String email,String password,BuildContext context)async{
  try {
    isLoading(true);
    var response = await http.post(Uri.parse("${globals.Uri}/api/user/register"), body: {
      'name': name,
      'phone': phone,
      "email": email,
      "password":password,
    });
  print(response.statusCode);
    var responseData = json.decode(response.body);
    if( responseData['token']!=null) {
      String token = responseData['token'];

      isAuth(true);
      globals.tokken=token;
      stateToken=token;
      stateId=responseData['user_id'];
      isExpert=responseData['is_expert'];
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) {
        return Main_Screen();
      }));
    } else {
      print("err");
    }
  } catch (e) {
    print(e);
  }
  finally{
    isLoading(false);
  }
}
  CreateExpert(String name,String phone,String email,String password,String experience,String address,BuildContext context)async{

    try {
      isLoading(true);
      var response = await http.post(Uri.parse("${globals.Uri}/api/expert/register"), body: {
        'name': name,
        'phone': phone,
        "email": email,
        "password":password,
        "address":address,
        "experience":experience
      });

      var responseData = json.decode(response.body);
      print(responseData);
      if( responseData['token']!=null) {
        String token = responseData['token'];

        isAuth(true);
        globals.tokken=token;
        stateToken=token;
        stateId=responseData['user_id'];
        isExpert=responseData['is_expert'];


        //navigation
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) {
          return Main_Screen();
        }));


      } else {
        print("err");
      }
    } catch (e) {
      print(e);
    }
    finally{
      isLoading(false);
    }
  }
}