import 'package:flutter/material.dart';
import 'package:guideram/login.dart';

class Expert_profile extends StatefulWidget {
  @override
  State<Expert_profile> createState() => _Expert_profileState();
}

class _Expert_profileState extends State<Expert_profile> {
  bool Medical_Consulting = false;

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
                  width: 100,
                  height: 100,
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
                        fontWeight:FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 18.0,
            ),
            Row(
              children: [
                Icon(
                  Icons.maps_home_work_outlined,
                  color: Colors.purple[800],
                  size: 25.0,
                ),
                SizedBox(
                  width: 16.0,
                ),
                Text(
                  'Syria-Damascus-Mazzah86',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight:FontWeight.w300,
                ),
                ),
              ],
            ),
            SizedBox(
              height: 15.0,
            ),
            Row(
              children: [
                Icon(
                  Icons.description_outlined,
                  color: Colors.purple[800],
                  size: 28.0,
                ),
                SizedBox(
                  width: 10.0,
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      overflow: TextOverflow.ellipsis,
                      maxLines:3,
                      'Test ..........................................................................................................................................................mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight:FontWeight.w300,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 13.0,
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Text(
                    'Choose the type of consultation that you wish to submit:',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight:FontWeight.w400,
                    ),
                  ),
                  Row(
                    children: [
                    Text('Medical Consulting'),
                    Checkbox(
                        value:Medical_Consulting,
                      onChanged:(val)
                      {
                        setState(()
                        {

                        });
                      },
                        )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
