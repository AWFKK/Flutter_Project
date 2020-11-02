import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'Model/Data.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

    //Its A faction type
    // User to retrieve
    // data from server
    // OR
    // Api
    Future<List<Data>> getAllData() async{

    }



  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      appBar: new AppBar(               // App ToolBar
        title: new Text("JSON Parsing"),//ToolBar title
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

      //Adding Drawer
      drawer: new Drawer(
        child: new ListView(
          children:<Widget>[
            //Name And Email Heading
            new UserAccountsDrawerHeader(                       //Main Heading
              accountName: new Text("Abdul Wahab Faiz"),
              accountEmail: new Text("abdulwahabfaiz@gmail.com"),
              decoration: new BoxDecoration(
                color: Colors.deepOrange
              ),
            ),

            new ListTile(                                     //Option One
              title: new Text("First Page"),
              leading: new Icon(Icons.search,color: Colors.orange,),
              onTap: (){
                Navigator.of(context).pop();
              },
            ),

            new ListTile(                                     //Option Two
              title: new Text("Second Page"),
              leading: new Icon(Icons.add,color: Colors.red,),
              onTap: (){
                Navigator.of(context).pop();
              },
            ),

            new ListTile(                                     //Option Three
              title: new Text("Third Page"),
              leading: new Icon(Icons.title,color: Colors.purple,),
              onTap: (){
                Navigator.of(context).pop();
              },
            ),

            new ListTile(                                     //Option Four
              title: new Text("Fourth Page"),
              leading: new Icon(Icons.list,color: Colors.green,),
              onTap: (){
                Navigator.of(context).pop();
              },
            ),

            //Creating Divider
            new Divider(
              height: 10.0,
            ),
            new ListTile(
              title: new Text("Cloce"),
              leading: new Icon(Icons.close,color: Colors.blueAccent,),
              onTap: (){
                Navigator.of(context).pop();
              },
            )

          ],
        ),
      ),


    );
  }
}
