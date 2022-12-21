import 'dart:io';
import 'package:flutter/material.dart';
import 'package:guideram/Main_Screen.dart';
import 'package:guideram/choose.dart';
import "package:http/http.dart" as http;
import 'dart:convert';
import "globalvariables.dart" as globals;

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

// var uri = 'http://10.0.0.2/8000'

class _LoginState extends State<Login> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  var uri = '${globals.Uri}/api/login';
  postRequest() async {
    try {
      var response = await http.post(Uri.parse(uri),body: {
        'email' : emailController.text,
        "password" : passwordController.text
      });
      var responseData = json.decode(response.body);
      String token = responseData['token'];
      if(!token.isEmpty) {
        //  store in some state managament
        globals.tokken=token;

        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) {
          return Main_Screen();
        }));
      } else {
        print("errrrrrrrrrrr");
        //  navigate to error screen
      }
    } catch(e) {
        print(e);
        //  navigate3 to error screen
      }
    }




  var FormKey = GlobalKey<FormState>();

  bool _obscureText = true;

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Form(
            key: FormKey,
            child: Stack(
              children: [
                Image(
                  image: AssetImage('assets/images/logo2.png'),
                  height: 380,
                  width: 380,
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 150.0,
                    ),
                    Row(
                      //on press : postRequest
                      children: [
                        SizedBox(
                          width: 95.0,
                        ),
                        Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.purple[800],
                            fontSize: 60.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 80.0,
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
                      height: 35.0,
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
                          Icons.lock_outline,
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
                    const SizedBox(
                      height: 40.0,
                    ),
                    Container(
                      width: 100.0,
                      child: MaterialButton(
                        height: 20.0,
                        onPressed: () {
                          if (FormKey.currentState!.validate()) {
                         postRequest();
                          }
                        },
                        child: Text(
                          'login',
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
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Don\'t have an Account?'),
                        TextButton(
                          onPressed: () {
                            //Navigation
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return choose();
                            }));
                          },
                          child: Text(
                            'Register Now',
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
