import 'package:eb_bill/models/custom_user.dart';
import 'package:eb_bill/pages/auth/sign_in.dart';
import 'package:eb_bill/pages/auth/sign_up.dart';
import 'package:eb_bill/pages/home/home.dart';
import 'package:eb_bill/utils/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return MultiProvider(
              providers: [
                // ignore: missing_required_param
                StreamProvider<User>(
                    create: (context) => AuthService().userChanges)
              ],
              child: MaterialApp(
                debugShowCheckedModeBanner: false,
                home: AuthWrapper(),
              ),
            );
          }
        });
  }
}

class AuthWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user =
        AuthService().createCustomUserFromFirebaseUser(context.watch<User>());
    print(user);

    if (user != null) {
      return Home(user);
    } else if (user == null) {
      return SignUp();
    }
  }
}
