import 'package:flutter/material.dart';
import '../Generics/Colors.dart';
import 'test.dart';
import 'SlideRight.dart';

void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: new HomePage(),
    routes: <String, WidgetBuilder>{
      '/Profile': (BuildContext context) => Profile()
    },
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
        title: new Text('Freshko'),
      ),
      drawer: CustomDrawer(uni_width: uni_width, uni_height: uni_height),
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

class CustomDrawer extends StatelessWidget {

  final double uni_width, uni_height;
  CustomDrawer({this.uni_width, this.uni_height});

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
                  FlatButton(
                    onPressed: (){Navigator.of(context).push(SlideRightRoute(widget: Profile()));},
                    child: Text('Your Profile')
                  ),
                  FlatButton(onPressed: (){}, child: Text('Your Orders')),
                  FlatButton(onPressed: (){}, child: Text('Categories'))
                ],
              )
            ],
          )),
    );
  }

}