import 'package:flutter/material.dart';
import 'Model/Data.dart';


class Detail extends StatefulWidget {
  Data data;

  Detail(this.data);

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
        backgroundColor: Colors.green,
      ),

      body: new ListView(
        children:<Widget> [

          new Container(
            margin: EdgeInsets.all(10.0),
            child: new Column(
              children:<Widget> [
                
                new Image.network(widget.data.thumbnailUrl,
                  height: 250.0,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                  ),


                new Container(
                  child: new Row(
                    children:<Widget> [

                      new Expanded(
                        flex: 1,
                         child: new CircleAvatar(
                            child: new Text(widget.data.id.toString(),),
                         ),
                      ),

                      new SizedBox(width: 7.0,),
                      
                      new Expanded(
                        flex: 2,
                        child: new Text(widget.data.title, style: TextStyle(fontSize: 20.0),),
                      )
                      

                    ],
                  ),
                )
                
                
              ],
              

            ),

          )

        ],
      ),
    );
  }
}
