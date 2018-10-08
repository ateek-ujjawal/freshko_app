import 'package:flutter/material.dart';
import '../Generics/Colors.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

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
          padding: EdgeInsets.all(uni_height / 13),
          child: Card(
            color: Colors.transparent,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: uni_width/0.9,
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
                      Text(
                        'Sign Up',
                        style: TextStyle(
                            fontSize: 25.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )
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
                    height: uni_height/1.2,
                    width: uni_width/0.9,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0),
                        ),
                        color: Color(0xFF3C4D5D).withOpacity(0.75)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                            height: uni_height/15,
                            width: uni_width/1.8,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(left: 10.0, right: 10.0),
                              child: TextField(
                                  style: TextStyle(
                                      fontFamily: 'ArimaMadurai',
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black
                                  ),
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'First Name',
                                      hintStyle: TextStyle(
                                          fontFamily: 'ArimaMadurai',
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w400
                                      )
                                  )
                              ),
                            )
                        ),
                        Padding(padding: EdgeInsets.only(top: 15.0)),
                        Container(
                            height: uni_height/15,
                            width: uni_width/1.8,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                              child: TextField(
                                  style: TextStyle(
                                      fontFamily: 'ArimaMadurai',
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black
                                  ),
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Last Name',
                                      hintStyle: TextStyle(
                                          fontFamily: 'ArimaMadurai',
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w400
                                      )
                                  )
                              ),
                            )
                        ),
                        //USERNAME FIELD
                        Padding(padding: EdgeInsets.only(top: 15.0)),
                        Container(
                            height: uni_height/15,
                            width: uni_width/1.8,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                              child: TextField(
                                  style: TextStyle(
                                      fontFamily: 'ArimaMadurai',
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black
                                  ),
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Username',
                                      hintStyle: TextStyle(
                                          fontFamily: 'ArimaMadurai',
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w400
                                      )
                                  )
                              ),
                            )
                        ),
                        Padding(padding: EdgeInsets.only(top: 15.0)),
                        //PASSWORD FIELD
                        Container(
                          height: uni_height/15,
                          width: uni_width/1.8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: 10.0, right: 10.0),
                            child: TextField(
                              style: TextStyle(
                                  fontFamily: 'ArimaMadurai',
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black
                              ),
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Password',
                                  hintStyle: TextStyle(
                                      fontFamily: 'ArimaMadurai',
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w400
                                  )
                              ),
                              obscureText: true,
                            ),
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top: 50.0)),
                        //SIGN IN BUTTON
                        Container(
                          height: uni_height/15,
                          width: uni_width/1.8,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)),
                            onPressed: () {},
                            color: themeColor,
                            child: Text(
                              'SIGN UP',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        )
                      ],
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
