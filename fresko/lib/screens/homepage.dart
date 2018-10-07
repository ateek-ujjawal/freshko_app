import 'package:flutter/material.dart';
import '../Generics/Colors.dart';

void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: new HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double uni_height = MediaQuery.of(context).size.height;
    double uni_width = MediaQuery.of(context).size.width;

    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Color(0xff16ad32),
        title: new Text('Freshko', style: TextStyle(fontFamily: 'ArimaMadurai', fontSize: uni_width/12),),
      ),
      drawer: new Drawer(
        child: new Container(
            color: Colors.white,
            padding: EdgeInsets.only(top: 32.0, left: 55.0, right: 55.0),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: uni_width / 25),
                  child: Container(
                    height: uni_height / 7,
                    width: uni_width / 4,
                    child: Image(
                      image: AssetImage('assets/images/FreshkoLogo.png'),
                    ),
                  ),
                ),
                Container(
                    height: uni_height / 7,
                    width: uni_width / 2,
                    child: Image(
                        image: AssetImage('assets/images/CompanyName.jpeg')
                    )),
                Container(
                  height: 1.2,
                  color: Colors.black87,
                ),
                ListView(
                  shrinkWrap: true,
                  children: <Widget>[
                      FlatButton(onPressed: (){}, child: Text('Your Profile')),
                      FlatButton(onPressed: (){}, child: Text('Your Orders')),
                      FlatButton(
                        onPressed: (){},
                        child: Row(children: <Widget>[
                          Padding(padding: EdgeInsets.only(left: uni_width/8),),
                          Text('Categories'),
                          Padding(padding: EdgeInsets.only(left: uni_width/20),),
                          Icon(Icons.arrow_forward, size: uni_width/20,)
                        ],),
                      )
                  ],

                )
              ],

            )),


      ),
      body: new Container(
        child: new Center(
          child: new Column(
            children: <Widget>[
              new Text(''),
            ],
          ),
        ),
      ),
    );
  }
}
