import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ParentingAnimationWidget extends StatefulWidget {
  @override
  ParentingAnimationWidgetState createState() =>
      ParentingAnimationWidgetState();
}

class ParentingAnimationWidgetState extends State<ParentingAnimationWidget>
    with TickerProviderStateMixin {
  Animation growingAnimation;
  Animation animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    growingAnimation = Tween(begin: 10.0, end: 100.0)
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeIn));
    animation = Tween(begin: -0.25, end: 0.0).animate(CurvedAnimation(
      parent: controller,
      curve: Curves.easeIn,
    ))
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reverse();
        }
        if (status == AnimationStatus.dismissed) {
          Navigator.pop(context);
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    controller.forward();
    return AnimatedBuilder(
        animation: controller,
        builder: (BuildContext context, Widget child) {
          return new Scaffold(
              body: new Align(
                  alignment: Alignment.center,
                  child: new Container(
                      child: new Center(
                          child:
                              new ListView(shrinkWrap: true, children: <Widget>[
                    Transform(
                        transform: Matrix4.translationValues(
                            animation.value * width, 0.0, 0.0),
                        child: new Center(
                            child: Container(
                          height: growingAnimation.value,
                          width: growingAnimation.value * 2,
                          color: Colors.black12,
                        ))),
                    Transform(
                        transform: Matrix4.translationValues(
                          animation.value * width,
                          0.0,
                          0.0,
                        ),
                        child: new Center(
                            child: new Container(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: Container(
                            width: 200.0,
                            height: 100.0,
                            color: Colors.black12,
                          ),
                        ))),
                  ])))));
        });
  }
}
