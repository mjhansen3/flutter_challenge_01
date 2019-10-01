/// A Flutter project based on a minimalist log in sign up UI design by https://dribbble.com/Pegakit
/// Matthew Hansen
/// https://github.com/mjhansen3

import 'package:flutter/material.dart';

import 'login.dart';
import 'sign_up.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            title: 'Minimalist Log in/Sign up',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                primarySwatch: Colors.blue,
            ),
            home: Login(),
            routes: <String, WidgetBuilder> {
                '/login': (BuildContext context) => Login(),
                '/signup': (BuildContext context) => SignUp(),
            },
        );
    }
}