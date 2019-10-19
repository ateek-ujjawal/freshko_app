import 'package:flutter/material.dart';
import '../Generics/Colors.dart';

class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    double uni_height = MediaQuery.of(context).size.height;
    double uni_width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('About Us'),
        backgroundColor: themeColor,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(top: uni_height / 12.8),
                            child: Row(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: uni_width / 14.4,
                                      top: uni_height / 3.2),
                                ),
                                Container(
                                  height: uni_height / 3.5,
                                  width: uni_width / 2,
                                  color: Color(0xFF00FF92).withOpacity(0.150),
                                ),
                              ],
                            ),
                          ),
                          //Small box
                          Padding(
                            padding: EdgeInsets.only(
                                left: uni_width / 1.6, top: uni_height / 4.566),
                            child: Container(
                              height: uni_height / 10,
                              width: uni_width / 5,
                              color: Color(0xFF00FF92).withOpacity(0.15),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: uni_height / 12.8),
                          ),
                          Text(
                            'So we decided to create a '
                                '\nbetter grocery shopping experience'
                                '\n around 3 importamt values...',
                            style: TextStyle(
                                fontSize: 14.0,
                                fontFamily: 'ArimaMadurai',
                                fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: uni_height /10),
                          ),

                          //BOTTOMMOST CONTAINER
                          Padding(
                            padding: EdgeInsets.only(
                              left: uni_width / 10,
                              bottom: uni_width/10
                            ),
                            child: Container(
                              height: uni_height / 1.2,
                              color: Color(0xFF00FF92).withOpacity(0.15),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                      padding: EdgeInsets.only(
                                          top: uni_height / 15)),
                                  Row(
                                    children: <Widget>[
                                      Padding(padding: EdgeInsets.only(left: uni_width/100),),
                                      CircleAvatar(
                                        radius: 50.0,
                                        backgroundColor: Colors.transparent,
                                        child: Image(
                                          image: AssetImage(
                                              'assets/images/convenience.png'),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Padding(
                                          padding: EdgeInsets.only(
                                              left: uni_width / 10)),
                                      Column(
                                        children: <Widget>[
                                          Text(
                                            'Convenience',
                                            style: TextStyle(
                                                fontFamily: 'ArimaMadurai',
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15.0
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(right: 3.0),
                                            child: Text(
                                              'Life is too short to worry about\n'
                                                  ' groceries or walk to stores.'
                                                  ' \nJust order your groceries,'
                                                  ' \nand we will take care.',
                                              style: TextStyle(
                                                  fontFamily: 'ArimaMadurai',
                                                  fontSize: 13.0),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),

                                  Padding(
                                      padding: EdgeInsets.only(
                                          top: uni_height / 15)),
                                  Row(
                                    children: <Widget>[
                                      Padding(padding: EdgeInsets.only(left: uni_width/100),),
                                      CircleAvatar(
                                        radius: 50.0,
                                        backgroundColor: Colors.transparent,
                                        child: Image(
                                          image: AssetImage(
                                              'assets/images/handshake.png'),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Padding(
                                          padding: EdgeInsets.only(
                                              left: uni_width / 10)),
                                      Column(
                                        children: <Widget>[
                                          Text(
                                            'Trust',
                                            style: TextStyle(
                                                fontFamily: 'ArimaMadurai',
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15.0
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(right: 3.0),
                                            child: Text(
                                              'You are too busy to find\n'
                                                  ' groceries stores you can trust.'
                                                  ' \nTrust us with your fooderies,'
                                                  ' \nand we will deliver in time.',
                                              style: TextStyle(
                                                  fontFamily: 'ArimaMadurai',
                                                  fontSize: 13.0),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),

                                  Padding(
                                      padding: EdgeInsets.only(
                                          top: uni_height / 15)),
                                  Row(
                                    children: <Widget>[
                                      Padding(padding: EdgeInsets.only(left: uni_width/100),),
                                      CircleAvatar(
                                        radius: 50.0,
                                        backgroundColor: Colors.transparent,
                                        child: Image(
                                          image: AssetImage(
                                              'assets/images/Responsibilty.png'),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Padding(
                                          padding: EdgeInsets.only(
                                              left: uni_width / 10)),
                                      Column(
                                        children: <Widget>[
                                          Text(
                                            'Responsibility',
                                            style: TextStyle(
                                                fontFamily: 'ArimaMadurai',
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15.0
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(right: 3.0),
                                            child: Text(
                                              'It\'s our responsibility to '
                                                  '\npreserve the health'
                                                  '\n of the society.'
                                                  ' \nThat\'s why we deliver'
                                                  ' \nclean and fresh items,'
                                                  ' \nright at your doorstep.',
                                              style: TextStyle(
                                                  fontFamily: 'ArimaMadurai',
                                                  fontSize: 13.0),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(
                              top: uni_height / 16, left: uni_width / 8),
                          child: Container(
                            color: Colors.black,
                            height: uni_height / 3.5,
                            width: uni_width / 2,
                            child: Image(
                              image: AssetImage('assets/images/aboutUsVeg.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: uni_height / 3.5,
                          left: uni_width / 6,
                          bottom: uni_height / 7,
                          right: uni_width / 10),
                      child: Container(
                        height: uni_height / 2.5,
                        width: uni_width / 1.40,
                        child: Card(
                          elevation: 2.0,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Finding Fresh Vegetables \nand Groceries isn\'t easy',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.0,
                                      fontFamily: 'ArimaMadurai'),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                  'Some stores are not meeting your quality expectations,'
                                  'others are only open \nwhile you are at work,'
                                  ' and the rest \nare simply too expensive. '
                                   '\nDon\'t worry we have been there too.',
                                  style: TextStyle(
                                      wordSpacing: 0.1,
                                      fontFamily: 'ArimaMadurai',
                                      fontSize: 12.0),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
