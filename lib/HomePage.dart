import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      appBar: new AppBar(               // App ToolBar
        title: new Text("Json Parsing"),//ToolBar title
        backgroundColor: Colors.orange,
        actions:<Widget>[               //Adding Icon Button on Tool Bar

          new IconButton(
            icon: new Icon(Icons.search),//Icon Search
            onPressed: ()=>debugPrint("Search"),
          ),
          new IconButton(
            icon: new Icon(Icons.add),  //Icon Add
            onPressed: ()=>debugPrint("Add New"),
          )
        ],
      ),

    );
  }
}
