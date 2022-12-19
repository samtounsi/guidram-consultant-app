import 'package:flutter/material.dart';
import 'package:guideram/Main_Screen.dart';
import 'package:guideram/choose.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[800],
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
          ),
          onPressed: (){
//Navigation
            Navigator.of(context).push(MaterialPageRoute(builder:(context){
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
                  Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
                      const CircleAvatar(
                        radius: 50.0,
                        backgroundImage:AssetImage('assets/images/profile.png'),
                      ),
                      IconButton(
                        icon:Icon(
                          color: Colors.purple[800],
                          Icons.camera_alt_outlined,
                          size: 28.0,
                        ),
                        onPressed: (){

                        },
                      )
                    ],
                  ),
                  SizedBox(
                    height:20.0,
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
                      if (value != null && value.isEmpty) {
                        return "Your email can't be empty";
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
                    validator: (String? value) {
                      if (value != null && value.isEmpty) {
                        return "Your password can't be empty";
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
                        if (FormKey.currentState!.validate()) {
                          print(emailController.text);
                          print(passwordController.text);
                          print(NameController.text);
                          print(phoneController.text);
//Navigation
                          Navigator.of(context).push(MaterialPageRoute(builder:(context){
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
