/// A Flutter project based on a minimalist log in sign up UI design by https://dribbble.com/Pegakit
/// Matthew Hansen
/// https://github.com/mjhansen3

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SignUp extends StatefulWidget {
    @override
    _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> with SingleTickerProviderStateMixin {
    final GlobalKey<FormState> _signUpFormKey = GlobalKey<FormState>();
    final TextEditingController _emailController = TextEditingController();

    final FocusNode _focusNodeEmail = FocusNode();
    final FocusNode _focusNodeName = FocusNode();
    final FocusNode _focusNodePassword = FocusNode();
    final FocusNode _focusNodeButton = FocusNode();

    bool _autoValidate = false;
    bool _showValidEmail = false;

    String _validateEmail(String value) {
        String emailPattern = r'(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]{2,}$)';
        RegExp regExp = new RegExp(emailPattern);

        if (value.isEmpty) {
            _showValidEmail = false;
            return 'The email address is required.';
        } else if (!regExp.hasMatch(value)) {
            _showValidEmail = false;
            return 'The email address must be a valid email address.';
        } else {
            _showValidEmail = true;
        }

        return null;
    }

    String _validateName(String value) {
        String namePattern = r'(^[a-zA-ZÀ-ÿ- ]+$)';
        RegExp regExp = new RegExp(namePattern);

        if (value.isEmpty) {
            return 'The name is required.';
        } else if (!regExp.hasMatch(value)) {
            return 'The name must contain a-z, à-ÿ or space characters.';
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
                    _focusNodeName.unfocus();
                    _focusNodePassword.unfocus();
                    _focusNodeButton.unfocus();
                });
            },
            child: Scaffold(
                backgroundColor: Color(0xFFFFF7EB),
                body: SingleChildScrollView(
                    child: Stack(
                        children: <Widget>[
                            Positioned(
                                top: 50,
                                right: 12,
                                child: FlatButton(
                                    onPressed: () {
                                        Navigator.pop(context, '/login');
                                    },
                                    child: Text(
                                        "Log in",
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
                                                    "Sign up",
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
                                                    key: _signUpFormKey,
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
                                                                        controller: _emailController,
                                                                        keyboardType: TextInputType.emailAddress,
                                                                        textInputAction: TextInputAction.next,
                                                                        focusNode: _focusNodeEmail,
                                                                        validator: _validateEmail,
                                                                        onFieldSubmitted: (term) {
                                                                            _focusNodeEmail.unfocus();
                                                                            FocusScope.of(context).requestFocus(_focusNodeName);
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
                                                                                fontSize: 13,
                                                                            ),
                                                                            suffix: _showValidEmail ? SizedBox(
                                                                                width: 20,
                                                                                height: 12,
                                                                                child: Icon(
                                                                                    Icons.check,
                                                                                    size: 15,
                                                                                ),
                                                                            ) : null,
                                                                        ),
                                                                        //onSaved: onSavedEmail
                                                                    ),
                                                                ),
                                                                Padding(
                                                                    padding: EdgeInsets.only(
                                                                        bottom: 5,
                                                                    ),
                                                                    child: TextFormField(
                                                                        keyboardType: TextInputType.text,
                                                                        textInputAction: TextInputAction.next,
                                                                        focusNode: _focusNodeName,
                                                                        validator: _validateName,
                                                                        onFieldSubmitted: (term) {
                                                                            _focusNodeName.unfocus();
                                                                            FocusScope.of(context).requestFocus(_focusNodePassword);
                                                                        },
                                                                        style: TextStyle(
                                                                            fontSize: 16,
                                                                            fontFamily: 'Montserrat',
                                                                            fontWeight: FontWeight.w400,
                                                                        ),
                                                                        decoration: InputDecoration(
                                                                            labelText: "Name",
                                                                            hintText: "Matthew Hansen",
                                                                            hintStyle: TextStyle(
                                                                                fontFamily: 'Montserrat',
                                                                                fontWeight: FontWeight.w400,
                                                                                fontSize: 16,
                                                                            ),
                                                                            errorStyle: TextStyle(
                                                                                fontFamily: 'Montserrat',
                                                                                fontWeight: FontWeight.w400,
                                                                                fontSize: 13,
                                                                            ),
                                                                        ),
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
                                                                                fontSize: 13,
                                                                                fontFamily: 'Montserrat',
                                                                                fontWeight: FontWeight.w400,
                                                                            ),
                                                                            errorMaxLines: 3,
                                                                        ),
                                                                    ),
                                                                ),
                                                                RaisedButton(
                                                                    elevation: 10,
                                                                    focusNode: _focusNodeButton,
                                                                    shape: RoundedRectangleBorder(
                                                                        borderRadius: BorderRadius.all(Radius.circular(30))
                                                                    ),
                                                                    onPressed: () {
                                                                        if (_signUpFormKey.currentState.validate()) {
                                                                            _signUpFormKey.currentState.reset();
                                                                            setState(() {
                                                                                _autoValidate = false;
                                                                            });
                                                                        } else {
                                                                            setState(() {
                                                                                _autoValidate = true;
                                                                                _focusNodeEmail.unfocus();
                                                                                _focusNodeName.unfocus();
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
                                                                                "Sign up",
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
                            Positioned(
                                bottom: 50,
                                left: 60,
                                right: 60,
                                child: RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                        text: "By signing up you agree to our ",
                                        style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.w300,
                                            color: Color(0xFF33312E),
                                            fontSize: 13,
                                        ),
                                        children: <TextSpan> [
                                            TextSpan(
                                                text: "Terms of Use",
                                                style: TextStyle(
                                                    decoration: TextDecoration.underline,
                                                    fontFamily: 'Montserrat',
                                                    fontWeight: FontWeight.w300,
                                                    color: Color(0xFF33312E),
                                                    fontSize: 13,
                                                ),
                                            ),
                                            TextSpan(
                                                text: " and ",
                                                style: TextStyle(
                                                    fontFamily: 'Montserrat',
                                                    fontWeight: FontWeight.w300,
                                                    color: Color(0xFF33312E),
                                                    fontSize: 13,
                                                ),
                                            ),
                                            TextSpan(
                                                text: "Privacy Policy",
                                                style: TextStyle(
                                                    decoration: TextDecoration.underline,
                                                    fontFamily: 'Montserrat',
                                                    fontWeight: FontWeight.w300,
                                                    color: Color(0xFF33312E),
                                                    fontSize: 13,
                                                ),
                                            )
                                        ]
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
