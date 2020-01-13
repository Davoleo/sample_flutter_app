//------------------------------------------------------------------------------------------------------------
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sample_flutter_app/screens/resolution_route.dart';

import 'controls_route.dart';

class BoxDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Layout Demo"),),
      body: Center(
        child: Container(
          decoration: ShapeDecoration(
              color: Colors.green,
              shape:
              Border.all(color: Colors.green[600], width: 2) +
                  Border.all(color: Colors.green[700], width: 2) +
                  Border.all(color: Colors.green[800], width: 2) +
                  Border.all(color: Colors.green[900], width: 2)
          ),
          padding: EdgeInsets.all(32),
          child: Text("DEMO"),
        ),
      ),
    );
  }
}

//Sameple Login Page ---------------------------------------------------------------------------------------------
class LoginPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // The structure of the content of the app
    return Scaffold(
      appBar: AppBar(title: Text("Positioning"),),   //Colored App bar at the top
      body: Container(                               //Body: Contains all the content
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //Title Box
            Container(margin: EdgeInsets.only(bottom: 16), child: Text("LOGIN"),),
            //Username Box
            Container(
              margin: EdgeInsets.only(bottom: 16),
              child: Row(
                children: <Widget>[
                  Container(child: Text("USERNAME"), margin: EdgeInsets.only(right: 8),),
                  Flexible(child: TextField(),)
                ],),
            ),
            // Password Box
            Container(
              margin: EdgeInsets.only(bottom: 16),
              child: Row(
                children: <Widget>[
                  Container(child: Text("PASSWORD"), margin: EdgeInsets.only(right: 8),),
                  Flexible(child: TextField(obscureText: true,),)
                ],),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[RaisedButton(child: Text("Login"), onPressed: () => {},)],
            )
          ],),
      ),
    );
  }
}

//Personal Budget Home Page --------------------------------------------------------------------------------------
class PersonalBudgetHomePage extends StatefulWidget {

  PersonalBudgetHomePage({Key key}) : super(key: key);
  // just like HTML element ids - something that is used to distinguish between different widgets

  final String title = "Personal Budget";

  @override
  State createState() {
    return _PersonalBudgetHomePageState();
  }
}

class _PersonalBudgetHomePageState extends State<PersonalBudgetHomePage> {

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.settings), onPressed: () => {}),
          IconButton(icon: Icon(Icons.refresh), onPressed: () => {})
        ],
      ),
      body: Container(),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          selectedItemColor: Color(0xFF9A020C),
          unselectedItemColor: Colors.grey,
          currentIndex: _selectedIndex,
          onTap: (_index) {
            setState(() {
              _selectedIndex = _index;
            });
          },
          items: const <BottomNavigationBarItem> [
            BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home'),),
            BottomNavigationBarItem(icon: Icon(Icons.list), title: Text('List'),),
            BottomNavigationBarItem(icon: Icon(Icons.search), title: Text('Details'),),
            BottomNavigationBarItem(icon: Icon(Icons.calendar_today), title: Text('Today'),),
          ]
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
        tooltip: "Add Transaction",
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

      drawer: Drawer(
        child: Container(
          color: Color(0xFF107F93),
          padding: EdgeInsets.fromLTRB(16, 32, 16, 16),
          child: Text("Demo Drawer"),
        ),
      ),


// Simple Bottom App Bar
//      bottomNavigationBar: BottomAppBar(
//        child: Container(
//          color: Colors.green[300],
//          height: 50,
//          child: Row(
//            mainAxisAlignment: MainAxisAlignment.spaceAround,
//            children: <Widget>[
//              FlatButton(child: Text("List"), onPressed: () => {},),
//              FlatButton(child: Text("Details"), onPressed: () => {}),
//              FlatButton(child: Text("Totals"), onPressed: () => {}),
//            ],
//          ),
//        ),
//      ),
    );
  }
}

class TestHomePage extends StatefulWidget {

  final String title;

  TestHomePage({Key key, this.title}) : super(key: key);

  @override
  State createState() {
    return _TestHomePageState();
  }
}

class _TestHomePageState extends State<TestHomePage> {
  User user = User();
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();

  void setDate(BuildContext context) async {
    //allows the user to choose a date and sets it to the DateTime
    //Async Function - Returns a Future<>
    var date = await showDatePicker(
        context: context,
        initialDate: _selectedDate,
        firstDate: DateTime(2018),
        lastDate: DateTime(2030)
    );

    //update the state
    if (date != null) {
      setState(() {
        _selectedDate = date;
      });
    }

    print("asbdadhajsdbaksdjasdjaksdhsahdkdhajkdh");
  }

  void setTime(context) async {
    var time = await showTimePicker(
        context: context,
        initialTime: _selectedTime
    );

    if (time != null) {
      setState(() {
        _selectedTime = time;
      });
    }
  }

  bool loginDisabled = true;

  //Full TextField Use Example
  @override
  Widget build(BuildContext context) {
    final DateFormat dateFormat = DateFormat("dd/MM/yyyy");

    return Scaffold(
      appBar: AppBar(title: Text(widget.title),),
      body: Center(child: Column(
        children: <Widget>[
          Padding(padding: EdgeInsets.all(16), child:
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8))
              ),
              labelText: "Username",
              icon: Icon(Icons.account_box),
            ),
            controller: userController,
            //onChanged: this._onChanged,   (Using the controller to listen to changes)
          ),),
          Padding(padding: EdgeInsets.all(16), child:
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8))
              ),
              labelText: "Password",
              icon: Icon(Icons.vpn_key),
            ),
            controller: passwordController,
            //onChanged: this._onChanged,   (USing the controller to listen to changes)
            obscureText: true,
          ),),
          Padding(
              padding: EdgeInsets.all(16),
              child: Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
                Text(dateFormat.format(_selectedDate)),
                IconButton(
                  icon: Icon(Icons.date_range),
                  onPressed: () => setDate(context),
                ),
                Padding(padding: EdgeInsets.only(left: 5),
                  child: Row(children: <Widget>[
                    Text(_selectedTime.format(context)),
                    IconButton(icon: Icon(Icons.access_time), onPressed: () => setTime(context),)
                  ],),
                )
              ],)
          ),
          RaisedButton(onPressed: loginDisabled ? null : this._loginPressed, child: Text("Log In"),),
          RaisedButton(child: Text("Controls"), onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => ControlsRoute()));},)
        ],
      ),),
    );
  }

  void _loginPressed() {
    setState(() {
      user.name = userController.text;
      user.password = passwordController.text;
    });
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ResolutionRoute())
    );
  }

  //To use with the onChanged Parameter
  // ignore: unused_element
  void _onChanged(String value) {
    setState(() {
      loginDisabled = userController.text.length == 0 || passwordController.text.length == 0;
    });
  }

  //To use with the TextEditingController listeners
  void onChanged() {
    setState(() {
      loginDisabled = userController.text.length == 0 || passwordController.text.length == 0;
    });
  }

  @override
  void initState() {
    super.initState();
    userController.addListener(onChanged);
    userController.addListener(removeSomeChars);
    passwordController.addListener(onChanged);
  }

  void removeSomeChars() {
    final text = userController.text.toLowerCase().replaceAll("@", "").replaceAll("#", "");

    userController.value = userController.value.copyWith(
        text: text,
        //Creates a text selection that of length 0 at the end of the text field content (which basically means to place a cursor at the end of the textfield)
        selection: TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing: TextRange.empty
    );
  }

  @override
  void dispose() {
    userController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}

class User {
  String name;
  String password;
}