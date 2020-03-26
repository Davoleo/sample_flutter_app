import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FormsRoute extends StatefulWidget {
  final DateFormat _dateFormat = DateFormat("dd/MM/yyyy");

  @override
  _FormsRouteState createState() => _FormsRouteState();
}

class _FormsRouteState extends State<FormsRoute> {
  final _formKey = GlobalKey<FormState>();
  final _passwordKey = GlobalKey<FormFieldState>();

  final UserRegistration user = UserRegistration();
  DateTime _selectedDate = DateTime.now();

  getData(BuildContext context) async {
    var date = await showDatePicker(
        context: context,
        initialDate: _selectedDate,
        firstDate: DateTime(1990),
        lastDate: DateTime(2030)
    );
    //update the state
    if (date != null) {
      setState(() {
        user.birthDate = date;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Forms"),),
      body: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.all(16),
            child: ListView(
              children: <Widget>[
                //NAME
                TextFormField(
                  decoration: InputDecoration(labelText: "Name"),
                  //Called when the sign up button is pressed
                  onSaved: (value) => user.name = value,
                  //when the user submits editable content (with the button on the keyboard)
                  onEditingComplete: null,
                  validator: (value) {
                    if(value.isEmpty)
                      return "This field is necessary!";
                    else if (value.length < 3)
                      return "Invalid Name";
                    return null;
                  },
                ),
                //SURNAME
                TextFormField(
                  decoration: InputDecoration(labelText: "Surname"),
                  onSaved: (value) => user.name = value,
                  validator: (value) {
                    if(value.isEmpty)
                      return "This field is necessary!";
                    else if (value.length < 3)
                      return "Invalid Surame";
                    return null;
                  },
                ),
                Row(children: <Widget>[
                  Text("Zone"),
                  Spacer(),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    child: DropdownButtonFormField<EnumZone>(
                      value: user.zone,
                      onChanged: (value) {
                        setState(() {
                          user.zone = value;
                        });
                      },
                      onSaved: (value) => user.zone = value,
                      items: [
                        DropdownMenuItem(child: Text("North"), value: EnumZone.NORTH,),
                        DropdownMenuItem(child: Text("Centre"), value: EnumZone.CENTRE,),
                        DropdownMenuItem(child: Text("South"), value: EnumZone.SOUTH,),
                      ],
                    ),
                  )
                ],),
                Row(children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(16), 
                    child: Text("Birth Date"),
                  ),
                  Spacer(),
                  Text(user.birthDate == null ? "--/--/----" : widget._dateFormat.format(user.birthDate)),
                  IconButton(icon: Icon(Icons.date_range), onPressed: () => getData(context))
                ],),
                TextFormField(
                  decoration: InputDecoration(labelText: "Email"),
                  onSaved: (value) => user.email = value,
                  validator: (value) {
                    if (value.isEmpty)
                      return "This field is necessary!";
                    else if (!RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value))
                      return "Invalid e-mail";
                    return null;
                  },
                ),
                TextFormField(
                  key: _passwordKey,
                  obscureText: true,
                  decoration: InputDecoration(labelText: "Password"),
                  onSaved: (value) => user.password = value,
                  validator: (value) {
                    if (value.isEmpty)
                      return "This field is necessary";
                    else if (value.length < 5)
                      return "The password is too short";
                    return null;
                  }
                ),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(labelText: "Confirm Password"),
                  onSaved: (value) => user.rePassword = value,
                  validator: (value) {
                    if (value != _passwordKey.currentState.value)
                      return "Password fields do not match";
                    return null;
                  },
                ),
                Row(children: <Widget>[
                  Text("Subscribe to Newsletter"),
                  Spacer(),
                  Checkbox(
                    value: user.newsLetter,
                    onChanged: (value) {
                      setState(() {
                        user.newsLetter = value;
                      });
                    },
                  ),
                ],),
                //REGISTER BUTTON
                RaisedButton(
                  child: Text("Sign up"),
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      print("No Errors");
                      _formKey.currentState.save();
                    }
                  },
                )
              ],
            ),
          )
      ),
    );
  }
}

enum EnumZone {
  NORTH,
  CENTRE,
  SOUTH
}

class User {
  String name;
  String surname;
  EnumZone zone = EnumZone.CENTRE;
  String email;
  String password;
  DateTime birthDate;
  bool newsLetter = false;
}

class UserRegistration extends User {
  String rePassword;
}