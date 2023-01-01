
import 'dart:convert';

import 'package:get/get.dart';
import 'package:guideram/model/Appointment.dart';
import 'package:guideram/model/Expert.dart';
import "package:guideram/globalvariables.dart" as globals;
import "package:http/http.dart" as http;

class ExpertController extends GetxController{
  var isLoading=true.obs;
Expert? expert;
var expertAppointment=<Appointment>[];
late int id;
Expert?visitedExpert;
  ExpertController(this.id);


  Future <void>onInit() async{
    super.onInit();
    fetchExpert(id,false);
    fetchAppointments(id);
  }

fetchExpert(int id,bool isVisited)async{
  try{
    // isLoading(true);
      http.Response response=await http.get(Uri.parse("${globals.Uri}/api/expert/${id}")!,headers: {"Authorization":"Bearer ${globals.tokken}"});
    if(response.statusCode==200){
      var result=jsonDecode(response.body);
      if(isVisited){
        visitedExpert=Expert.fromJson(result["data"]);
      }else{
      expert=Expert.fromJson(result["data"]);
      }

    }
    else{
      print("error fetching code");

    }
  }catch(e){
    print("error while getting data is ${e}");
  }
  finally{
    isLoading(false);
  }
}

  fetchAppointments(int id)async{
    try{
      print("fetching");
      isLoading(true);
      http.Response response=await http.get(Uri.parse("${globals.Uri}/api/expert/appointments/${id}")!,headers: {"Authorization":"Bearer ${globals.tokken}"});
      print(response.statusCode);
      if(response.statusCode==200){
        expertAppointment.removeRange(0,expertAppointment.length);
        var result=jsonDecode(response.body);
        result["data"].forEach((ex) {
          expertAppointment.add(Appointment.fromJson(ex));
        });
      }
      else{
        print("error fetching code");

      }
    }catch(e){
      print("error while getting data is ${e}");
    }
    finally{
      isLoading(false);
    }
  }
}
