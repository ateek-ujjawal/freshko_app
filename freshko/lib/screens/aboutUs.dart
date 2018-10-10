import 'package:flutter/material.dart';
import '../Generics/Colors.dart';

class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    double uni_height = MediaQuery
        .of(context)
        .size
        .height;
    double uni_width = MediaQuery
        .of(context)
        .size
        .width;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('About Us'),
        backgroundColor: themeColor,
      ),
      body: Stack(
        fit: StackFit.expand,
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
                            left: uni_width / 14.4, top: uni_height / 3.2),
                      ),
                      Container(
                        height: uni_height / 3.5,
                        width: uni_width / 2,
                        color: Color(0xFF00FF92).withOpacity(0.15),
                      ),
                    ],
                  ),
                ),
                //Small box
                Padding(
                  padding: EdgeInsets.only(
                      left: uni_width / 1.6, top: uni_height / 10.266),
                  child: Container(
                    height: uni_height / 10,
                    width: uni_width / 5,
                    color: Color(0xFF00FF92).withOpacity(0.15),
                  ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding:
                EdgeInsets.only(top: uni_height / 16, left: uni_width / 8),
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
                left: uni_width / 5.25,
                bottom: uni_height / 3.2,
                right: uni_width / 8),
            child: Card(
              elevation: 2.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Finding Fresh Vegetables \nand Groceries isn\'t easy',
                      style: TextStyle(fontWeight: FontWeight.bold,
                          fontSize: 14.0,
                          fontFamily: 'ArimaMadurai'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      'We deliver fresh vegetables, fruits, and grocery items right at your dropstep.'
                          ' We value your time. \nLightning fast delivery, within 2 hours of time.',
                      style: TextStyle(wordSpacing: 0.1, fontFamily: 'ArimaMadurai', fontSize: 12.0),),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
