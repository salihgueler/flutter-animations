import 'package:flutter/material.dart';
import 'package:flutter_animations/easinganimationwidget.dart';
import 'package:flutter_animations/maskinganimationwidget.dart';
import 'package:flutter_animations/offsetdelayanimation.dart';
import 'package:flutter_animations/parentinganimation.dart';
import 'package:flutter_animations/springfreefallinganimation.dart';
import 'package:flutter_animations/transformationanimationwidget.dart';
import 'package:flutter_animations/valuechangeanimation.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Animation Demo',
      theme: new ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: "Animation Main Page"),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: new Text(title),
        ),
        body: ListView(
          children: <Widget>[
            ListTile(
              title: Text("Easing animation"),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => new EasingAnimationWidget()));
              },
            ),
            ListTile(
              title: Text("Offset & Delay animation"),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => new OffsetDelayAnimationWidget()));
              },
            ),
            ListTile(
              title: Text("Parenting animation"),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => new ParentingAnimationWidget()));
              },
            ),
            ListTile(
              title: Text("Transformation animation"),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => new TransformationAnimationWidget()));
              },
            ),
            ListTile(
              title: Text("Value Change animation"),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => new ValueChangeAnimationWidget()));
              },
            ),
            ListTile(
              title: Text("Masking animation"),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => new MaskingAnimationWidget()));
              },
            ),
            ListTile(
              title: Text("Physics animation"),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => new SpringFreeFallingAnimation()));
              },
            )
          ],
        ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}