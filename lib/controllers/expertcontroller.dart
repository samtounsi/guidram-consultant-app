
import 'dart:convert';

import 'package:get/get.dart';
import 'package:guideram/model/Expert.dart';
import 'package:guideram/model/Experts.dart';
import "package:guideram/globalvariables.dart" as globals;
import "package:http/http.dart" as http;

class ExpertController extends GetxController{
var isLoading=false.obs;
Expert? expert;




fetchExpert(int id)async{
  try{
    isLoading(true);
      http.Response response=await http.get(Uri.parse("${globals.Uri}/api/expert/${id}")!,headers: {"Authorization":"Bearer 1|odJDvU0Hbh5R3pbbUDd4MaQSWKCprfCGSXAAx5kn"});
    if(response.statusCode==200){
      var result=jsonDecode(response.body);
      expert=Expert.fromJson(result["data"]);

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
