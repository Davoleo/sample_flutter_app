import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResolutionRoute extends StatefulWidget {

  final String title = "Resolutions";

  @override
  State createState() {
      return _ResolutionDemo();
  }
}

class _ResolutionDemo extends State<ResolutionRoute> {

  late int width;
  late int height;
  late double pixelRatio;
  late String aspectRatio;
  late Orientation orientation;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text(widget.title),),

      body:
        (width < 420) ? mobileLayout(context, null) :
        (width < 601) ? middleLayout(context, null) :
        tabletLayout(context, null)
    );
  }

  mobileLayout(context, constraints) {
    return
      Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(8),
            child: DecoratedBox(decoration: BoxDecoration(
                border: Border.all(width: 1),
                borderRadius: BorderRadius.all(Radius.circular(6))
            ),
              child: Padding(padding: EdgeInsets.all(8),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Column(children: <Widget>[Text("Width"), Text("Height")],),
                        Column(children: <Widget>[Text(width.toString()), Text(height.toString())],),
                        Column(children: <Widget>[Text("PR"), Text("AR")],),
                        Column(children: <Widget>[Text(pixelRatio.toString()), Text(aspectRatio)],),
                      ],),
                    Text(orientation.toString()),

                    //Image width and height SHOULD RARELY be defined in the image widget
                    Image.asset("res/images/marvel_logo.png")
                  ],
                ),
              ),
            ),
          ),

//          SizedBox(
//            width: width.toDouble(),
//            height: 171,
//            child: FittedBox(
//              fit: BoxFit.fitWidth,
//              child: Image.asset("res/images/marvel_logo.png"),
//            ),
//          ),

          //Images from a network link
          //Image.network("https://picsum.photos/id/111/1080/1080")
          Row(children: <Widget>[
            Padding(padding: EdgeInsets.all(8),
            child: CircleAvatar(
              radius: 32,
              backgroundImage: NetworkImage("https://avatars3.githubusercontent.com/u/24458276?s=400&u=7e6b87b8867fb9fa0e35f5ef61d0dff8eaeb9068&v=4"),
            ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("DAVOLEO", style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),),
                  Text("Offline since 3 hours ago")
                ],
              ),
            )
          ],)

        ],
      );
  }

  middleLayout(BuildContext context, constraints) {

  }

  tabletLayout(BuildContext context, constraints) {

  }

  @override
  void didChangeDependencies() {

    width = MediaQuery.of(context).size.width.toInt();
    height = MediaQuery.of(context).size.height.toInt();
    pixelRatio = MediaQuery.of(context).devicePixelRatio;
    aspectRatio = MediaQuery.of(context).size.aspectRatio.toStringAsFixed(4);
    orientation = MediaQuery.of(context).orientation;

    super.didChangeDependencies();
  }
}