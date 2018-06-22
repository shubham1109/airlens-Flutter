import 'package:flutter/material.dart';

import 'package:airlens/tutorial.dart';
import 'package:airlens/drawer.dart';

void main(){
  runApp(new MaterialApp(
    title: "Airlens",
    home: new MyHomePage(),
    routes:<String,WidgetBuilder>{
      "/tutorial":(BuildContext context) => new Tutorial(),
      "/home":(BuildContext context) => new MyHomePage()
    },
  ));
}

class MyHomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      //drawer: new MyDrawer(),
      appBar: new AppBar(
        title: new Text("Airlens"),
      ),
      body: new Container(
        child: new ListView(
          children: <Widget>[
            new MyCard(Colors.white),new MyCard(Colors.white),new MyCard(Colors.white),new MyCard(Colors.white)
          ],
        ),
      ),

    );
  }
}

class MyCard extends StatelessWidget {
  Color theme;
  MyCard(Color color){
    this.theme = color;
  }
  @override
  Widget build(BuildContext context){
    return new Container(
      child: new Card(
        child: new Column(
        children: <Widget>[
          new Center(
           child: new Container(
             child: new Column(
               children: <Widget>[
                 new Text("Siri Fort",
                   textAlign: TextAlign.center,
                   style:  new TextStyle(
                     color: Colors.blueGrey,
                     fontSize: 28.0,
                     wordSpacing: 1.5,
                     fontWeight: FontWeight.w100,
                   ),
                 ),
                 new Text("Delhi | 12:45,6th September",
                   textAlign: TextAlign.center,
                   style: new TextStyle(
                     color: Colors.grey,
                   ),
                 ),
               ],
             ),margin: EdgeInsets.only(top: 10.0,bottom: 5.0,),
           ),
          ),
          new Divider(color: Colors.grey,),
          new Row(
            children: <Widget>[
              new Container(
                child: new Icon(Icons.face,color: Colors.greenAccent,size: 80.0,),
                padding: EdgeInsets.only(left:30.0,top: 12.0,bottom: 12.0),
              ),
             new Container(
                decoration: new BoxDecoration(
                  border: new BorderDirectional(start: new BorderSide(color: Colors.grey,width: 1.0))
                ),
                child: new Column(
                  children: <Widget>[
                    new Text("AQI is",
                      textAlign: TextAlign.center,
                      style: new TextStyle(
                        color: Colors.grey,
                        letterSpacing: 1.2,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                    new Text("54",
                      textAlign: TextAlign.center,
                      style: new TextStyle(
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.w100,
                        wordSpacing: 2.0,
                        fontSize: 32.0,
                      ),
                    ),
                  ],
                ),
                 margin: EdgeInsets.only(left: 50.0),
                 padding: EdgeInsets.only(left: 50.0),
              )
            ],
          ),
          new Divider(color: Colors.grey,),
          new Container(
            child: new Row(
              children: <Widget>[
                new Container(
                  child: new Column(
                    children: <Widget>[
                      new Icon(Icons.wb_sunny,color: Colors.orangeAccent,size: 32.0,),
                      new Row(
                        children: <Widget>[
                          new Container(
                            child: new Text("High\n32°C",style: new TextStyle(
                                color: Colors.grey,
                                fontSize:18.0
                            ),),
                            padding: EdgeInsets.only(right: 15.0,top:7.0),
                          ),
                          new Container(
                            child: new Text("Low\n25°C",style: new TextStyle(
                                color: Colors.grey,
                                fontSize:18.0
                            ),),
                            padding: EdgeInsets.only(left: 15.0,top:7.0),
                          ),
                        ],
                      )
                    ],
                  ),margin: EdgeInsets.only(left: 35.0,top: 10.0,bottom:10.0),padding: EdgeInsets.only(right:15.0),
                  decoration: new BoxDecoration(
                    border: new BorderDirectional(end: new BorderSide(color: Colors.grey))
                  ),
                ),
                new Container(
                  child: new Column(
                    children: <Widget>[
                      new Icon(Icons.cloud,color: Colors.grey,size: 32.0,),

                    ],
                  ),padding: EdgeInsets.only(right: 25.0),margin: EdgeInsets.only(left: 25.0),
                ),
              ],
            ),
          )
        ],
      ),
      elevation: 7.0,color: this.theme,),
      margin: EdgeInsets.only(top: 7.0,bottom: 7.0),
    );
  }
}