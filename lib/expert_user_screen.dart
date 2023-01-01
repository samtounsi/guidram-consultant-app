import 'package:flutter/material.dart';
import 'package:guideram/Main_screen.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:guideram/controllers/expertcontroller.dart';
import 'package:guideram/model/Expert.dart';
import "package:get/get.dart";

class expert_user_screen extends StatefulWidget {
  int id;
  expert_user_screen(this.id, {super.key});
  @override
  State<expert_user_screen> createState() => _expert_user_screenState(id);
}

class _expert_user_screenState extends State<expert_user_screen> {
  int id=0;
  _expert_user_screenState(this.id);
  @override
  Widget build(BuildContext context) {
    print(id);
    ExpertController expertController=Get.put(ExpertController(id));
    expertController.fetchExpert(id, true);
    print(expertController.expert!.name);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[800],
        elevation: 0.0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            //Navigation
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return Main_Screen();
            }));
          },
        ),
        actions: [
          FavoriteButton(
            isFavorite: false,
            iconColor: Colors.purple[300],
            iconSize: 50,
            valueChanged: (_isFavorite) {
              print('Is Favorite : $_isFavorite');
            },
          ),
          SizedBox(
            width: 15.0,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: 500,
              decoration: BoxDecoration(
                color: Colors.purple[800],
                borderRadius: BorderRadiusDirectional.only(
                  bottomEnd: Radius.circular(30),
                  bottomStart: Radius.circular(30),
                ),
              ),
              //clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 10.0,
                    ),
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
                      height: 15.0,
                    ),
                    Text(
                      '${expertController.expert!.name}',
                      style: TextStyle(
                        fontSize: 23.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Text(
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          '${expertController.expert!.experience}',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: [
                  Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            color: Colors.black45,
                            Icons.email_outlined,
                          ),
                          SizedBox(
                            width: 7.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                'Email',
                                style: TextStyle(
                                  color: Colors.black45,
                                  fontSize: 13,
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text('${expertController.expert!.email}'),
                              SizedBox(
                                height: 10.0,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.purple[800],
                        height: 30,
                        indent: 10,
                        endIndent: 20,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            color: Colors.black45,
                            Icons.phone_android,
                          ),
                          SizedBox(
                            width: 7.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                'Phone Number',
                                style: TextStyle(
                                  color: Colors.black45,
                                  fontSize: 13,
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text('${expertController.expert!.phone}'),
                              SizedBox(
                                height: 10.0,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.purple[800],
                        height: 30,
                        indent: 10,
                        endIndent: 20,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            color: Colors.black45,
                            Icons.maps_home_work_outlined,
                          ),
                          SizedBox(
                            width: 7.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                'Address',
                                style: TextStyle(
                                  color: Colors.black45,
                                  fontSize: 13,
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text('${expertController.expert!.address}'),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                    ],
                  ),
                  Center(
                    child: Container(
                      width: 180,
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        color: Colors.purple[800],

                      ),
                      child: MaterialButton(
                          child: const Text('Appointment Booking',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize:15.0,
                            ),
                          ),
                          onPressed: () {
                          /*  Navigator.of(context).push(MaterialPageRoute(builder:(context){
                              return ();
                            }));*/
                          }),
                    ),
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
