import "package:flutter/material.dart";

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tenant Management"),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Container(
        child: SingleChildScrollView(

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(height: 10.0,),
              Container(
                height: 120.0,
                child: FlatButton(
                  textColor: Colors.white,
                  child: Text("Add Tenants", style: TextStyle(fontSize: 30.0),),
                  color: Colors.amberAccent,
                  padding: const EdgeInsets.all(8.0),
                  splashColor: Colors.amber,
                  onPressed: () => {
                    Navigator.pushNamed(context, '/addTenant'),
                  },
                ),
              ),
              SizedBox(height: 10.0,),
              Container(
                height: 120.0,
                child: FlatButton(
                  textColor: Colors.white,
                  child: Text("View Tenants", style: TextStyle(fontSize: 30.0),),
                  color: Colors.amberAccent,
                  padding: const EdgeInsets.all(8.0),
                  splashColor: Colors.amber,
                  onPressed: () => {},
                ),
              ),
              SizedBox(height: 10.0,),
              Container(
                height: 120.0,
                child: FlatButton(
                  textColor: Colors.white,
                  child: Text("Update Rent", style: TextStyle(fontSize: 30.0),),
                  color: Colors.amberAccent,
                  padding: const EdgeInsets.all(8.0),
                  splashColor: Colors.amber,
                  onPressed: () => {},
                  onLongPress: () => {},
                ),
              ),
              SizedBox(height: 10.0,),
              Container(
                height: 120.0,
                child: FlatButton(
                  textColor: Colors.white,
                  child: Text("Reports", style: TextStyle(fontSize: 30.0),),
                  color: Colors.amberAccent,
                  padding: const EdgeInsets.all(8.0),
                  splashColor: Colors.amber,
                  onPressed: () => {},
                ),
              ),
              SizedBox(height: 10.0,),
            ],
          ),
        ),

      ),
    );
  }
}
