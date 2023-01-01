import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:guideram/Consulting%20pages/Business_and_management.dart';
import 'package:guideram/Consulting%20pages/Medical.dart';
import 'package:guideram/Consulting%20pages/Professional.dart';
import 'package:guideram/Consulting%20pages/Psychological.dart';
import 'package:guideram/Consulting%20pages/family.dart';
import 'package:guideram/Expert_profile.dart';
import 'package:guideram/controllers/expertcontroller.dart';
import 'package:guideram/login.dart';
import "globalvariables.dart" as globals;


class Main_Screen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[800],
        leading: Row(
          children: [
            SizedBox(
              width: 16.0,
            ),
            CircleAvatar(
              radius: 20.0,
              backgroundImage: AssetImage('assets/images/logo.png'),
            ),
          ],
        ),
        title: Row(
          children: [
            Text(
              'Guideram',
              style: TextStyle(color: Colors.white,
                fontSize: 23.0,

              ),

            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.logout,
            ),
            onPressed: () {
              globals.tokken="";
              //Navigation
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return Login();
              }));
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple[800],
        child: Icon(
          Icons.person_outline_rounded,
        ),
        onPressed: () {
          Get.delete<ExpertController>();
          //Navigation
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) {
            return expert_profile();
          }));
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 2.0,
                ),
                Container(
                  padding: EdgeInsets.all(7.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(
                      1.0,
                    ),
                    color: Colors.grey[300],
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.search,
                      ),
                      SizedBox(
                        width: 15.0,
                      ),
                      Text('Search'),
                    ],
                  ),
                ),
                SizedBox(
                  height: 22.0,
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
                              image: AssetImage('assets/images/p1.png'),
                              height: 150.0,
                              width: 150.0,
                            ),
                            onPressed: () {
                              //Navigation
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                return Medical_Con();
                              }));

                            },
                          ),
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Text(
                          'Medical Consulting',
                          style: TextStyle(
                            fontSize: 15.0,
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
                              image: AssetImage('assets/images/p2.png'),
                              height: 150.0,
                              width: 150.0,
                            ),
                            onPressed: () {
                              //Navigation
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                return Professional_Con();
                              }));
                            },
                          ),
                        ),
                        SizedBox(
                          width: 15.0,
                        ),
                        Text(
                          'Professional Consulting',
                          style: TextStyle(
                            fontSize: 15.0,
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
                              image: AssetImage('assets/images/p3.png'),
                              height: 150.0,
                              width: 150.0,
                            ),
                            onPressed: () {
                              //Navigation
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                return Psychological_Con();
                              }));
                            },
                          ),
                        ),
                        SizedBox(
                          width: 15.0,
                        ),
                        Text(
                          'Psychological Consulting',
                          style: TextStyle(
                            fontSize: 13.0,
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
                              image: AssetImage('assets/images/p4.png'),
                              height: 150.0,
                              width: 150.0,
                            ),
                            onPressed: () {
                              //Navigation
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                return family_Con();
                              }));
                            },
                          ),
                        ),
                        SizedBox(
                          width: 15.0,
                        ),
                        Text(
                          'Family Consulting',
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          //borderRadius: BorderRadius.circular(20.0),
                          color: Colors.purple[800],
                        ),
                        child: IconButton(
                          iconSize: 145.0,
                          icon: Image(
                            image: AssetImage('assets/images/p5.png'),
                            height: 150.0,
                            width: 150.0,
                          ),
                          onPressed: () {
                            //Navigation
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return Business_Con();
                            }));
                          },
                        ),
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      Text(
                        overflow: TextOverflow.ellipsis,
                        maxLines:1,
                        'Management and business consulting',
                        style: TextStyle(
                          fontSize: 13.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
