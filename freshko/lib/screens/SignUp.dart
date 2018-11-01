import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../Generics/Colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart' show FirebaseAuth;

Future<FirebaseApp> createFirebaseInstance() async {
  final FirebaseApp app = await FirebaseApp.configure(
      options: FirebaseOptions(
        googleAppID: '1:334140745180:android:efae17b2732bf3bf',
        apiKey: 'AIzaSyAjdPNQaX0rMFznpIYXfBujxMXvbKVbXpY',
        databaseURL: 'https://angulartest-ab9e1.firebaseio.com/',
      ),
      name: 'FirebaseInstance');
  return app;
}


class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  List<Credentials> credentials = List();
  Credentials credential;
  DatabaseReference credentialRef;
  FirebaseDatabase database;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldstate = new GlobalKey<ScaffoldState>();
  StreamSubscription<Event> sub1;
  StreamSubscription<Event> sub2;
  bool _validated = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    credential = Credentials("", "", "");
    createFirebaseInstance().then((app) {
      database = FirebaseDatabase(app: app);
      credentialRef = database.reference().child('credentials');
      sub1 = credentialRef.onChildAdded.listen(_onEventAdded);
      sub2 = credentialRef.onChildChanged.listen(_onEventChanged);
    });
  }

  @override
  void dispose(){
    sub1.cancel();
    sub2.cancel();
    super.dispose();
  }

  _onEventAdded(Event event) {
    setState(() {
      credentials.add(Credentials.fromSnapShot(event.snapshot));
    });
  }

  _onEventChanged(Event event) {
    var old = credentials.singleWhere((entry) {
      return entry.key == event.snapshot.key;
    });

    setState(() {
      credentials[credentials.indexOf(old)] =
          Credentials.fromSnapShot(event.snapshot);
    });
  }

  Future<void> handleSubmit() async {
    credential.firstName = _firstnameController.text;
    credential.lastName = _lastnameController.text;
    credential.email = _emailController.text;
    credential.password = _passwordController.text;

    if (credential.firstName != "" && credential.lastName != "" && credential.email != "" && credential.password != "") {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: credential.email, password: credential.password)
          .whenComplete((){
        credentialRef.push().set(credential.toJson());
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

  final _firstnameController = new TextEditingController();
  final _lastnameController = new TextEditingController();
  final _emailController = new TextEditingController();
  final _passwordController = new TextEditingController();
  String _errorText = "";

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
      key: _scaffoldstate,
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
                      width: uni_width / 0.9,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          CircleAvatar(
                            radius: 40.0,
                            backgroundColor: Colors.white,
                            child: Image(
                              image: AssetImage(
                                  'assets/images/FreshkoLogo.png'),
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
                    Flexible(
                      child: Container(
                        height: uni_height / 1.8,
                        width: uni_width / 0.9,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10.0),
                              bottomRight: Radius.circular(10.0),
                            ),
                            color: Color(0xFF3C4D5D).withOpacity(0.75)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            (_errorText != "") ?
                            Padding(
                              padding: EdgeInsets.only(bottom: 8.0),
                              child: Text(
                                _errorText,
                                style: TextStyle(
                                  color: Colors.red,
                                ),
                              ),
                            ) : Container(),
                            Container(
                                height: uni_height / 15,
                                width: uni_width / 1.8,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30.0),
                                  color: Colors.white,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 10.0, right: 10.0),
                                  child: TextFormField(
                                    style: TextStyle(
                                        fontFamily: 'ArimaMadurai',
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black
                                    ),
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'First Name*',
                                        hintStyle: TextStyle(
                                            fontFamily: 'ArimaMadurai',
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.w400
                                        )
                                    ),
                                    validator: (val) =>
                                    val == ""
                                        ? val
                                        : null,
                                    controller: _firstnameController,
                                  ),
                                )
                            ),
                            Padding(padding: EdgeInsets.only(top: 15.0)),
                            Container(
                                height: uni_height / 15,
                                width: uni_width / 1.8,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30.0),
                                  color: Colors.white,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10.0, right: 10.0),
                                  child: TextFormField(
                                    style: TextStyle(
                                        fontFamily: 'ArimaMadurai',
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black
                                    ),
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'Last Name*',
                                        hintStyle: TextStyle(
                                            fontFamily: 'ArimaMadurai',
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.w400
                                        )
                                    ),
                                    validator: (val) => val == "" ? val : null,
                                    controller: _lastnameController,
                                  ),
                                )
                            ),
                            //EMAIL FIELD
                            Padding(padding: EdgeInsets.only(top: 15.0)),
                            Container(
                                height: uni_height / 15,
                                width: uni_width / 1.8,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30.0),
                                  color: Colors.white,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10.0, right: 10.0),
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
                              height: uni_height / 15,
                              width: uni_width / 1.8,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0),
                                color: Colors.white,
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 10.0, right: 10.0),
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
                            Padding(padding: EdgeInsets.only(top: 50.0)),
                            //SIGN UP BUTTON
                            Container(
                              height: uni_height / 15,
                              width: uni_width / 1.8,
                              child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0)),
                                onPressed: () {
                                  while (credentialRef == null) {}
                                  handleSubmit().whenComplete((){
                                    if(_validated){
                                      final snackBar = SnackBar(
                                        backgroundColor: Color(0xFF3C4D5D).withOpacity(0.75),
                                        content: Text('SignUp Successful!', style: TextStyle(color: Colors.white),),
                                        action: SnackBarAction(
                                            label: 'SignIn Here',
                                            onPressed: () {
                                              Navigator.of(context).pushNamedAndRemoveUntil('/SignIn', (Route<dynamic> route) => false);
                                            }),
                                        duration: Duration(seconds: 2),
                                      );
                                      _scaffoldstate.currentState.showSnackBar(snackBar);
                                    }
                                  });
                                },
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
            ),
          )
        ],
      ),
    );
  }
}

class Credentials {

  String key;
  String firstName;
  String lastName;
  String email;
  String password;

  Credentials(this.firstName, this.lastName, this.email);

  Credentials.fromSnapShot(DataSnapshot snapshot)
      : key = snapshot.key,
        firstName= snapshot.value["firstName"],
        lastName= snapshot.value["lastName"],
        email= snapshot.value["email"];

  toJson() {
    return {
      "firstName": firstName,
      "lastName": lastName,
      "email": email
    };
  }


}

