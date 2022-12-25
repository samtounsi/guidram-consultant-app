import 'package:flutter/material.dart';
import 'package:guideram/Expert_profile.dart';

class Booked_appointmentsModel{
  final String name;
  final String time;
  Booked_appointmentsModel({
    required this.name,
    required this.time,
  });
}

class Booked_appointments extends StatelessWidget {

  List<Booked_appointmentsModel> Bookapp = [
    Booked_appointmentsModel(
      name: 'Rawan',
      time:'Monday  05:00',
    ),
    Booked_appointmentsModel(
      name: 'Rawan',
      time:'Sunday  09:00',
    ),
    Booked_appointmentsModel(
      name: 'Rawan',
      time:'Friday  03:00',
    ),
    Booked_appointmentsModel(
      name: 'Rawan',
      time:'Saturday  05:00',
    ),
    Booked_appointmentsModel(
      name: 'Rawan',
      time:'Tuesday  06:00',
    ),
    Booked_appointmentsModel(
      name: 'Rawan',
      time:'Sunday  05:00',
    ),
  ];

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
              'Booked appointments',
              style: TextStyle(color: Colors.white,
                fontSize: 17.0,),
            ),
      ),
      body:Padding(
        padding: const EdgeInsets.only(
          left:20,
          right:20,
          top:10,
        ),
        child:SingleChildScrollView(
          child:ListView.separated(
                shrinkWrap: true,
                physics:NeverScrollableScrollPhysics(),
                scrollDirection:Axis.vertical,
                itemBuilder:(context,index) => buildExpertsitem(Bookapp[index]) ,
                separatorBuilder:(context,index) => SizedBox(
                  height:10,
                ) ,
                itemCount: Bookapp.length,
              ),
        ),
      ),
    );
  }

  Widget buildExpertsitem(Booked_appointmentsModel Bookapp) =>
      Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 35.0,
                      backgroundImage: AssetImage('assets/images/profile.png'),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Row(
                      children: [
                        Text(
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500,
                          ),
                          '${Bookapp.name}',
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        Text(
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400,
                          ),
                          '${Bookapp.time}',
                        ),
                      ],
                    ),
                  ],
                ),

              ],
            ),
            Column(
              children: [
                Text(
                  '_________________________________________________',
                  style: TextStyle(
                    color: Colors.purple[800],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        );
}
