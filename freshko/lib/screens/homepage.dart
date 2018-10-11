import 'package:flutter/material.dart';
import '../Generics/Colors.dart';
import 'SignIn.dart';
import 'SignUp.dart';
import 'Profile.dart';
import 'aboutUs.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).whenComplete(() {
      runApp(new MaterialApp(
        debugShowCheckedModeBanner: false,
        home: new HomePage(),
        routes: <String, WidgetBuilder>{
          '/SignIn': (BuildContext context) => new SignIn(),
          '/SignUp': (BuildContext context) => new SignUp(),
          '/Profile': (BuildContext context) => new ProfilePage(),
          '/AboutUs': (BuildContext context) => new AboutUs(),
        },
        title: 'Freshko',
        theme: ThemeData(
          primaryColor: themeColor
        ),
      ));
    }
  );
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin{

  AnimationController _controller;
  bool _onClick = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 150));
    _controller.addListener((){
      setState(() {

      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double uniHeight = MediaQuery.of(context).size.height;
    double uniWidth = MediaQuery.of(context).size.width;

    Animation<Offset> getAnimation() {
      return Tween<Offset>(
        begin: Offset(0.5, 0.0),
        end: Offset.zero
      ).animate(_controller);
    }

    void reverseAnimation() {
      try{
        setState(() async {
          await _controller.reverse();
          _onClick = false;
        });
      } catch(e) {}

    }

    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: themeColor,
        title: new Text('Freshko', style: TextStyle(fontFamily: 'ArimaMadurai', fontSize: uniWidth/12),),
      ),
      drawer: new Drawer(
        child: new Container(
            color: Colors.white,
            padding: EdgeInsets.only(top: 32.0, left: 55.0, right: 55.0),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: uniWidth / 25),
                  child: Container(
                    height: uniHeight / 7,
                    width: uniWidth / 4,
                    child: Image(
                      image: AssetImage('assets/images/FreshkoLogo.png'),
                    ),
                  ),
                ),
                Container(
                    height: uniHeight / 7,
                    width: uniWidth / 2,
                    child: Image(
                        image: AssetImage('assets/images/CompanyName.jpeg')
                    )),
                Container(
                  height: 1.2,
                  color: Colors.black87,
                ),
                (_onClick == false) ? Expanded(
                    child: ListView(
                      shrinkWrap: true,
                      children: <Widget>[
                        FlatButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed('/Profile');
                            }, child: Text('Your Profile')),
                        FlatButton(
                            onPressed: () {}, child: Text('Your Orders')),
                        FlatButton(
                          onPressed: () {
                            setState(() {
                              _onClick = true;
                              _controller.forward();
                            });
                          },
                          child: Row(children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(left: uniWidth / 8),),
                            Text('Categories'),
                            Padding(
                              padding: EdgeInsets.only(left: uniWidth / 20),),
                            Icon(Icons.arrow_forward, size: uniWidth / 20,)
                          ],),
                        ),
                        FlatButton(
                            onPressed: () {}, child: Text('Prime Membership')),
                        FlatButton(onPressed: () {
                          Navigator.of(context).pushNamed('/SignUp');
                        }, child: Text('SignUp')),
                        FlatButton(onPressed: () {
                          Navigator.of(context).pushNamed('/SignIn');
                        }, child: Text('SignIn')),
                        FlatButton(onPressed: () {
                          Navigator.of(context).pushNamed('/AboutUs');
                        }, child: Text('AboutUs')),
                      ],
                    )
                ): Expanded(
                  child: SlideTransition(
                    position: getAnimation(),
                    child: ListView(
                      shrinkWrap: true,
                      children: <Widget>[
                        IconButton(icon: Icon(Icons.arrow_back), onPressed: reverseAnimation),
                        FlatButton(onPressed: () {}, child: Text('Fruits and\n Vegetables')),
                        FlatButton(onPressed: () {}, child: Text('Grocery and\n Stamples')),
                        FlatButton(onPressed: () {}, child: Text('Beverages')),
                        FlatButton(onPressed: () {}, child: Text('Biscuits and\n Snacks')),
                        FlatButton(onPressed: () {}, child: Text('Beauty Products')),
                        FlatButton(onPressed: () {}, child: Text('Household')),
                        FlatButton(onPressed: () {}, child: Text('Breakfast and\n Dairy')),
                        FlatButton(onPressed: () {}, child: Text('Baby and\n Kids')),
                        FlatButton(onPressed: () {}, child: Text('Noodles/Instant Foods')),
                      ],
                    ),
                  ),
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