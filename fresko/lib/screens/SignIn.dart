import 'package:flutter/material.dart';
import '../Generics/Colors.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    double uni_height = MediaQuery.of(context).size.height;
    double uni_width = MediaQuery.of(context).size.width;
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Image(
          image: AssetImage('assets/images/SignInBackground.jpeg'),
          colorBlendMode: BlendMode.darken,
          color: Colors.black12,
          fit: BoxFit.cover,
        ),
        Padding(
          padding: EdgeInsets.all(uni_height/13),
          child: Card(
            color: Colors.transparent,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 400.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        radius: 40.0,
                        backgroundColor: Colors.white,
                        child: Image(
                          image: AssetImage('assets/images/FreshkoLogo.png'),
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 20.0)),
                      Text('Sign In', style: TextStyle(fontSize: 25.0, color: Colors.white, fontWeight: FontWeight.bold),)
                      //todo: Change fontFamily
                    ],
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        topRight: Radius.circular(10.0)),
                    color: themeColor,
                  ),
                  height: 200.0,
                ),
                Expanded(
                  child: Container(
                    height: 400.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10.0),
                        bottomRight: Radius.circular(10.0),
                      ),
                      color: Color(0xFF3C4D5D).withOpacity(0.75)
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
