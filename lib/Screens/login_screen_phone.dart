import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../start_page.dart';

class LoginPhoneScreen extends StatelessWidget {
  final _phoneController = TextEditingController();
  final _codeController = TextEditingController();

  Future<bool> loginWithPhone(String phone, BuildContext context) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    _auth.verifyPhoneNumber(
        phoneNumber: phone,
        timeout: Duration(seconds: 60),
        verificationCompleted: (AuthCredential credential) async {
          Navigator.of(context).pop();
          AuthResult result = await _auth.signInWithCredential(credential);
          FirebaseUser user = result.user;
          if (user != 'null') {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => StartPage(),
                ));
          } else {
            print("ERROR");
          }
        },
        verificationFailed: (AuthException exception) {
          print(exception.toString());
        },
        codeSent: (String verificationId, [int forcedResendingToken]) {
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) {
                return AlertDialog(
                  title: Text("Give the Code?"),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      TextField(
                        controller: _codeController,
                      ),
                    ],
                  ),
                  actions: <Widget>[
                    FlatButton(
                      child: Text('Confirm'),
                      textColor: Colors.white,
                      color: Colors.blue,
                      onPressed: () async {
                        final _code = _codeController.text.trim();
                        AuthCredential credential =
                            PhoneAuthProvider.getCredential(
                                verificationId: verificationId, smsCode: _code);
                        AuthResult result =
                            await _auth.signInWithCredential(credential);
                        FirebaseUser user = result.user;
                        if (user != null) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => StartPage(),
                            ),
                          );
                        } else {
                          print('ERROR');
                        }
                      },
                    )
                  ],
                );
              });
        },
        codeAutoRetrievalTimeout: null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(36.0),
        child: Form(
          child: Column(
            children: <Widget>[
              TextFormField(
                style: TextStyle(
                  color: Colors.amberAccent,
                ),
                decoration: InputDecoration(
                    labelText: 'Mobile Number',
                    labelStyle: TextStyle(color: Colors.orangeAccent),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.orangeAccent,
                    )),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.orangeAccent,
                    ))),
                controller: _phoneController,
//              keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter Mobile Number';
                  }
                },
              ),
              Container(
                color: Colors.orangeAccent,
                child: RaisedButton(
                  color: Colors.orangeAccent,
                  child: Text('Login'),
                  onPressed: () {
                    final phoneNumber = _phoneController.text.trim();
                    loginWithPhone(phoneNumber, context);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
