import 'package:flutter/material.dart';
import 'package:sample_flutter_app/screens/home_page.dart';

abstract class Router {

  static Route<dynamic> generateRoute(BuildContext context, RouteSettings settings) {
    switch (settings.name) {
      case "/home_test":
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => TestHomePage()
        );
        break;
      default:
        return MaterialPageRoute(
            settings: settings,
            builder: (context) => TestHomePage()
        );
    }
  }

}