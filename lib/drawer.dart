import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  new Drawer(
    child:new Container(
      child: new ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          new DrawerHeader(
            child: new Center(
              child: new Text("Airlens",
                style: new TextStyle(
                  color: Colors.white,
                ),textAlign: TextAlign.center,
              ),
            ),
            decoration: new BoxDecoration(
            color: Colors.blueAccent,
            ),
          ),
          new MyTile("Home","/home"),
          new MyTile("Tutorial","/tutorial"),
        ],
      ),
    decoration: new BoxDecoration(
      image: new DecorationImage(
      image: new AssetImage("assets/profie.png"),alignment: Alignment.bottomCenter
      )
    ),
    padding: EdgeInsets.zero,
    ),
    );
  }
}
class MyTile extends StatelessWidget{
  String title;
  String track;
  MyTile(String title,String track){
    this.title=title;
    this.track=track;
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new ListTile(
      title: new Text(title),
      onTap: (){
        Navigator.of(context).pushReplacementNamed(track);
      },
    );
  }
}