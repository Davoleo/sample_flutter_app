import 'package:flutter/material.dart';

//Allows you to place widgets onto other widgets in a stack-like layout
class StackPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Stack Layout Test"),),

      body: Column(children: <Widget>[
        Flexible(
          //Defines a fraction of the total space (in this example 2/5)
          flex: 2,
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              FittedBox(
                fit: BoxFit.fitWidth,
                child: Image.network("https://picsum.photos/id/633/400/400"),
              ),

              Padding(
                padding: const EdgeInsets.all(24),
                child: Text(
                  "Discover Nature!",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    shadows: <Shadow> [
                      Shadow(color: Colors.black, blurRadius: 10)
                    ]
                  ),
                ),
              ),

              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 24, bottom: 24),
                  child: RaisedButton(
                    color: Theme.of(context).primaryColor,
                    child: Text(
                      "Reserve",
                      style: TextStyle(color: Theme.of(context).bottomAppBarColor),
                    ),
                    onPressed: () => {},
                  ),
                ),
              )
            ],
          ),
        ),

        Flexible(
          flex: 3,
          child: Container(),
        )
      ],),
    );
  }
}
