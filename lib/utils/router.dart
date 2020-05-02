import 'package:flutter/material.dart';
import 'package:sample_flutter_app/screens/error_screen.dart';
import 'package:sample_flutter_app/screens/home_page.dart';
import 'package:sample_flutter_app/screens/todo_item_add.dart';
import 'package:sample_flutter_app/screens/todo_item_details.dart';
import 'package:sample_flutter_app/screens/todo_list.dart';

abstract class Router {

  static Route<dynamic> generateRoute(BuildContext context, RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => TestHomePage(title: "HomePage",)
        );
        break;
      case "/todos":
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => ToDoList()
        );
      case "/tododetail":
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => ToDoDetails()
        );
        break;
      case "/addtodo":
        return MaterialPageRoute(
            settings: settings,
            builder: (context) => AddToDoItem()
        );
        break;
      default:
        return MaterialPageRoute(
            settings: settings,
            builder: (context) => ErrorScreen()
        );
    }
  }

}