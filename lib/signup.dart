import 'dart:io';

import 'package:flutter/material.dart';
import 'package:guideram/Error_Screen.dart';
import 'package:guideram/Main_Screen.dart';
import 'package:guideram/choose.dart';
import 'package:image_picker/image_picker.dart';
import "package:http/http.dart" as http;
import 'dart:convert';
import "globalvariables.dart" as globals;

class User_Screen extends StatefulWidget {
  @override
  State<User_Screen> createState() => _User_ScreenState();
}

class _User_ScreenState extends State<User_Screen> {
  var NameController = TextEditingController();
  var phoneController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var FormKey = GlobalKey<FormState>();
  bool _obscureText = true;
  var uri = Uri.parse("${globals.Uri}/api/user/register");
  postRequest() async {
    try {
      var response = await http.post(uri, body: {
        'name': NameController.text,
        'phone': phoneController.text,
        "email": emailController.text,
        "password": passwordController.text,
      });

      var responseData = json.decode(response.body);
      String token = responseData['token'];
      if(!token.isEmpty) {
        globals.tokken = token;
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return Main_Screen();
        }));
      } else {
        print("err");
      }
    } catch (e) {
      print(e);
    }
  }

  isValid() {
    return FormKey.currentState!.validate();
  }

  XFile? image;

  final ImagePicker picker = ImagePicker();

  //we can upload image from camera or from gallery based on parameter
  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);

    setState(() {
      image = img;
    });
  }

  //show popup dialog
  void myAlert() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
      return AlertDialog(
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        title: Text('Please choose media to select'),
        content: Container(
          height: MediaQuery.of(context).size.height / 6,
          child: Column(
              children: [
              ElevatedButton(
              //if user click this button, user can upload image from gallery
              onPressed: () {
        Navigator.pop(context);
        getImage(ImageSource.gallery);
        },
          child: Row(
            children: [
              Icon(Icons.image),
              Text('From Gallery'),
            ],
          ),
        ),

                ElevatedButton(
                  //if user click this button. user can upload image from camera
                  onPressed: () {
                    Navigator.pop(context);
                    getImage(ImageSource.camera);
                  },
                  child: Row(
                    children: [
                      Icon(Icons.camera),
                      Text('From Camera'),
                    ],
                  ),
                ),
              ],
          ),
        ),
      );
        });
  }

  @override
  Widget build(BuildContext context) {
   /* if(globals.tokken!=""){
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return Main_Screen();
      }));
    }*/
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
          'Sign up as a User',
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
                 Column(
                    children: [
                      image != null
                          ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child:ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child:  Image.file(
                            //to show image, you type like this.
                            File(image!.path),
                            fit: BoxFit.cover,
                            width:110,
                            height:110,
                          ),
                        ),
                      )
                          :CircleAvatar(
                        radius:50.0,
                        backgroundImage:AssetImage('assets/images/user.png'),
                      ),
                      SizedBox(
                        height:  3.0,
                      ),
                      IconButton(
                        icon:Icon(
                          color: Colors.purple[800],
                          Icons.camera_alt,
                          size: 28.0,
                        ),
                        onPressed: (){
                          myAlert();
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
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    onFieldSubmitted: (String value) {
                      print(value);
                    },
                    validator: (String? value) {
                      RegExp regex = RegExp(
                          r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                          r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                          r"{0,253}[a-zA-Z0-9])?)*$");
                      if (value != null && value.isEmpty) {
                        return "Your email can't be empty";
                      }
                      if (!regex.hasMatch(value!)) {
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
                    validator: (Value) {
                      RegExp regex = RegExp(
                          r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$');
                      var passValue = Value ?? "";
                      if (passValue.isEmpty) {
                        return ("Password is required");
                      } else if (passValue.length < 6) {
                        return ("Password Must be more than 5 characters");
                      } else if (!regex.hasMatch(passValue)) {
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
                    height: 40.0,
                  ),
                  Container(
                    width: 100.0,
                    child: MaterialButton(
                      height: 20.0,
                      onPressed: () {
                        if (isValid()) {

                          postRequest();
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
