import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ValueChangeAnimationWidget extends StatefulWidget {
  @override
  ValueChangeAnimationWidgetState createState() =>
      ValueChangeAnimationWidgetState();
}

class ValueChangeAnimationWidgetState
    extends State<ValueChangeAnimationWidget> with TickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    final Animation curve =
    CurvedAnimation(parent: controller, curve: Curves.easeOut);
    animation = IntTween(begin: 0, end: 10).animate(curve)
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
    controller.forward();
    return AnimatedBuilder(
        animation: controller,
        builder: (BuildContext context, Widget child) {
          return Scaffold(
              body: new Center(
                child: Text(animation.value.toString(), style: TextStyle(fontSize: 48.0)),
              ));
        });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}