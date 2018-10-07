import 'package:flutter/material.dart';
import 'SlideRight.dart';
import 'homepage.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: new Container(
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: (){Navigator.of(context).pushAndRemoveUntil(SlideRightRoute(widget: HomePage()), (Route<dynamic> route) => false);}
            )
          ],
        ),
      ),
    );
  }
}
