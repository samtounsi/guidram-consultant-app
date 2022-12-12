import 'package:flutter/material.dart';
import 'package:guideram/Expert_Screen.dart';

class RegisterPage1 extends StatefulWidget {
  const RegisterPage1({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<RegisterPage1> createState() => _RegisterPage1State();
}

class _RegisterPage1State extends State<RegisterPage1> {
  final _formKey = GlobalKey<FormState>();
  var rememberValue = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
            Color.fromARGB(255, 226, 244, 255),
            Color.fromARGB(255, 75, 169, 228)
          ])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Text(
                'I am:',
                style: TextStyle(
                  fontFamily: 'Courgette',
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              ElevatedButton.icon(
                style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.fromLTRB(70, 20, 70, 20),
                    foregroundColor: Color.fromARGB(255, 226, 244, 255),
                    side: BorderSide(
                        color: Color.fromARGB(255, 106, 27, 154), width: 2),
                    shape: StadiumBorder(),
                    elevation: 5),
                onPressed: () {
                  Navigator.pushNamed(context, '/users');
                },
                icon: Icon(
                  Icons.supervisor_account_rounded,
                  size: 40,
                ),
                label: Text('User',
                    style: TextStyle(fontSize: 30, fontFamily: 'Courgette')),
              ),
              SizedBox(
                height: 40,
              ),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.fromLTRB(70, 20, 70, 20),
                    foregroundColor: Color.fromARGB(255, 226, 244, 255),
                    side: BorderSide(
                        color: Color.fromARGB(255, 106, 27, 154), width: 2),
                    shape: StadiumBorder(),
                    elevation: 5),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder:(context){
                    return Expert_Screen();
                  }));
                },
                icon: Icon(
                  Icons.auto_awesome,
                  size: 40,
                ),
                label: Text(
                  'Expert',
                  style: TextStyle(fontSize: 26, fontFamily: 'Courgette'),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already registered?'),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    child: const Text('Login'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
