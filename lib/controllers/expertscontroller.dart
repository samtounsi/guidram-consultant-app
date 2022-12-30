import 'package:guideram/model/Experts.dart';
import "package:guideram/globalvariables.dart" as globals;
import "package:http/http.dart" as http;
import 'dart:convert';

import 'package:get/get.dart';

class ExpertsController extends GetxController {
  var isLoading=false.obs;
  var experts=<Experts>[];
  String  type="";
  ExpertsController(this.type);

  @override
  Future <void>onInit() async{

    super.onInit();
    fetchListExpert(type);
  }
    fetchListExpert(String type)async{
      try{
        print(type);
        isLoading(true);
        http.Response response=await http.get(Uri.parse("${globals.Uri}/api/experts/${type}")!,headers: {"Authorization":"Bearer 1|odJDvU0Hbh5R3pbbUDd4MaQSWKCprfCGSXAAx5kn"});
        if(response.statusCode==200){
          var result=jsonDecode(response.body);
          result["data"].forEach((ex)=>
              experts.add(Experts.fromJson(ex))
          );
          // print(experts.first);
          // experts.add()

          // print(experts);

          // expert=Expert.fromJson(result);

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

