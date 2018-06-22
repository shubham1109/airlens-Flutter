import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

void main(){
  runApp(new MaterialApp(
    title: "Airlens Tutorial",
    home: new Tutorial(),
  ));
}
class Tutorial extends StatefulWidget {
  @override
  _TutorialState createState() => new _TutorialState();
}
String heading="page1";
Color globalColor=appBarColor.elementAt(0);
List<String> headings = <String>["page1","page2","page3","page4","page5","page6"];
List<Color> appBarColor = <Color>[Colors.red,Colors.orangeAccent,Colors.blue,Colors.greenAccent,Colors.amber,Colors.brown];
class _TutorialState extends State<Tutorial> with SingleTickerProviderStateMixin {
  TabController _tabController;

  setVisited() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("isNewUser",false);
  }
  tabChangeListener() {
    setState(() {
      print(_tabController.index);
      heading =  headings.elementAt(_tabController.index);
      globalColor = appBarColor.elementAt(_tabController.index);
    });
  }
  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: choices.length);
    _tabController.addListener(tabChangeListener);

    setVisited();
  }


  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          backgroundColor: globalColor,
          title: new Text(heading,textAlign: TextAlign.center),
          centerTitle: true,

          bottom: new PreferredSize(
            preferredSize: const Size.fromHeight(86.0),
            child: new Theme(
              data: Theme.of(context).copyWith(accentColor: Colors.white),
              child: new Container(
                height: 48.0,
                alignment: Alignment.center,
                child: new TabPageSelector(controller: _tabController),

              ),
            ),
          ),
        ),
        body: new TabBarView(
          controller: _tabController,
          children: choices.map((Choice choice) {
            return new Padding(
              padding: const EdgeInsets.all(12.0),
              child: new ChoiceCard(choice: choice),
            );
          }).toList(),
        ),
      ),
    );
  }
}
class Choice {
  const Choice({this.title, this.icon, this.heading });
  final String title;
  final IconData icon;
  final String heading;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'CAR', icon: Icons.directions_car,heading: "Page1"),
  const Choice(title: 'BICYCLE', icon: Icons.directions_bike,heading: "Page2"),
  const Choice(title: 'BOAT', icon: Icons.directions_boat,heading: "Page3"),
  const Choice(title: 'BUS', icon: Icons.directions_bus,heading: "Page4"),
  const Choice(title: 'TRAIN', icon: Icons.directions_railway,heading: "Page5"),
  const Choice(title: 'WALK', icon: Icons.directions_walk,heading: "Page6"),
];

class ChoiceCard extends StatelessWidget{
  const ChoiceCard({ Key key, this.choice }) : super(key: key);

  final Choice choice;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return new Card(
      color: Colors.white,
      child: new Center(
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Icon(choice.icon, size: 128.0, color: textStyle.color),
            new Text(choice.title, style: textStyle),
          ],
        ),
      ),
    );
  }
}

