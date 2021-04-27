import 'package:eb_bill/utils/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  SignInState createState() => SignInState();
}

class SignInState extends State<SignIn> {
  var email;
  var pass;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Sign In'),
        ),
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
            child: TextField(
              decoration: InputDecoration(
                  hintText: "Email",
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 5.0),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.orange, width: 1.0)),
                  fillColor: Colors.grey[100],
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1.0)),
                  filled: true),
              onChanged: (val) => setState(() {
                email = val;
              }),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 50.0, vertical: 5.0),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                  hintText: "Password",
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 10.0),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.orange, width: 1.0)),
                  fillColor: Colors.grey[100],
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1.0)),
                  filled: true),
              onChanged: (val) => setState(() {
                pass = val;
              }),
            ),
          ),
          RaisedButton(
            onPressed: () async {
              final user =
                  await AuthService().signInWithEmailAndPassword(email, pass);
              Navigator.pop(context);
            },
            color: Colors.blue,
            child: Text(
              'Sign In',
              style: TextStyle(color: Colors.white),
            ),
          ),
          RaisedButton(
            onPressed: () async {
              Navigator.pop(context);
            },
            color: Colors.blue,
            child: Text(
              'Sign Up',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ]));
  }
}
