import 'package:flutter/material.dart';
import 'package:sample_flutter_app/models/ToDoItem.dart';

class ToDoDetails extends StatelessWidget {
  const ToDoDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ToDoItem item = ModalRoute.of(context)!.settings.arguments as ToDoItem;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () => Navigator.pop(context),),
          title: Text("TODO Details"),
        ),
        body: Padding(
          padding: EdgeInsets.all(8),
          child: Column(children: <Widget>[
            Text("TITLE"),
            Text(item.title),
            Divider(),
            Text("DESCRIPTION"),
            Text(item.description),
            Divider(),
            Text("Done"),
            Icon(item.done != 0 ? Icons.check_box : Icons.check_box_outline_blank)
          ],),
        ),
      ),
    );
  }
}
