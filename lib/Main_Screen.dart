import 'package:flutter/material.dart';
import 'package:guideram/login.dart';

class Main_Screen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[800],
        title: Row(
          children: [
            CircleAvatar(
              radius: 20.0,
              backgroundImage: AssetImage('assets/images/logo.png'),
            ),
            SizedBox(
              width: 10.0,
            ),
            Text(
              'Guideram',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon:Icon(Icons.logout),
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder:(context){
                return LoginPage(title:'',);
              }));
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            // borderRadius: BorderRadius.circular(20.0),
                            color: Colors.purple[800],
                          ),
                          child: IconButton(
                            iconSize: 145.0,
                            icon: Image(
                              image:AssetImage('assets/images/p1.png'),
                              height: 150.0,
                              width: 150.0,),
                            onPressed: (){},
                          ),
                        ),
                        SizedBox(
                          width:20.0,
                        ),
                        Text(
                          'Medical Consulting',
                          style: TextStyle(
                            fontSize:15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 10.0,
                    ),

                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            // borderRadius: BorderRadius.circular(20.0),
                            color: Colors.purple[800],
                          ),
                          child: IconButton(
                            iconSize: 145.0,
                            icon: Image(
                              image:AssetImage('assets/images/p2.png'),
                              height: 150.0,
                              width: 150.0,),
                            onPressed: (){},
                          ),
                        ),
                        SizedBox(
                          width: 15.0,
                        ),
                        Text(
                          'Professional Consulting',
                          style: TextStyle(
                            fontSize:15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 40.0,
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            // borderRadius: BorderRadius.circular(20.0),
                            color: Colors.purple[800],
                          ),
                          child: IconButton(
                            iconSize: 145.0,
                            icon: Image(
                              image:AssetImage('assets/images/p3.png'),
                              height: 150.0,
                              width: 150.0,),
                            onPressed: (){},
                          ),
                        ),
                        SizedBox(
                          width: 15.0,
                        ),
                        Text(
                          'Psychological Consulting',
                          style: TextStyle(
                            fontSize:13.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            // borderRadius: BorderRadius.circular(20.0),
                            color: Colors.purple[800],
                          ),
                          child: IconButton(
                            iconSize: 145.0,
                            icon: Image(
                              image:AssetImage('assets/images/p4.png'),
                              height: 150.0,
                              width: 150.0,),
                            onPressed: (){},
                          ),
                        ),
                        SizedBox(
                          width: 15.0,
                        ),
                        Text(
                          'Family Consulting',
                          style: TextStyle(
                            fontSize:15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 30.0,
                ),
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        //borderRadius: BorderRadius.circular(20.0),

                        color: Colors.purple[800],
                      ),
                      child: IconButton(
                        iconSize: 145.0,
                        icon: Image(
                          image:AssetImage('assets/images/p5.png'),
                          height: 150.0,
                          width: 150.0,),
                        onPressed: (){},
                      ),
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Text(
                      'Management and business consulting',
                      style: TextStyle(
                        fontSize:15.0,
                        fontWeight: FontWeight.bold,
                      ),
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
