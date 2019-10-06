import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
    runApp(MyApp());
}

//Stateless widgets (For stuff that doesn't change)
//Stateful widgets (For stuff that does change)
class MyApp extends StatelessWidget {

  final String text = "Hello World";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "SampleFlutterApp",
      theme: ThemeData(primarySwatch: Colors.green),
      home: PersonalBudgetHomePage(),
    );
  }

}

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

//Sameple Login Page
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

//Personal Budget Home Page
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

//Legacy Home

//return Container(
//color: Colors.grey,
//padding: const EdgeInsets.all(26.0),
//margin: EdgeInsets.only(top:30),
//alignment: Alignment.topCenter,
//child: Column(
////Flexbox Styled widget positioning
//mainAxisAlignment: MainAxisAlignment.start,
//mainAxisSize: MainAxisSize.max,
//crossAxisAlignment: CrossAxisAlignment.stretch,
//textDirection: TextDirection.ltr,
//children: <Widget>[
//Container(color: Colors.red, child: Text(this.text, textDirection: TextDirection.ltr,),) ,
//Container(color: Colors.blue, child: Text("Brief Text", textDirection: TextDirection.ltr,),),
//Container(color: Colors.green, child: Text("Very very crazy long text", textDirection: TextDirection.ltr,),),
//],
//),
//);