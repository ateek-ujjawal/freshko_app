import 'package:flutter/material.dart';
import 'package:fresko/Generics/Colors.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => new _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  bool _onClick = false;
  String _text = 'FIRST/LAST NAME';
  List<String> list = ["Order History", "Your Addresses", "Your Default Shopping List", "Your Cart"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: FractionalTranslation(
          translation: Offset(0.0, 0.1),
          child: Text('Freshko',
            style: TextStyle(
              fontFamily: 'ArimaMadurai',
              fontWeight: FontWeight.w900,
              fontSize: 30.0
            )
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image(
                    image: AssetImage('assets/images/N9.jpg'),
                  ),
                ]
              ),
              Positioned(
                right: 10.0,
                top: 10.0,
                child: IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: (){
                    setState(() {
                      if(_onClick == false) {
                        _onClick = true;
                      }
                      else
                        _onClick = false;
                    });
                  },
                  color: Colors.white,
                ),
              ),
              Positioned(
                left: 40.0,
                top: 180.0,
                child: Row(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white),
                        color: Colors.green
                      ),
                      height: 60.0,
                      width: 60.0,
                      child: Center(
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 3.0),
                            color: Colors.green,
                          ),
                          height: 50.0,
                          width: 50.0,
                          child: Center(
                            child: Icon(Icons.account_circle, color: Colors.white)
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: (_onClick == false) ? Text(
                        _text,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontFamily: 'ArimaMadurai',
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                        ),
                      ) : Container(
                        width: 200.0,
                        child: TextField(
                          autofocus: true,
                          decoration: InputDecoration(
                            labelText: 'Edit username',
                            labelStyle: TextStyle(color: Colors.white, fontSize: 20.0),
                            hintText: 'Username',
                            hintStyle: TextStyle(color: Colors.white, fontSize: 20.0),
                            enabled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'ArimaMadurai',
                            fontSize: 20.0
                          ),
                          onSubmitted: (name) {
                            setState(() {
                              _onClick = false;
                              _text = name;
                              if(_text == "")
                                _text = "FIRST/LAST NAME";
                            });
                          },
                        ),
                      ),
                    )
                  ],
                ),
              )
            ]
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: ListView.separated(
              shrinkWrap: true,
              separatorBuilder: (BuildContext context, int index) {
                return Divider(color: themeColor);
              },
              itemCount: 4,
              itemBuilder: (BuildContext, int index) {
                return ListTile(
                  trailing: Icon(Icons.arrow_forward),
                  title: Text(
                    list[index],
                    style: TextStyle(
                      fontFamily: 'ArimaMadurai'
                    ),
                  ),
                  onTap: (){},
                );
              }
            )
          )
        ],
      ),
    );
  }
}

