import 'package:flutter/material.dart';
import '../Generics/Colors.dart';
import 'SignIn.dart';
import 'SignUp.dart';
import 'Profile.dart';
import 'aboutUs.dart';
import 'package:flutter/services.dart';
import 'Categories.dart';

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
          '/Categories': (BuildContext context) => new CategoryPage()
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
  bool _onPressed = false;
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

  @override
  Widget build(BuildContext context) {
    double uniHeight = MediaQuery.of(context).size.height;
    double uniWidth = MediaQuery.of(context).size.width;

    void _onCategoryClick(){
      setState(() {
        _onPressed = true;
      });
      Navigator.of(context).pop();
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
                        FlatButton(onPressed: _onCategoryClick, child: Text('Fruits and\n Vegetables')),
                        FlatButton(onPressed: _onCategoryClick, child: Text('Grocery and\n Stamples')),
                        FlatButton(onPressed: _onCategoryClick, child: Text('Beverages')),
                        FlatButton(onPressed: _onCategoryClick, child: Text('Biscuits and\n Snacks')),
                        FlatButton(onPressed: _onCategoryClick, child: Text('Beauty Products')),
                        FlatButton(onPressed: _onCategoryClick, child: Text('Household')),
                        FlatButton(onPressed: _onCategoryClick, child: Text('Breakfast and\n Dairy')),
                        FlatButton(onPressed: _onCategoryClick, child: Text('Baby and\n Kids')),
                        FlatButton(onPressed: _onCategoryClick, child: Text('Noodles/Instant Foods')),
                      ],
                    ),
                  ),
                )
              ],
            )),
      ),
      body: new Container(
        child: (_onPressed == true) ? CategoryPage() : new DefaultHomepage(),
      ),
    );
  }
}

class DefaultHomepage extends StatelessWidget {
  const DefaultHomepage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 15.0),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(color: Colors.green, height: 2.0, width: 100.0,),
              Padding(padding: EdgeInsets.only(left: 25.0)),
              Container(child: Text('Best Sellers'),),
              Padding(padding: EdgeInsets.only(left: 25.0)),
              Container(color: Colors.green, height: 2.0, width: 100.0,),
            ],
          ),
          Container(
            height: 250.0,
            child: Column(
              children: <Widget>[
                Expanded(
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Padding(padding: EdgeInsets.only(top: 25.0)),
                            Row(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(left: 20.0),
                                ),
                                Container(
                                    height: 200.0,
                                    width: 150.0,
                                    child: Card(
                                      elevation: 3.0,
                                    )),
                                Padding(
                                  padding: EdgeInsets.only(left: 25.0),
                                ),
                                Container(
                                    height: 200.0,
                                    width: 150.0,
                                    child: Card(
                                      elevation: 3.0,
                                    )),
                                Padding(
                                  padding: EdgeInsets.only(left: 25.0),
                                ),
                                Container(
                                    height: 200.0,
                                    width: 150.0,
                                    child: Card(
                                      elevation: 3.0,
                                    )),
                                Padding(
                                  padding: EdgeInsets.only(left: 25.0),
                                ),
                                Container(
                                    height: 200.0,
                                    width: 150.0,
                                    child: Card(
                                      elevation: 3.0,
                                    )),
                                Padding(
                                  padding: EdgeInsets.only(left: 25.0),
                                ),
                                Container(
                                    height: 200.0,
                                    width: 150.0,
                                    child: Card(
                                      elevation: 3.0,
                                    )),
                                Padding(
                                  padding: EdgeInsets.only(right: 25.0),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    )),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 15.0),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(color: Colors.green, height: 2.0, width: 100.0,),
              Padding(padding: EdgeInsets.only(left: 25.0)),
              Container(child: Text('On Sale'),),
              Padding(padding: EdgeInsets.only(left: 25.0)),
              Container(color: Colors.green, height: 2.0, width: 100.0,),
            ],
          ),
          Container(
            height: 250.0,
            child: Column(
              children: <Widget>[
                Expanded(
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Padding(padding: EdgeInsets.only(top: 25.0)),
                            Row(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(left: 20.0),
                                ),
                                Container(
                                    height: 200.0,
                                    width: 150.0,
                                    child: Card(
                                      elevation: 3.0,
                                    )),
                                Padding(
                                  padding: EdgeInsets.only(left: 25.0),
                                ),
                                Container(
                                    height: 200.0,
                                    width: 150.0,
                                    child: Card(
                                      elevation: 3.0,
                                    )),
                                Padding(
                                  padding: EdgeInsets.only(left: 25.0),
                                ),
                                Container(
                                    height: 200.0,
                                    width: 150.0,
                                    child: Card(
                                      elevation: 3.0,
                                    )),
                                Padding(
                                  padding: EdgeInsets.only(left: 25.0),
                                ),
                                Container(
                                    height: 200.0,
                                    width: 150.0,
                                    child: Card(
                                      elevation: 3.0,
                                    )),
                                Padding(
                                  padding: EdgeInsets.only(left: 25.0),
                                ),
                                Container(
                                    height: 200.0,
                                    width: 150.0,
                                    child: Card(
                                      elevation: 3.0,
                                    )),
                                Padding(
                                  padding: EdgeInsets.only(right: 25.0),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

