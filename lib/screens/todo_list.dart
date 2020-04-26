import 'package:flutter/material.dart';
import 'package:sample_flutter_app/models/ToDoItem.dart';

class ToDoList extends StatefulWidget {
  final String title;
  ToDoList({Key key, @required this.title}) : super(key: key);

  @override
  _ToDoListState createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  List<ToDoItem> items;

  @override
  void initState() {
    super.initState();
    items = [
      ToDoItem(title: "Title1", description: "Desc1"),
      ToDoItem(title: "Title2", description: "Desc2"),
      ToDoItem(title: "Title3", description: "Desc3"),
      ToDoItem(title: "Title4", description: "Desc4"),
    ];
  }

  void getNewItem(BuildContext context) async {
    ToDoItem newItem = await Navigator.pushNamed<dynamic>(context, '/addtodo');
    //null will be returned when the user exits using the back button on android
    if (newItem != null) {
      setState(() {
        items.add(newItem);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => this.getNewItem(context),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(8),
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
            key: UniqueKey(),
            background: DecoratedBox(
              decoration: BoxDecoration(color: Colors.red),
              child: Align(
                alignment: Alignment(-0.9, 0),
                child: Icon(Icons.delete, color: Colors.white,),
              ),
            ),
            direction: DismissDirection.startToEnd,
            onDismissed: (direction) {
              setState(() {
                items.removeAt(index);
              });
            },
            child: ListTile(
              title: Text(items[index].title),
              trailing: Icon(items[index].done
                        ? Icons.check_box
                        : Icons.check_box_outline_blank),
              onTap: () {
                Navigator.pushNamed(context, "/tododetail", arguments: items[index]);
//                Navigator.push(context, MaterialPageRoute<void>(
//                    builder: (context) {
//                      return ToDoDetails(item: items[index]);
//                    })
//                );
              },
              onLongPress: () {
                setState(() {
                  items[index].done = !items[index].done;
                });
              },
            ),
          );
        },
      ),
    ));
  }
}
