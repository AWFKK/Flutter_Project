import 'package:covid_2019/Detail.dart';
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
  Future<List<Data>> getAllData() async {
    //BaseUrl Or Api Url
    var api = "https://jsonplaceholder.typicode.com/photos";
    //Getting Response
    var data = await http.get(api);

    //Converting
    //Response Data Into Json Format
    var JsonData = json.decode(data.body);

    List<Data> listof = [];
    for (var i in JsonData) {
      Data data = new Data(i["id"], i["title"], i["url"], i["thumbnailUrl"]);
      listof.add(data);
      debugPrint(data.toString());
    }

    return listof;
  }

  //random color genarator
  List<MaterialColor>_color=[Colors.orange,Colors.green,Colors.blue,Colors.purple,Colors
      .pink,Colors.amber];

  MaterialColor color;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        // App ToolBar
        title: new Text("JSON Parsing"), //ToolBar title
        backgroundColor: Colors.green,
        actions: <Widget>[
          //Adding Icon Button on Tool Bar

          new IconButton(
            icon: new Icon(Icons.search), //Icon Search
            onPressed: () => debugPrint("Search"),
          ),
          new IconButton(
            icon: new Icon(Icons.add), //Icon Add
            onPressed: () => debugPrint("Add New"),
          )
        ],
      ),

      //Adding Drawer
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            //Name And Email Heading
            new UserAccountsDrawerHeader(
              //Main Heading
              accountName: new Text("Abdul Wahab Faiz"),
              accountEmail: new Text("abdulwahabfaiz@gmail.com"),
              decoration: new BoxDecoration(color: Colors.green),
            ),

            new ListTile(
              //Option One
              title: new Text("First Page"),
              leading: new Icon(
                Icons.search,
                color: Colors.orange,
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),

            new ListTile(
              //Option Two
              title: new Text("Second Page"),
              leading: new Icon(
                Icons.add,
                color: Colors.red,
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),

            new ListTile(
              //Option Three
              title: new Text("Third Page"),
              leading: new Icon(
                Icons.title,
                color: Colors.purple,
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),

            new ListTile(
              //Option Four
              title: new Text("Fourth Page"),
              leading: new Icon(
                Icons.list,
                color: Colors.green,
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),

            //Creating Divider
            new Divider(
              height: 10.0,
            ),
            new ListTile(
              title: new Text("Close"),
              leading: new Icon(
                Icons.close,
                color: Colors.blueAccent,
              ),
              onTap: () {
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
              builder: (BuildContext c, AsyncSnapshot snapshot ){

                if(snapshot.data==null)
                {
                  return Center(
                    child: new Text("Loading Data..."),
                  );
                }else{
                  return ListView.builder(
                      itemCount: snapshot.data.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext c, int index){
                        color=_color[index % _color.length];
                        return Card(
                          elevation: 10.0,
                          child: new Column(
                            //crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[                           //Main Image
                              new Image.network(snapshot.data[index].url,

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
                                        backgroundColor: color,
                                        child: new Text(snapshot.data[index].id.toString()),
                                        foregroundColor: Colors.white,
                                      ),
                                    ),

                                    new SizedBox(
                                      width: 6.0,
                                    ),
                                    new Container(
                                      width: 80.0,
                                      child: new Text(snapshot.data[index].title,
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
          ),

          //Creating Container For Vertical List View
          new SizedBox(height: 7.0,),
          new Container(
            //Setting Size And Margin
            //For Container
            height: MediaQuery.of(context).size.height,
            margin: EdgeInsets.only(left: 5,top: 10.0),
            //Getting Data From Service Or Api
            child: new FutureBuilder(
                future: getAllData(),
                builder: (BuildContext c, AsyncSnapshot snapshot ){

                  if(snapshot.data==null)
                  {
                    return Center(
                      child: new Text("Loading Data..."),
                    );
                  }else{
                    //Else Create A ListView
                    return ListView.builder(
                        itemCount: snapshot.data.length,
                        //scrollDirection: Axis.vertical,
                        itemBuilder: (BuildContext c, int index){
                          //Creating CardView
                          return Card(
                            elevation: 5.0,
                            margin: EdgeInsets.all(10.0),
                            //Creating Container Within
                            //The CardView
                            child: new Container(
                              height: 80.0,
                              //Creating Row Of Widget
                              child: Row(
                                //List Of Widget
                                children:<Widget> [
                                  //Work As wrapContain
                                  new Expanded(
                                    flex: 1,
                                    //Image Container
                                    child: new Container(
                                      child: new Image.network(snapshot.data[index].thumbnailUrl,
                                        height: 80.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),

                                  //Text Container
                                  new SizedBox(width: 5.0,),
                                  new Expanded(
                                    flex: 2,
                                    child: new Container(
                                      ///Making TextView Click Able
                                      child: InkWell(
                                        child: new Text(snapshot.data[index].title,
                                          maxLines: 2,
                                          style: TextStyle(fontSize: 18.0,color: Colors.purple),
                                        ),
                                        onTap: (){
                                          Navigator.of(context).push(new MaterialPageRoute(builder: (c)=>Detail(snapshot.data[index])));
                                        },
                                      ),
                                    ),
                                  ),

                                  new Expanded(
                                    flex: 1,
                                    child: Align(

                                      alignment: Alignment.center,
                                      child: new Container(
                                        child: new CircleAvatar(
                                          backgroundColor: color,
                                          child: Text(snapshot.data[index].id.toString()),
                                          foregroundColor: Colors.white,
                                        ),
                                      ),
                                    ),
                                  )

                                ],
                              ),
                            ),
                          );
                        }
                    ) ;
                  }

                }
            ),
          ),


        ],
      )
    );
  }
}
