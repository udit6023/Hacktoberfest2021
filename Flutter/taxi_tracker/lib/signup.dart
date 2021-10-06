import 'dart:ui';

import 'login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class signup extends StatefulWidget {
  const signup({Key? key}) : super(key: key);

  @override
  _signupState createState() => _signupState();
}

class _signupState extends State<signup> {
  bool seepass = false;
  bool seecpass = false;
  FirebaseAuth auth = FirebaseAuth.instance;
  Color _iconcolor = Colors.grey;
  Color _iconcolor1 = Colors.grey;
  bool iscreateaccountclicked = false;
  final _formkey = GlobalKey<FormState>();
  TextEditingController _email = TextEditingController();
  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _conpassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
        ),
        home: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              elevation: 0.0,
              backgroundColor: Colors.white,
            ),
            body:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: <
                    Widget>[
              Spacer(),
              Text(
                "VideoTracker.",
                style: TextStyle(
                  color: Color(0xff05386b),
                  fontSize: 49.0,
                ),
              ),
              Spacer(),
              Form(
                  key: _formkey,
                  child: Column(children: [
                    Container(
                      // height: 44.6,
                      width: 375.93,
                      child: TextFormField(
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Username';
                          } else {
                            return null;
                          }
                        },
                        controller: _username,
                        decoration: InputDecoration(
                            labelText: "Username",
                            hintText: "Username",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Container(
                        // height: 44.6,
                        width: 375.93,
                        child: TextFormField(
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter Password';
                            } else if (_password.text != _conpassword.text) {
                              return 'Please Enter the same password';
                            } else {
                              return null;
                            }
                          },
                          controller: _password,
                          obscureText: seepass ? false : true,
                          decoration: InputDecoration(
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      if (seepass) {
                                        seepass = false;
                                        _iconcolor = Colors.blue;
                                      } else {
                                        seepass = true;
                                        _iconcolor = Colors.grey;
                                      }
                                    });
                                  },
                                  icon: Icon(
                                    Icons.remove_red_eye,
                                    color: _iconcolor,
                                  )),
                              labelText: "Password",
                              hintText: "Password",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Container(
                        // height: 44.6,
                        width: 375.93,
                        child: TextFormField(
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter Confirmed password';
                            } else if (_password.text != _conpassword.text) {
                              return 'Please Enter the same password';
                            } else {
                              return null;
                            }
                          },
                          obscureText: seecpass ? false : true,
                          controller: _conpassword,
                          decoration: InputDecoration(
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      if (seecpass) {
                                        seecpass = false;
                                        _iconcolor1 = Colors.blue;
                                      } else {
                                        seecpass = true;
                                        _iconcolor1 = Colors.grey;
                                      }
                                    });
                                  },
                                  icon: Icon(
                                    Icons.remove_red_eye,
                                    color: _iconcolor1,
                                  )),
                              labelText: "Confirm Password",
                              hintText: "Confirm Password",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Container(
                        // height: 44.6,
                        width: 375.93,
                        child: TextFormField(
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter Email';
                            } else {
                              return null;
                            }
                          },
                          controller: _email,
                          decoration: InputDecoration(
                              labelText: "Email ID",
                              hintText: "Email ID",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                      ),
                    )
                  ])),
              Spacer(),
              Container(
                height: 44.6,
                width: 375.93,
                child: RaisedButton(
                  onPressed: () async {
                    setState(() {
                      if (_formkey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Processing Data')),
                        );
                      }
                    });

                    if (_password.text == _conpassword.text) {
                      UserCredential userCredential = await FirebaseAuth
                          .instance
                          .createUserWithEmailAndPassword(
                              email: _email.text, password: _password.text);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => login()));
                    }
                  },
                  color: Color(0xff5cdb95),
                  child: Text("Sign up",
                      style: TextStyle(color: Colors.white, fontSize: 18.0)),
                ),
              ),
              Spacer(),
              Row(children: <Widget>[
                Expanded(
                  child: new Container(
                      margin: const EdgeInsets.only(left: 10.0, right: 15.0),
                      child: Divider(
                        color: Colors.grey,
                        height: 50,
                      )),
                ),
                Text(
                  "OR",
                  style: TextStyle(color: Colors.grey),
                ),
                Expanded(
                  child: new Container(
                      margin: const EdgeInsets.only(left: 15.0, right: 10.0),
                      child: Divider(
                        color: Colors.grey,
                        height: 50,
                      )),
                ),
              ]),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Have an account?",
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => login()));
                    },
                    child: Text("Login",
                        style:
                            TextStyle(color: Color(0xff05386b), fontSize: 16)),
                  )
                ],
              ),
              Spacer(),
            ])));
  }
}
