import 'package:flutter/cupertino.dart';
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

        //BaseUrl Or Api Url
        var api  = "https://jsonplaceholder.typicode.com/photos";
        //Getting Response
        var data =  await http.get(api);

        //Converting
        //Response Data Into Json Format
        var JsonData = json.decode(data.body);

        List<Data>listof = [];
        for(var i in JsonData){

          Data data = new Data(i["id"],i["title"],i["url"],i["thumbnailUrl"]);
          listof.add(data) ;
          debugPrint(data.toString());
        }


        return listof;
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
              title: new Text("Close"),
              leading: new Icon(Icons.close,color: Colors.blueAccent,),
              onTap: (){
                Navigator.of(context).pop();
              },
            )

          ],
        ),
      ),

      //Creating Body
      //Other Word
      //Creating Main Layout
      body: new ListView(
        children:<Widget> [

          new Container(
            margin: EdgeInsets.all(10.0),
            height: 250.0,
            child: new FutureBuilder(
              future: getAllData(),
              builder: (BuildContext c, AsyncSnapshot snapshort ){

                if(snapshort.data==null)
                {
                  return Center(
                    child: new Text("Loading Data..."),
                  );
                }else{
                  return ListView.builder(
                      itemCount: snapshort.data.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext c, int index){
                        return Card(
                          elevation: 10.0,
                          child: new Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              new Image.network(snapshort.data[index].url,

                                height: 150.0,
                                width: 150.0,
                                fit: BoxFit.cover,

                              ),

                              new SizedBox(height: 7.0,),

                              new Container(
                                margin: EdgeInsets.all(6.0),
                                height: 50.0,
                                child: new Row(

                                  children: <Widget>[

                                    new Container(
                                      child: new CircleAvatar(
                                        child: new Text(snapshort.data[index].id.toString()),
                                      ),
                                    ),

                                    new SizedBox(
                                      width: 6.0,
                                    ),
                                    new Container(
                                      width: 80.0,
                                      child: new Text(snapshort.data[index].title,
                                      maxLines: 1,
                                        style: TextStyle(
                                          color: Colors.deepOrange
                                        ),
                                      ),
                                    )


                                  ],
                                ),

                              )
                            ],
                          ),
                        );
                      }
                  ) ;
                }

              }
            ),
          )


        ],
      )


    );
  }

}
