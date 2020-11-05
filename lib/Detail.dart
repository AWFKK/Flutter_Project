import 'package:flutter/material.dart';


class Detail extends StatefulWidget {
  Detail(data);

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        // App ToolBar
        title: new Text("Detail Activity"), //ToolBar title
        backgroundColor: Colors.orange,
        actions: <Widget>[
          //Adding Icon Button on Tool Bar
        ],
      ),
    );
  }
}
