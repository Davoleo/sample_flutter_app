import 'package:flutter/material.dart';
import 'package:sample_flutter_app/models/ToDoItem.dart';

class AddToDoItem extends StatefulWidget {
  @override
  _AddToDoItemState createState() => _AddToDoItemState();
}

class _AddToDoItemState extends State<AddToDoItem> {
  final ToDoItem item = ToDoItem(description: "", title: "");

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("New TO-DO"),
            leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () => Navigator.pop(context)),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.check),
                onPressed: () => Navigator.pop(context, this.item),
              )
            ],
          ),
          body: Padding(
            padding: EdgeInsets.all(8),
            child: Column(children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: "TITLE"),
                onChanged: (value) => item.title = value,
              ),
              TextField(
                decoration: InputDecoration(labelText: "DESCRIPTION"),
                onChanged: (value) => item.description = value,
              ),

              Checkbox(
                  value: item.done,
                  onChanged: (value) {
                    setState(() {
                      item.done = !item.done;
                    });
                  }
              )
            ],),
          ),
        )
    );
  }
}
