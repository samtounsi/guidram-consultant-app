import 'package:flutter/material.dart';
import 'package:guideram/login.dart';

class Expert_profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[800],
        titleSpacing: 10.0,
        title: Text(
          'profile',
          style: TextStyle(
            color: Colors.white,
            fontSize: 23.0,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.logout,
            ),
            onPressed: () {
              //Navigation
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return Login();
              }));
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color(0xffE6E6E6),
                    border: Border.all(color: const Color(0xff707070)),
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Rawan Asa\'ad',
                    style: TextStyle(
                      fontSize: 23.0,
                      fontWeight:FontWeight.w500,
                    ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      '098765544321',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight:FontWeight.w200,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
