import 'package:eb_bill/models/custom_user.dart';
import 'package:eb_bill/utils/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  final CustomUser user;
  Home(this.user);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 50.0, vertical: 5.0),
            child: TextField(
                decoration: InputDecoration(
                    hintText: "Name",
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 10.0),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.orange, width: 1.0)),
                    fillColor: Colors.grey[100],
                    border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.black, width: 1.0)),
                    filled: true),
                onChanged: (val) {
                  setState(() {
                    name = val;
                  });
                }),
          ),
          RaisedButton(
            onPressed: () async {
              widget.user.addName(name, widget.user);
            },
            child: Text(
              "Change Name",
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.blue,
          ),
          RaisedButton(
            onPressed: () async {
              final user = await AuthService().signOut();
            },
            child: Text(
              "Sign Out",
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}
