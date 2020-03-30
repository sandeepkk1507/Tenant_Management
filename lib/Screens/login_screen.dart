import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/model/user.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _user = User();

  Future<FirebaseUser> login(String email, String pwd) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    try{
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: pwd);
      FirebaseUser user = result.user;
      return user;
    }catch(e){
      print(e.toString());
      return null;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                style: TextStyle(
                  color: Colors.amberAccent,
                ),
                decoration: InputDecoration(
                  labelText: 'Email Address',
                  labelStyle: TextStyle(color: Colors.orangeAccent),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.orangeAccent,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.orangeAccent,
                    ),
                  ),
                ),
                controller: _emailController,
//            onChanged: (val) => setState(() => _user.userName = val),
              ),
              TextFormField(
                obscureText: true,
                style: TextStyle(
                  color: Colors.amberAccent,
                ),
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(color: Colors.orangeAccent),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.orangeAccent,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.orangeAccent,
                    ),
                  ),
                ),
                controller: _passwordController,
              ),
              Container(
                color: Colors.orangeAccent,
                child: RaisedButton(
                    color: Colors.orangeAccent,
                    child: Text('Login'),
                    onPressed: () async {
                      final email = _emailController.text.toString().trim();
                      final pwd = _passwordController.text.toString().trim();

                      FirebaseUser user = await login(email, pwd);

                      if(user!=null){
                        Navigator.of(context).pushNamed('/startPage');
                      }else {
                        print("ERROR");
                      }
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
