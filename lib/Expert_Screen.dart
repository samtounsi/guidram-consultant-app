import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:guideram/Main_Screen.dart';
import 'package:guideram/choose.dart';
import 'package:image_picker/image_picker.dart';

class Expert_Screen extends StatefulWidget {
  @override
  State<Expert_Screen> createState() => _Expert_ScreenState();
}

class _Expert_ScreenState extends State<Expert_Screen> {
  var NameController = TextEditingController();

  var phoneController = TextEditingController();

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var AddressController = TextEditingController();

  var ExperienceController = TextEditingController();

  var FormKey = GlobalKey<FormState>();
  bool _obscureText = true;

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      debugPrint('image picked successfully');
      return imageTemp;
    } on PlatformException catch (e) {
      debugPrint('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    var vendorProfile;
    var SvgPicture;
    var image;
    var apiUrl;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[800],
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
//Navigation
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return choose();
            }));
          },
        ),
        titleSpacing: 10.0,
        title: Text(
          'Sign up as an Expert',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Expanded(
          child: SingleChildScrollView(
            child: Form(
              key: FormKey,
              child: Column(
                children: [
                  Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
                      /*const CircleAvatar(
                        radius: 50.0,
                        backgroundImage:
                        AssetImage('assets/images/profile.png'),
                      ),*/
                      Container(
                        width: 95,
                        height: 95,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: const Color(0xffE6E6E6),
                          border: Border.all(color: const Color(0xff707070)),
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          color: Colors.purple[800],
                          Icons.camera_alt_outlined,
                          size: 28.0,
                        ),
                        onPressed: () {
                          pickImage();
                        },
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    maxLines: 1,
                    controller: NameController,
                    keyboardType: TextInputType.name,
                    onFieldSubmitted: (String value) {
                      print(value);
                    },
                    validator: (String? value) {
                      if (value != null && value.isEmpty) {
                        return "Your name can't be empty";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Name',
                      border: OutlineInputBorder(
                        gapPadding: 5.0,
                      ),
                      prefixIcon: Icon(
                        color: Colors.purple[800],
                        Icons.perm_identity_outlined,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  TextFormField(
                    maxLines: 1,
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                    onFieldSubmitted: (String value) {
                      print(value);
                    },
                    validator: (String? value) {
                      if (value != null && value.isEmpty) {
                        return "Your phone number can't be empty";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                      border: OutlineInputBorder(
                        gapPadding: 5.0,
                      ),
                      prefixIcon: Icon(
                        color: Colors.purple[800],
                        Icons.phone_android,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  TextFormField(
                    maxLines: 1,
                    controller: AddressController,
                    keyboardType: TextInputType.streetAddress,
                    onFieldSubmitted: (String value) {
                      print(value);
                    },
                    validator: (String? value) {
                      if (value != null && value.isEmpty) {
                        return "Your address can't be empty";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Address',
                      fillColor: Colors.white,
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black45),
                      ),
                      //  labelStyle: TextStyle(color: Colors.purple),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black45),
                      ),
                      prefixIcon: Icon(
                        color: Colors.purple[800],
                        Icons.maps_home_work_outlined,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  TextFormField(
                    maxLines: 1,
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    onFieldSubmitted: (String value) {
                      print(value);
                    },
                    validator: (String? value) {
                      RegExp regex = RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                      r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                      r"{0,253}[a-zA-Z0-9])?)*$");
                      if (value != null && value.isEmpty) {
                        return "Your email can't be empty";
                      }
                      if ( !regex.hasMatch(value!)){
                        return 'Enter a valid email address';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Email Address',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(
                        color: Colors.purple[800],
                        Icons.email_outlined,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  TextFormField(
                    maxLines: 1,
                    controller: passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: _obscureText,
                    validator: (Value){
                      RegExp regex=RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$');
                      var passValue=Value??"";
                      if(passValue.isEmpty){
                        return ("Password is required");
                      }
                      else if(passValue.length<6){
                        return ("Password Must be more than 5 characters");
                      }
                      else if(!regex.hasMatch(passValue)){
                        return ("Password should contain upper,lower and digit character ");
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'password',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(
                        color: Colors.purple[800],
                        Icons.lock_outline_rounded,
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.purple[800],
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  TextFormField(
                    maxLines: 3,
                    controller: ExperienceController,
                    keyboardType: TextInputType.text,
                    onFieldSubmitted: (String value) {
                      print(value);
                    },
                    validator: (String? value) {
                      if (value != null && value.isEmpty) {
                        return "Your experience can't be empty";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Experiences in detail',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(
                        color: Colors.purple[800],
                        Icons.description_outlined,
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 25.0,
                  ),
                  Container(
                    width: 100.0,
                    child: MaterialButton(
                      height: 20.0,
                      onPressed: () {
                        if (FormKey.currentState!.validate()) {
                          print(emailController.text);
                          print(NameController.text);
                          print(phoneController.text);
                          print(AddressController.text);
                          print(passwordController.text);
                          print(ExperienceController.text);
                          //Navigation
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return Main_Screen();
                          }));
                        }
                      },
                      child: Text(
                        'Sign up',
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
