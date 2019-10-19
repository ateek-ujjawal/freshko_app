import 'dart:async';
import 'package:flutter/material.dart';
import '../Generics/Colors.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool _validated = false;
  String _errorText = "";

  Future<void> _onSignedInWithEmail() async {
    if(_emailController.text != "" && _passwordController.text != ""){
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: _emailController.text, password: _passwordController.text)
          .whenComplete((){
            setState(() {
              _validated = true;
            });
      })
          .catchError((error){
            setState(() {
              _errorText = error.message;
              _validated = false;
            });
      });
    } else {
      setState(() {
        _errorText = "One or more fields are left empty";
        _validated = false;
      });
    }
  }

  final _emailController = new TextEditingController();
  final _passwordController = new TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldState = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    double uni_height = MediaQuery.of(context).size.height;
    double uni_width = MediaQuery.of(context).size.width;

    return Scaffold(
      key: _scaffoldState,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image(
            image: AssetImage('assets/images/SignInBackground.jpeg'),
            colorBlendMode: BlendMode.darken,
            color: Colors.black12,
            fit: BoxFit.cover,
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(uni_height / 13),
              child: Card(
                color: Colors.transparent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
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
                            'Sign In',//Font family not yet added
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
                      height: uni_height/3.2,
                    ),
                    Flexible(
                      child: Container(
                        height: uni_height/2,
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
                            //EMAIL FIELD
                            (_errorText != "") ?
                            Padding(
                              padding: EdgeInsets.only(bottom: 8.0),
                              child: Text(
                                _errorText,
                                style: TextStyle(
                                  color: Colors.red
                                ),
                              ),
                            ) : Container(),
                            Container(
                                height: uni_height / 12.8,
                                width: uni_width / 1.8,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30.0),
                                  color: Colors.white,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(left: uni_width / 36,
                                      right: uni_width / 36),
                                  child: TextFormField(
                                    style: TextStyle(
                                        fontFamily: 'ArimaMadurai',
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black
                                    ),
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'Email*',
                                        hintStyle: TextStyle(
                                            fontFamily: 'ArimaMadurai',
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.w400
                                        )
                                    ),
                                    validator: (val) => val == "" ? val : null,
                                    controller: _emailController,
                                  ),
                                )
                            ),
                            Padding(padding: EdgeInsets.only(top: 15.0)),
                            //PASSWORD FIELD
                            Container(
                              height: uni_height/12.8,
                              width: uni_width/1.8,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0),
                                color: Colors.white,
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(left: 10.0, right: 10.0),
                                child: TextFormField(
                                    style: TextStyle(
                                        fontFamily: 'ArimaMadurai',
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black
                                    ),
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'Password*',
                                        hintStyle: TextStyle(
                                            fontFamily: 'ArimaMadurai',
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.w400
                                        )
                                    ),
                                  obscureText: true,
                                  validator: (val) => val == "" ? val : null,
                                  controller: _passwordController,
                                ),
                              ),
                            ),
                            Padding(padding: EdgeInsets.only(top: 10.0)),
                            //SIGN IN BUTTON
                            Container(
                              height: uni_height/12.8,
                              width: uni_width/1.8,
                              child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0)),
                                onPressed: () {
                                  _onSignedInWithEmail().whenComplete((){
                                    if(_validated){
                                      final snackBar = SnackBar(
                                        backgroundColor: Color(0xFF3C4D5D).withOpacity(0.75),
                                        content: Text('Sign In Successful!', style: TextStyle(color: Colors.white)),
                                        duration: Duration(seconds: 2),
                                      );
                                      _scaffoldState.currentState.showSnackBar(snackBar);
                                    }
                                  });
                                },
                                color: themeColor,
                                child: Text(
                                  'SIGN IN',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10.0, bottom: 5.0),
                              child: Text('OR', style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'ArimaMadurai',
                                fontWeight: FontWeight.w700,
                                fontSize: 20.0
                              )),
                            ),
                            Container(
                              height: uni_height/12.8,
                              width: uni_width/1.8,
                              child: RaisedButton(
                                onPressed: (){},
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0)
                                ),
                                color: Colors.red,
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Row(
                                    children: <Widget>[
                                      Image(
                                          image: AssetImage('assets/images/whitegooglelogo.png'),
                                          height: uni_height/32,
                                          width: uni_width/18
                                      ),
                                      Padding(padding: EdgeInsets.all(uni_width/40)),
                                      Text(
                                        'SIGN IN WITH GOOGLE',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 11.0
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
