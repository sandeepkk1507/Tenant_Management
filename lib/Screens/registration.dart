import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/Screens/login_screen.dart';
import 'package:flutterapp/model/user.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  final _user = User();
  final _userNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<bool> registerUser(String name, String email, String pwd) async {
    FirebaseAuth _auth = FirebaseAuth.instance;

    try{
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: pwd);
      FirebaseUser user = result.user;
      UserUpdateInfo info = UserUpdateInfo();
      info.displayName = name;
      user.updateProfile(info);
      return true;
    }catch(e) {
      print(e.toString());
      return false;
    }


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration'),
      ),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: Builder(
          builder: (context) => Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(children: <Widget>[
                TextFormField(
                    style: TextStyle(
                      color: Colors.amberAccent,
                    ),
                    decoration: InputDecoration(
                        labelText: 'User Name',
                        labelStyle: TextStyle(color: Colors.orangeAccent),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.orangeAccent,
                        )),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.orangeAccent,
                        ))),
                    controller: _userNameController,
                    validator: (value) {
                      if (value.trim().isEmpty) {
                        return 'Please enter User Name';
                      }
                    },
                    onSaved: (val) => setState(() => _user.userName = val),
                ),
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
                          )),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.orangeAccent,
                          ))),
                  controller: _emailController,
                  validator: (value) {
                    if (value.trim().isEmpty) {
                      return 'Please enter Email Address';
                    }
                  },
                  onSaved: (val) => setState(() => _user.userName = val),
                ),
                TextFormField(
                  style: TextStyle(
                    color: Colors.amberAccent,
                  ),
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(color: Colors.orangeAccent),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.orangeAccent,
                          )),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.orangeAccent,
                          ))),
                  controller: _passwordController,
                  validator: (value) {
                    if (value.trim().isEmpty) {
                      return 'Please enter Password';
                    }
                  },
                  onSaved: (val) => setState(() => _user.userName = val),
                ),
                Container(
                  color: Colors.orangeAccent,
                  child: RaisedButton(
                    color: Colors.orangeAccent,
                    child: Text('Register'),
                    onPressed: () async {
                      final email = _emailController.text.toString().trim();
                      final userName = _userNameController.text.toString().trim();
                      final password = _passwordController.text.toString().trim();
                      bool result = await registerUser(userName, email, password);
                      
                      if(result){
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => LoginPage()
                        ));
                      }else{
                        print('ERROR');
                      }
//                      final form = _formKey.currentState;
//                      if(form.validate()){
//                        form.save();
//                        _user.save();
//                        _showDialog(context);
//                        Navigator.pop(context);
//                      }
                    },
                  ),

                )
              ]),
            ),
          ),
        ),
      ),
    );
  }
  _showDialog(BuildContext context){
    Scaffold.of(context)
        .showSnackBar(
      SnackBar(
        content: Text('Registration Successful'),
      ),
    );
  }
}
