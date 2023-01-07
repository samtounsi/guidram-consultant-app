import 'package:flutter/material.dart';

class App_book {
  final String time;
  final String duration;
  App_book({
    required this.time,
    required this.duration,
  });
}

class Appointment_Booking extends StatefulWidget {
  const Appointment_Booking({Key? key}) : super(key: key);

  @override
  State<Appointment_Booking> createState() => _Appointment_BookingState();
}

class _Appointment_BookingState extends State<Appointment_Booking> {
  List<App_book> boo = [
    App_book(time: '9:00', duration: '1 hour'),
    App_book(time: '8:00', duration: '2 hour')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[800],
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            /* //Navigation
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return Main_Screen();
            }));*/
          },
        ),
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
              'Appointment Booking',
              style: TextStyle(
                color: Colors.white,
                fontSize: 17.0,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.date_range,
                    size: 27,
                    color: Colors.purple[800],
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 5,
                    ),
                    child: Text(
                      'Sunday',
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) =>
                    buildApp_booitem(boo.elementAt(index), context),
                separatorBuilder: (context, index) => SizedBox(
                  height:0,
                ),
                itemCount: boo.length,
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  Icon(
                    Icons.date_range,
                    size: 27,
                    color: Colors.purple[800],
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 5,
                    ),
                    child: Text(
                      'Monday',
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) =>
                    buildApp_booitem(boo.elementAt(index), context),
                separatorBuilder: (context, index) => SizedBox(
                  height:0,
                ),
                itemCount: boo.length,
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  Icon(
                    Icons.date_range,
                    size: 27,
                    color: Colors.purple[800],
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 5,
                    ),
                    child: Text(
                      'Tuesday',
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) =>
                    buildApp_booitem(boo.elementAt(index), context),
                separatorBuilder: (context, index) => SizedBox(
                  height:0,
                ),
                itemCount: boo.length,
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  Icon(
                    Icons.date_range,
                    size: 27,
                    color: Colors.purple[800],
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 5,
                    ),
                    child: Text(
                      'Wednesday',
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) =>
                    buildApp_booitem(boo.elementAt(index), context),
                separatorBuilder: (context, index) => SizedBox(
                  height:0,
                ),
                itemCount: boo.length,
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  Icon(
                    Icons.date_range,
                    size: 27,
                    color: Colors.purple[800],
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 5,
                    ),
                    child: Text(
                      'Thursday',
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) =>
                    buildApp_booitem(boo.elementAt(index), context),
                separatorBuilder: (context, index) => SizedBox(
                  height:0,
                ),
                itemCount: boo.length,
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  Icon(
                    Icons.date_range,
                    size: 27,
                    color: Colors.purple[800],
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 5,
                    ),
                    child: Text(
                      'Friday',
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) =>
                    buildApp_booitem(boo.elementAt(index), context),
                separatorBuilder: (context, index) => SizedBox(
                  height:0,
                ),
                itemCount: boo.length,
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  Icon(
                    Icons.date_range,
                    size: 27,
                    color: Colors.purple[800],
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 5,
                    ),
                    child: Text(
                      'Saturday',
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) =>
                    buildApp_booitem(boo.elementAt(index), context),
                separatorBuilder: (context, index) => SizedBox(
                  height:0,
                ),
                itemCount: boo.length,
              ),
              SizedBox(
                height: 20.0,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildApp_booitem(App_book boo, BuildContext context) => Row(
    children: [
      SizedBox(
        width: 35.0,
      ),
      Text(
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.w300,
        ),
        '${boo.time}',
      ),
      SizedBox(
        width: 20.0,
      ),
      Text('-'),
      SizedBox(
        width: 20.0,
      ),
      Text(
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.w300,
        ),
        '${boo.duration}',
      ),
      SizedBox(
        width: 80.0,
      ),
      TextButton(
        child: Text(
          'Book',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
        ),
        onPressed: () {},
      ),
    ],
  );
}
