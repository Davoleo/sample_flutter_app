import 'package:flutter/material.dart';

class TablePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Table Page Test"),
      ),
      body: Table(
        columnWidths: {
          //IntrinsicColumnWidth
          //FractionColumnWidth
          //FlexColumnWidth
          //MaxColumnWidth
          //MinColumnWidth

          //key => column index
          //value => column width setting
          0: FixedColumnWidth(100),
          //Chosen after everything else
          1: FlexColumnWidth(),
          2: MaxColumnWidth(FixedColumnWidth(100), FractionColumnWidth(0.2))
        },
        //Table Borders control
        border: TableBorder(
          //Inner Borders
          horizontalInside: BorderSide(color: Colors.cyan, width: 3),
          verticalInside: BorderSide(color: Colors.black, width: 3),
          //Outer Borders
          bottom: BorderSide(color: Colors.indigo, width: 3),
          right: BorderSide(color: Colors.indigo, width: 3),
          top: BorderSide(color: Colors.indigo, width: 3),
          left: BorderSide(color: Colors.indigo, width: 3),
        ),
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: <TableRow>[
          TableRow(
            //Cell Background
            decoration: BoxDecoration(color: Colors.grey),
              children: <Widget>[
            Container(
              height: 80,
              color: Colors.green,
              padding: EdgeInsets.all(16),
              child: Text("Cell 1"),
            ),
            Container(
              height: 60,
              color: Colors.yellow,
              padding: EdgeInsets.all(16),
              child: Text("Cell 2"),
            ),
            Container(
              height: 100,
              color: Colors.orange,
              padding: EdgeInsets.all(16),
              child: Text("Cell 3"),
            ),
          ]

          ),
          TableRow(children: <Widget>[
            Container(
              height: 100,
              color: Colors.red,
              padding: EdgeInsets.all(16),
              child: Text("Cell 4"),
            ),
            //Table Cell to control the behaviour of a single cell
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.bottom,
              child: Container(
                height: 60,
                color: Colors.blue,
                padding: EdgeInsets.all(16),
                child: Text("Cell 5"),
              ),
            ),
            Container(
              height: 80,
              color: Colors.pink,
              padding: EdgeInsets.all(16),
              child: Text("Cell 6"),
            ),
          ]),
        ],
      ),
    );
  }
}
