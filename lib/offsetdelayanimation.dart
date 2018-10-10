import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OffsetDelayAnimationWidget extends StatefulWidget {
  @override
  OffsetDelayAnimationWidgetState createState() =>
      OffsetDelayAnimationWidgetState();
}

class OffsetDelayAnimationWidgetState extends State<OffsetDelayAnimationWidget>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;
  Animation _lateAnimation;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));

    _animation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.fastOutSlowIn,
    ))
      ..addStatusListener(handler);

    _lateAnimation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.2,
          1.0,
          curve: Curves.fastOutSlowIn,
        )));
  }

  void handler(status) {
    if (status == AnimationStatus.completed) {
      _animation.removeStatusListener(handler);
      _controller.reset();
      _animation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: _controller,
        curve: Curves.fastOutSlowIn,
      ));
      _lateAnimation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
          parent: _controller,
          curve: Interval(
            0.2,
            1.0,
            curve: Curves.fastOutSlowIn,
          )))
        ..addStatusListener((status) {
          if (status == AnimationStatus.completed) {
            Navigator.pop(context);
          }
        });
      _controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    _controller.forward();
    return AnimatedBuilder(
        animation: _controller,
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
                          _animation.value * width,
                          0.0,
                          0.0,
                        ),
                        child: new Center(
                            child: new Container(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: Container(
                            width: 200.0,
                            height: 30.0,
                            color: Colors.black12,
                          ),
                        ))),
                    Transform(
                        transform: Matrix4.translationValues(
                          _animation.value * width,
                          0.0,
                          0.0,
                        ),
                        child: new Center(
                            child: new Container(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: Container(
                            width: 200.0,
                            height: 30.0,
                            color: Colors.black12,
                          ),
                        ))),
                    Transform(
                        transform: Matrix4.translationValues(
                          _lateAnimation.value * width,
                          0.0,
                          0.0,
                        ),
                        child: new Center(
                            child: new Container(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: Container(
                            width: 200.0,
                            height: 30.0,
                            color: Colors.black12,
                          ),
                        ))),
                  ])))));
        });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
