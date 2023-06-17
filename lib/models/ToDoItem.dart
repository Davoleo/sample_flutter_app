import 'dart:convert';

class ToDoItem {
  int id;
  String title;
  String description;
  bool done;

  ToDoItem({this.id = -1, this.title = "", this.description = "", this.done = false});

  // To parse this JSON data, do
  //
  //     final todoItem = todoItemFromJson(jsonString);

  factory ToDoItem.fromJson(Map<String, dynamic> json) => ToDoItem(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    done: json["done"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "done": done,
  };

}

ToDoItem todoItemFromJson(String str) => ToDoItem.fromJson(json.decode(str));

String todoItemToJson(ToDoItem data) => json.encode(data.toJson());
