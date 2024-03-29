import 'package:flutter/material.dart';
import 'package:sample_flutter_app/models/ToDoItem.dart';
import 'package:sample_flutter_app/repository/DataRepository.dart';
import 'package:sample_flutter_app/repository/SQLRepository.dart';

class ToDoList extends StatefulWidget {
  ToDoList({Key? key}) : super(key: key);

  @override
  _ToDoListState createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {

  late DataRepository _repository;

  @override
  void initState() {
    super.initState();
    _repository = SQLRepository();
  }

  @override
  void dispose() async {
    await _repository.closeRepo();
    super.dispose();
  }

  void getNewItem(BuildContext context) async {
    ToDoItem? newItem = await Navigator.pushNamed<dynamic>(context, '/addtodo');

    //null will be returned when the user exits using the back button on android
    if (newItem != null) {
      await _repository.add(newItem);
      setState(() {});
    }
  }

  void switchAndUpdate(ToDoItem item) async {
    item.done = !item.done;
    await _repository.put(item.id, item);
    setState(() {});
  }

  void remove(ToDoItem item) async {
    await _repository.remove(item.id);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: Text("To-Do List"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => this.getNewItem(context),
      ),
      body: FutureBuilder<List<ToDoItem>> (

        future: _repository.getAll(),

        builder: (BuildContext context, AsyncSnapshot<List<ToDoItem>> snapshot) {
          if (!snapshot.hasData || snapshot.hasError)
            return ListView();

          var data = snapshot.data!;
          return ListView.builder(
            padding: EdgeInsets.all(8),
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) {
              return Dismissible(
                key: Key(index.toString()),
                background: DecoratedBox(
                  decoration: BoxDecoration(color: Colors.red),
                  child: Align(
                    alignment: Alignment(-0.9, 0),
                    child: Icon(Icons.delete, color: Colors.white,),
                  ),
                ),
                direction: DismissDirection.startToEnd,
                onDismissed: (direction) {
                  ToDoItem item = data[index];
                  data.removeAt(index);
                  remove(item);
                },
                child: ListTile(
                  title: Text(data[index].title),
                  trailing: Icon(data[index].done != 0
                      ? Icons.check_box
                      : Icons.check_box_outline_blank),
                  onTap: () {
                    Navigator.pushNamed<dynamic>(context, "/tododetail", arguments: data[index]);
                  },
                  onLongPress: () {
                    switchAndUpdate(data[index]);
                  },
                ),
              );
            },
          );
        },
      )
    ));
  }
}
