import 'dart:convert';
import 'package:get/get.dart';
import "package:guideram/globalvariables.dart" as globals;
import "package:http/http.dart" as http;
import '../model/Expert.dart';
import '../model/ListFreeTime.dart';

class VisitedExpertController extends GetxController {
  var isLoading = true.obs;
  Expert? expert;
  late int id;
  late dynamic freeTime;
  VisitedExpertController(this.id);

  Future <void> onInit() async {
    super.onInit();
    fetchExpert(id);
    getListFree(id);
  }
  fetchExpert(int id)async{
    try {
      http.Response response = await http.get(
          Uri.parse("${globals.Uri}/api/expert/$id")!,
          headers: {"Authorization": "Bearer ${globals.tokken}"});
      print(response.statusCode);

      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        expert = Expert.fromJson(result["data"]);
        print(expert!.name);
      }
      else {
        print("error fetching code");
      }
    } catch (e) {
      print("error while getting data is ${e}");
    }
    finally {
      isLoading(false);
    }

  }
  getListFree(int id)async{
    try {
      http.Response response = await http.get(
          Uri.parse("${globals.Uri}/api/expert/free_time/$id")!,
          headers: {"Authorization": "Bearer ${globals.tokken}"});
      print(response.statusCode);
      var result = jsonDecode(response.body);

      print(result["sun"]);

      if (response.statusCode == 200) {
        freeTime=result;
        print(freeTime);
      }
      else {
        print("error fetching code");
      }
    } catch (e) {
      print("error while getting data is ${e}");
    }
    finally {
      isLoading(false);
    }
  }
  book(String day,int from) async{
    try {
      Map<String,int> dayMap={
        "Sunday":1,
        "Monday":2,
        "Tuesday":3,
        "Wednesday":4,
        "Thursday":5,
        "Friday":6,
        "Saturday":7,
      };
      isLoading(true);
      final headers = {"Authorization": "Bearer ${globals.tokken}","Accept":" application/json"};
      var response = await http.post(
          Uri.parse("${globals.Uri}/api/expert/booking/$id"),
          body:{
            "day":dayMap[day].toString(),
            "from":from.toString(),
          },
          headers: headers
      );
      print(response.statusCode);
      var responseData = json.decode(response.body);
      print (responseData);
      Get.snackbar(
        "Info",
        responseData["message"],
        snackPosition: SnackPosition.BOTTOM,
      );
      print ("hgjkl;jkl;jghjkl;");


    } catch (e) {
      print(e);
    }
    finally {
      isLoading(false);
    }
  }
}