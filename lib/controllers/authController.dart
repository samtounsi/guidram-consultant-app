
import 'dart:convert';

import 'package:get/get.dart';
import 'package:guideram/model/Appointment.dart';
import 'package:guideram/model/Expert.dart';
import "package:guideram/globalvariables.dart" as globals;
import "package:http/http.dart" as http;

class AuthController extends GetxController{
  var isLoading=false.obs;
   var isAuth=false.obs;

  String stateToken="";
  int stateId=0;
  bool isExpert=false;
login(String email,String password)async{
  try{
    isLoading(true);
    var response = await http.post(Uri.parse('${globals.Uri}/api/login'),body: {
      'email' : email,
      "password" : password
    });
  print(response.body);
    var responseData = json.decode(response.body);
    var token = responseData['token'];
    if(token!=null) {
      //  store in some state management
      globals.tokken=token;
      stateToken=token;
      stateId=responseData['user_id'];
      isExpert=responseData['is_expert'];
      print(stateId);
      print(isExpert);
      isAuth(true);
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

CreateUser(){
}
}