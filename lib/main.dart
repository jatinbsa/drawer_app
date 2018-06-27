import 'package:drawer_app/PageOne.dart';
import 'package:drawer_app/PageTwo.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(

        primarySwatch: Colors.amber,
        primaryColor: defaultTargetPlatform==TargetPlatform.iOS? Colors.grey[50]:null
      ),
      home: new HomePage(),
      routes: <String,WidgetBuilder>{
        "/a":(BuildContext context) =>new PageOne("Page One"),
        "/b":(BuildContext context) =>new PageTwo("Page Two"),
      },
    );
  }
}

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Drawer App"),
        elevation: defaultTargetPlatform==TargetPlatform.android?5.0:0.0,
      ),
      drawer: new Drawer(

        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
                accountName: new Text("JAtin bansal"),
                accountEmail: new Text("jatinbansal1612@gmail.com"),
                currentAccountPicture: new CircleAvatar(
                  backgroundColor: Colors.brown,
                  child: new Text("P"),
                ),
              otherAccountsPictures: <Widget>[
                new CircleAvatar(
                  backgroundColor: Colors.brown,
                  child: new Text("k"),
                )
              ],
            ),
            new ListTile(
              title: new Text("Page One"),
              trailing: new Icon(Icons.arrow_upward),
              onTap:(){
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed("/a");

                }
            ),
            new ListTile(
              title: new Text("Page Two"),
              trailing: new Icon(Icons.arrow_downward),
                onTap:(){
                  Navigator.of(context).pop();
                  Navigator.of(context).pushNamed("/b");

                }
            ),new  Divider(),
            new ListTile(
              title: new Text("Close"),
              trailing: new Icon(Icons.close),
              onTap: ()=>Navigator.of(context).pop(),
            )
          ],
        ),
      ),
      body: new Container(
        child: new Center(
          child: new Text("Home Page"),
        ),
      ),
    );
  }

  /*  _tapPageOne(BuildContext context){
    Navigator.of(context).pushNamed("/a");
    Navigator.of(context).pop();
  }*/
}
