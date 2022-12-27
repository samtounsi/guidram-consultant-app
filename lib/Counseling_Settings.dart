import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:guideram/Expert_profile.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class Counseling_Settings extends StatefulWidget {
  const Counseling_Settings({Key? key}) : super(key: key);

  @override
  State<Counseling_Settings> createState() => _Counseling_SettingsState();
}

class Counseling {
  final int id;
  final String name;

  Counseling({
    required this.id,
    required this.name,
  });
}
class _Counseling_SettingsState extends State<Counseling_Settings> {

  var PriceController = TextEditingController();
  var DurationController = TextEditingController();
  final multiSelectKey = GlobalKey<FormFieldState>();

  static List<Counseling> con = [
    Counseling(id: 1, name: "Medical"),
    Counseling(id: 2, name: "Professional "),
    Counseling(id: 3, name: "Psychological"),
    Counseling(id: 4, name: "Family"),
    Counseling(id: 5, name: " business "),
  ];

  final _items = con
      .map((Con) => MultiSelectItem<Counseling>(Con, Con.name))
      .toList();
 List<Counseling> selectedCounseling = [];

  @override
  void initState() {
  selectedCounseling = [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[800],
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            //Navigation
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return expert_profile();
            }));
          },
        ),
        title: Text(
          'Counseling Settings',
          style: TextStyle(
            color: Colors.white,
            fontSize: 17.0,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Expanded(
          child: SingleChildScrollView(
            child: Form(
              child: Column(
                children: [
                  TextFormField(
                    maxLines: 1,
                    controller: PriceController,
                    keyboardType: TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                    onFieldSubmitted: (String value) {
                      print(value);
                    },
                    validator: (value) {
                      /*RegExp regExp = new RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)');
                      if (value != null && value.isEmpty) {
                        return "Price of session can't be empty";
                      }
                      RegExp regExp = new RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)');
                      if (value<0 && value>10000) {
                        return "Price of session can't be empty";
                      }
                      if (!regExp.hasMatch(value)) {
                        return 'Please enter valid number';
                      }*/
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Price of session',
                      border: OutlineInputBorder(
                        gapPadding: 5.0,
                      ),
                      prefixIcon: Icon(
                        color: Colors.purple[800],
                        Icons.monetization_on_outlined,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height:30.0,
                  ),
                  TextFormField(
                    maxLines: 1,
                    controller: DurationController,
                    keyboardType: TextInputType.datetime,
                    onFieldSubmitted: (String value) {
                      print(value);
                    },
                    validator: (String? value) {
                      if (value != null && value.isEmpty) {
                        return "Duration of session can't be empty";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Duration of session',
                      border: OutlineInputBorder(
                        gapPadding: 5.0,
                      ),
                      prefixIcon: Icon(
                        color: Colors.purple[800],
                        Icons.access_time,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height:30.0,
                  ),
                  MultiSelectDialogField(
                    onConfirm: (val) {
                      selectedCounseling= val;
                    },
                    buttonText: Text(
                      'Select the type of consultation',
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 16,
                    ),
                    ),
                    selectedColor: Colors.purple[900],
                   buttonIcon:Icon(
                       Icons.arrow_drop_down,
                     color:Colors.purple[800] ,
                   ) ,
                    items: _items,
                    initialValue:
                    selectedCounseling, // setting the value of this in initState() to pre-select values.
                  ),
                  const SizedBox(
                    height:30.0,
                  ),
              ],
            ),
          ),
    ),
      ),
      ),
    );
  }
}
