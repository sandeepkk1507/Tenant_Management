import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterapp/model/tenant.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

class AddTenant extends StatefulWidget {
  @override
  _AddTenantState createState() => _AddTenantState();
}

class _AddTenantState extends State<AddTenant> {
  final _formKey = GlobalKey<FormState>();
  final _tenant = Tenant();
  var _value = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: Text('Add Tenant'),
        actions: <Widget>[
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: Builder(
          builder: (context) => Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  TextFormField(
                      style: TextStyle(
                        color: Colors.amberAccent,
                      ),
                    decoration: InputDecoration(
                      labelText: 'Tenant Name',
                      labelStyle: TextStyle(color: Colors.orangeAccent),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.orangeAccent,
                        )
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.orangeAccent,
                        )
                      )
                    ),
                    validator: (value) {
                      if(value.trim().isEmpty) {
                        return 'Please enter Tenant Name';
                      }
                    },
                    onSaved: (val) => setState(() => _tenant.tenantName = val)
                  ),
                  BasicDateField(),
//                  InkWell(
//                    onTap: () {
//                      _selectDate();   // Call Function that has showDatePicker()
//                    },
//                    child: IgnorePointer(
//                      child: new TextFormField(
//                        decoration: new InputDecoration(labelText: 'Start Date',
//                            labelStyle: TextStyle(color: Colors.orangeAccent),
//                            enabledBorder: UnderlineInputBorder(
//                                borderSide: BorderSide(
//                                  color: Colors.orangeAccent,
//                                )
//                            ),
//                            focusedBorder: UnderlineInputBorder(
//                                borderSide: BorderSide(
//                                  color: Colors.orangeAccent,
//                                )
//                            )
//
//                        ),
//                          validator: (value) {
//                            if(value.isEmpty) {
//                              return 'Please enter Start date';
//                            }
//                          },
//                          onSaved: (val) => setState(() => _tenant.startDate = val),
//                      ),
//                    ),
//                  ),
//                  TextFormField(
//                      style: TextStyle(
//                        color: Colors.amberAccent,
//                      ),
//                      decoration: InputDecoration(
//                        labelText: 'Start Date',
//                        labelStyle: TextStyle(color: Colors.orangeAccent),
//                          enabledBorder: UnderlineInputBorder(
//                              borderSide: BorderSide(
//                                color: Colors.orangeAccent,
//                              )
//                          ),
//                          focusedBorder: UnderlineInputBorder(
//                              borderSide: BorderSide(
//                                color: Colors.orangeAccent,
//                              )
//                          )
//                      ),
//                      validator: (value) {
//                        if(value.isEmpty) {
//                          return 'Please enter Start date';
//                        }
//                      },
//                      onSaved: (val) => setState(() => _tenant.startDate = val)
//                  ),
                  TextFormField(
                      style: TextStyle(
                        color: Colors.amberAccent,
                      ),
                      decoration: InputDecoration(
                        labelText: 'Rent',
                        labelStyle: TextStyle(color: Colors.orangeAccent),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.orangeAccent,
                              )
                          ),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.orangeAccent,
                              )
                          )
                      ),
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        WhitelistingTextInputFormatter.digitsOnly
                      ],
                      validator: (value) {
                        if(value.isEmpty) {
                          return 'Please enter Rent Amount';
                        }
                      },
                      onSaved: (val) => setState(() => _tenant.rent = val)
                  ),
                  TextFormField(
                      style: TextStyle(
                        color: Colors.amberAccent,
                      ),
                      decoration: InputDecoration(
                        labelText: 'Advance Amount',
                        labelStyle: TextStyle(color: Colors.orangeAccent),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.orangeAccent,
                              )
                          ),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.orangeAccent,
                              )
                          )
                      ),
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        WhitelistingTextInputFormatter.digitsOnly
                      ],
                      validator: (value) {
                        if(value.isEmpty) {
                          return 'Please enter Advance Amount';
                        }
                      },
                      onSaved: (val) => setState(() => _tenant.advance = val)
                  ),
                  TextFormField(
                      style: TextStyle(
                        color: Colors.amberAccent,
                      ),
                      decoration: InputDecoration(
                        labelText: 'Proof Path',
                        labelStyle: TextStyle(color: Colors.orangeAccent),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.orangeAccent,
                              )
                          ),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.orangeAccent,
                              )
                          )
                      ),
                      validator: (value) {
                        if(value.trim().isEmpty) {
                          return 'Please enter Proof path';
                        }
                      },
                      onSaved: (val) => setState(() => _tenant.proofPath = val)
                  ),
                  TextFormField(
                      style: TextStyle(
                        color: Colors.amberAccent,
                      ),
                      decoration: InputDecoration(
                        labelText: 'Agreement Path',
                        labelStyle: TextStyle(color: Colors.orangeAccent),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.orangeAccent,
                              )
                          ),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.orangeAccent,
                              )
                          )
                      ),
                      validator: (value) {
                        if(value.trim().isEmpty) {
                          return 'Please enter Agreement path';
                        }
                      },
                      onSaved: (val) => setState(() => _tenant.agreement = val)
                  ),
                  Container(
                    color: Colors.orangeAccent,
                    child: RaisedButton(
                      color: Colors.orangeAccent,
                      child: Text('Add'),
                      onPressed: () {
                        final form = _formKey.currentState;
                        if(form.validate()){
                          form.save();
                          _tenant.save();
                          _showDialog(context);
                          Navigator.pop(context);
                        }
                      },
                    ),

                  )
                ],
              ),
            ),
          ),
        )
      ),
    );
  }
  _showDialog(BuildContext context){
    Scaffold.of(context)
        .showSnackBar(
        SnackBar(
          content: Text('Submitting form'),
        ),
    );
  }
  Future _selectDate() async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2016),
        lastDate: DateTime.now().add(Duration(days: 365)),
    );
    if(picked != null) {
      setState(() => _tenant.startDate = picked.toString());
    }
  }
}
class BasicDateField extends StatelessWidget {
  final format = DateFormat("dd-MM-yyyy");
  @override
  Widget build(BuildContext context) {
    return
      DateTimeField(
        style: TextStyle(
          color: Colors.amberAccent,
        ),
        decoration: new InputDecoration(labelText: 'Start Date',
          labelStyle: TextStyle(color: Colors.orangeAccent),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.orangeAccent,
              )
          ),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.orangeAccent,
              )
          )

      ),
      format: format,
      onShowPicker: (context, currentValue) {
        return showDatePicker(
          context: context,
          firstDate: DateTime(1900),
          initialDate: currentValue ?? DateTime.now(),
          lastDate: DateTime.now().add(Duration(days: 365)),
        );
      },
    );
  }
}
