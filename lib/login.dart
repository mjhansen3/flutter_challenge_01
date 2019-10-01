import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Login extends StatefulWidget {
    @override
    _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
    final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();

    final FocusNode _focusNodeEmail = FocusNode();
    final FocusNode _focusNodePassword = FocusNode();
    final FocusNode _focusNodeButton = FocusNode();

    bool _autoValidate = false;

    String _validateEmail(String value) {
        String emailPattern = r'(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]{2,}$)';
        RegExp regExp = new RegExp(emailPattern);

        if (value.isEmpty) {
            return 'The email address is required.';
        } else if (!regExp.hasMatch(value)) {
            return 'The email address must be a valid email address.';
        }

        return null;
    }

    String _validatePassword(String value) {
        String passwordPattern = r'(?=^.{8,}$)(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?!.*\s)[0-9a-zA-Z!@#$%^&*()]*$';
        RegExp regExp = RegExp(passwordPattern);

        if (value.isEmpty) {
            return 'The password is required.';
        } else if (!regExp.hasMatch(value)) {
            return 'The password must at least be 8 characters long containing 1 lowercase letter, 1 uppercase letter, 1 digit and 1 special character.';
        }

        return null;
    }

    @override
    Widget build(BuildContext context) {
        return GestureDetector(
            onTap: () {
                setState(() {
                    _focusNodeEmail.unfocus();
                    _focusNodePassword.unfocus();
                    _focusNodeButton.unfocus();
                });
            },
            child: Scaffold(
                backgroundColor: Color(0xFFF5E3DA),
                body: SingleChildScrollView(
                  child: Stack(
                      children: <Widget>[
                          Positioned(
                              top: 50,
                              right: 12,
                              child: FlatButton(
                                  onPressed: () {
                                      Navigator.pushNamed(context, '/signup');
                                  },
                                  child: Text(
                                      "Sign Up",
                                      style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFF8C8C91),
                                          fontSize: 16,
                                      ),
                                  ),
                              ),
                          ),
                          Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height,
                            child: Padding(
                                padding: EdgeInsets.only(
                                    top: 100,
                                    left: 30,
                                    bottom: 30,
                                    right: 30,
                                ),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                        Padding(
                                            padding: EdgeInsets.only(
                                                top: 25,
                                            ),
                                            child: Text(
                                                "Log in",
                                                style: TextStyle(
                                                    fontFamily: 'Montserrat',
                                                    fontWeight: FontWeight.w700,
                                                    color: Color(0xFF000000),
                                                    fontSize: 20,
                                                ),
                                            ),
                                        ),
                                        Padding(
                                            padding: EdgeInsets.only(
                                                top: 30,
                                                bottom: 40,
                                            ),
                                            child: Form(
                                                key: _loginFormKey,
                                                autovalidate: _autoValidate,
                                                child: Theme(
                                                    data: ThemeData(
                                                        primaryColor: Color(0xFF000000),
                                                        inputDecorationTheme: InputDecorationTheme(
                                                            labelStyle: TextStyle(
                                                                color: Color(0xFF8C8C91),
                                                                fontSize: 16,
                                                            ),
                                                        ),
                                                    ),
                                                    child: Column(
                                                        children: <Widget>[
                                                            Padding(
                                                                padding: EdgeInsets.only(
                                                                    bottom: 5,
                                                                ),
                                                                child: TextFormField(
                                                                    keyboardType: TextInputType.emailAddress,
                                                                    textInputAction: TextInputAction.next,
                                                                    focusNode: _focusNodeEmail,
                                                                    validator: _validateEmail,
                                                                    onFieldSubmitted: (term) {
                                                                        _focusNodeEmail.unfocus();
                                                                        FocusScope.of(context).requestFocus(_focusNodePassword);
                                                                    },
                                                                    style: TextStyle(
                                                                        fontSize: 16,
                                                                        fontFamily: 'Montserrat',
                                                                        fontWeight: FontWeight.w400,
                                                                    ),
                                                                    decoration: InputDecoration(
                                                                        labelText: "Your Email",
                                                                        hintText: "hello@gmail.co",
                                                                        hintStyle: TextStyle(
                                                                            fontFamily: 'Montserrat',
                                                                            fontWeight: FontWeight.w400,
                                                                            fontSize: 16,
                                                                        ),
                                                                        errorStyle: TextStyle(
                                                                            fontFamily: 'Montserrat',
                                                                            fontWeight: FontWeight.w400,
                                                                            fontSize: 14,
                                                                        ),
                                                                    ),
                                                                    //textInputAction: TextInputAction.next,
                                                                ),
                                                            ),
                                                            Padding(
                                                                padding: EdgeInsets.only(
                                                                    bottom: 25,
                                                                ),
                                                                child: TextFormField(
                                                                    keyboardType: TextInputType.text,
                                                                    textInputAction: TextInputAction.go,
                                                                    obscureText: true,
                                                                    focusNode: _focusNodePassword,
                                                                    validator: _validatePassword,
                                                                    onFieldSubmitted: (term) {
                                                                        _focusNodePassword.unfocus();
                                                                        FocusScope.of(context).requestFocus(_focusNodeButton);
                                                                    },
                                                                    style: TextStyle(
                                                                        fontSize: 16,
                                                                        fontFamily: 'Montserrat',
                                                                        fontWeight: FontWeight.w400,
                                                                    ),
                                                                    decoration: InputDecoration(
                                                                        labelText: "Password",
                                                                        hintText: "*********",
                                                                        hintStyle: TextStyle(
                                                                            fontSize: 16,
                                                                            fontFamily: 'Montserrat',
                                                                            fontWeight: FontWeight.w400,
                                                                        ),
                                                                        errorStyle: TextStyle(
                                                                            fontSize: 14,
                                                                            fontFamily: 'Montserrat',
                                                                            fontWeight: FontWeight.w400,
                                                                        ),
                                                                        errorMaxLines: 3,
                                                                        suffix: SizedBox(
                                                                            width: 50,
                                                                            height: 20,
                                                                            child: FlatButton(
                                                                                padding: EdgeInsets.all(0),
                                                                                onPressed: () {

                                                                                },
                                                                                child: Text(
                                                                                    "Forgot",
                                                                                    style: TextStyle(
                                                                                        fontFamily: 'Montserrat',
                                                                                        fontWeight: FontWeight.w300,
                                                                                        color: Color(0xFF000000),
                                                                                        fontSize: 12,
                                                                                    ),
                                                                                ),
                                                                            ),
                                                                        ),
                                                                    ),
                                                                ),
                                                            ),
                                                            RaisedButton(
                                                                elevation: 10,
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius: BorderRadius.all(Radius.circular(30))
                                                                ),
                                                                onPressed: () {
                                                                    if (_loginFormKey.currentState.validate()) {
                                                                        _loginFormKey.currentState.reset();
                                                                        setState(() {
                                                                            _autoValidate = false;
                                                                        });
                                                                    } else {
                                                                        setState(() {
                                                                            _autoValidate = true;
                                                                            _focusNodeEmail.unfocus();
                                                                            _focusNodePassword.unfocus();
                                                                            _focusNodeButton.unfocus();
                                                                        });
                                                                    }
                                                                },
                                                                color: Color(0xFF33312E),
                                                                child: SizedBox(
                                                                    width: MediaQuery.of(context).size.width,
                                                                    child: Center(
                                                                        child: Text(
                                                                            "Log in",
                                                                            style: TextStyle(
                                                                                fontFamily: 'Montserrat',
                                                                                fontWeight: FontWeight.w300,
                                                                                color: Color(0xFFFFFFFF),
                                                                                fontSize: 14,
                                                                            ),
                                                                        ),
                                                                    ),
                                                                ),
                                                            ),
                                                        ],
                                                    ),
                                                ),
                                            ),
                                        ),
                                        Padding(
                                            padding: EdgeInsets.only(
                                                bottom: 40,
                                            ),
                                            child: Container(
                                                width: MediaQuery.of(context).size.width,
                                                child: Text(
                                                    "Or sign up with social account",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontFamily: 'Montserrat',
                                                        fontWeight: FontWeight.w300,
                                                        color: Color(0xFF33312E),
                                                        fontSize: 13,
                                                    ),
                                                ),
                                            ),
                                        ),
                                        Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: <Widget>[
                                                FlatButton(
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.all(Radius.circular(30)),
                                                        side: BorderSide(
                                                            color: Color(0xFF33312E),
                                                        ),
                                                    ),
                                                    onPressed: () {

                                                    },
                                                    child: SizedBox(
                                                        width: 100,
                                                        child: Row(
                                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                            children: <Widget>[
                                                                Image.asset(
                                                                    'assets/facebook_ico.png',
                                                                    scale: 15,
                                                                ),
                                                                Text(
                                                                    "Facebook",
                                                                    style: TextStyle(
                                                                        fontFamily: 'Montserrat',
                                                                        fontWeight: FontWeight.w300,
                                                                        color: Color(0xFF33312E),
                                                                        fontSize: 14,
                                                                    ),
                                                                ),
                                                            ],
                                                        ),
                                                    ),
                                                ),
                                                FlatButton(
                                                    onPressed: () {

                                                    },
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.all(Radius.circular(30)),
                                                        side: BorderSide(
                                                            color: Color(0xFF33312E),
                                                        ),
                                                    ),
                                                    child: SizedBox(
                                                        width: 100,
                                                        child: Row(
                                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                            children: <Widget>[
                                                                Image.asset(
                                                                    'assets/twitter_ico.png',
                                                                    scale: 15,
                                                                ),
                                                                Text(
                                                                    "Twitter",
                                                                    style: TextStyle(
                                                                        fontFamily: 'Montserrat',
                                                                        fontWeight: FontWeight.w300,
                                                                        color: Color(0xFF33312E),
                                                                        fontSize: 14,
                                                                    ),
                                                                ),
                                                            ],
                                                        ),
                                                    ),
                                                ),
                                            ],
                                        ),
                                    ],
                                ),
                            ),
                          ),
                      ],
                  ),
                ),
            ),
        );
    }
}
