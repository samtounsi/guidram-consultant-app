import 'package:flutter/material.dart';

class Fav_Experts{
  final String name;
  final String rate;
  final String price;
  Fav_Experts({
    required this.name,
    required this.rate,
    required this.price,
  });
}
class Favourite extends StatefulWidget {

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  List<Fav_Experts> fav =[
    Fav_Experts(name:'Rawan', price:'90 s.p',rate:'4')
  ];
  bool is_fav = true;
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
              'Favourite List',
              style: TextStyle(color: Colors.white,
                fontSize: 17.0,),
            ),
          ],
        ),
      ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child:SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(7.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(
                      1.0,
                    ),
                    color: Colors.grey[200],
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
                  height: 10.0,
                ),

                ListView.separated(
                  shrinkWrap: true,
                  physics:NeverScrollableScrollPhysics(),
                  scrollDirection:Axis.vertical,
                  itemBuilder:(context,index) => buildExpertsitem(fav.elementAt(index),context) ,
                  separatorBuilder:(context,index) => SizedBox(
                    height:10,
                  ) ,
                  itemCount: fav.length,
                ),

              ],
            ),
          ),
      ),
    );
  }

  Widget buildExpertsitem(Fav_Experts fav,BuildContext context) =>
      MaterialButton(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 35.0,
                      backgroundImage:AssetImage('assets/images/user.png'),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w400,
                          ),
                          '${fav.name}',
                        ),
                        SizedBox(
                          height:7.0,
                        ),
                        Text(
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w300,
                          ),
                          'Rating: ${fav.rate}',
                        ),
                        SizedBox(
                          height:7.0,
                        ),
                        Text(
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w300,
                          ),
                          'Session price: ${fav.price}',
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 35.0,
                    ),
                    IconButton(
                      icon:Icon( is_fav
                       ? Icons.favorite
                       : Icons.favorite_border_outlined,
                        color:Colors.purple[800],
                      ),
                    onPressed: () {
                    setState(() {
                      is_fav= !is_fav;
                    });
  }
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
        ),
        onPressed: (){
          /*Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return expert_user_screen(expert.userId!);
          }));*/

        },
      );
}
