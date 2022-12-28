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
  var FormKey = GlobalKey<FormState>();
  final multiSelectKey = GlobalKey<FormFieldState>();
  var selectedtime = 1;

  static List<Counseling> con = [
    Counseling(id: 1, name: "Medical"),
    Counseling(id: 2, name: "Professional"),
    Counseling(id: 3, name: "Psychological"),
    Counseling(id: 4, name: "Family"),
    Counseling(id: 5, name: "business"),
  ];
  String? selectedValue;

  List<DropdownMenuItem<String>> get dropdownItems{
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("1 hour"),value:'1'),
      DropdownMenuItem(child: Text("2 hours"),value:'2'),
      DropdownMenuItem(child: Text("3 hours"),value:'3'),
    ];
    return menuItems;
  }


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
              key: FormKey,
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
                      double? num = double.tryParse(value.toString());
                      if(num == null)
                        return "Price of session can't be empty";
                      else if( num > 5)
                        return 'Please enter value between 1 and 10.000';

                     /*if (value?.length!<0 || value?.length>5 ) {
                        return "Enter a valid price";
                      }*/
                     /* RegExp regExp = new RegExp(r'(/^([1-9]{1,2}|10000)$/)');
                      if (!regExp.hasMatch(value!)) {
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
                    height:35.0,
                  ),
                 /* TextFormField(
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
                  ),*/
                  DropdownButtonFormField(
                      decoration: InputDecoration(
                        labelText: 'Select the duration of the session',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.purple.shade800, width: 2),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.purple.shade800, width: 2),
                        ),
                        filled: true,
                        fillColor: Colors.white
                      ),
                      validator: (value) => value == null ? "Select a time" : null,
                     // dropdownColor:,
                      value: selectedValue,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedValue = newValue!;
                        });
                      },
                      items: dropdownItems),
                  const SizedBox(
                    height:35.0,
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
                  /*Container(
                    width: 100.0,
                    child: MaterialButton(
                      height: 20.0,
                      onPressed: () {
                        if (FormKey.currentState!.validate()) {
                          print(PriceController.text);
                          print(DurationController.text);
                        }
                      },
                      child: Text(
                        'Next',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                          //fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      // borderRadius: BorderRadius.circular(20.0),
                      color: Colors.purple[800],
                    ),
                  ),*/
                  Row(
                    children: [

                    ],
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
