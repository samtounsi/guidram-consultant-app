import 'dart:convert';
import 'package:get/get.dart';
import "package:guideram/globalvariables.dart" as globals;
import "package:http/http.dart" as http;
import '../model/Expert.dart';

class VisitedExpertController extends GetxController {
  var isLoading = true.obs;
  Expert? expert;
  late int id;
  VisitedExpertController(this.id);

  Future <void> onInit() async {
    super.onInit();
    fetchExpert(id);
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
}