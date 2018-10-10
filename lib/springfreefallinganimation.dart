import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

class SpringFreeFallingAnimation extends StatefulWidget {
  SpringFreeFallingAnimationState createState() =>
      new SpringFreeFallingAnimationState();
}

class SpringFreeFallingAnimationState extends State<SpringFreeFallingAnimation>
    with SingleTickerProviderStateMixin {

  double _squareEdgeSize = 200.0;
  SpringDescription _spring = new SpringDescription(mass: 1.0, stiffness: 100.0, damping: 10.0);
  SpringSimulation _springSimulation;
  AnimationController _animationController;

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    _springSimulation = new SpringSimulation(_spring, _squareEdgeSize, height, _animationController.velocity);
    startAnimationWithDelay();
    return AnimatedBuilder(
        animation: _animationController,
        builder: (BuildContext context, Widget child) {
          return Scaffold(
              body: Transform(
            transform: Matrix4.translationValues(0.0, _squareEdgeSize - 200.0, 0.0),
            child: new Align(
                alignment: Alignment.topCenter,
                child: Container(
                  width: 200.0,
                  height: 200.0,
                  color: Colors.black12,
                )),
          ));
        });
  }

  @override
  initState() {
    super.initState();
    _animationController = new AnimationController(
      vsync: this,
      lowerBound: double.negativeInfinity,
      upperBound: double.infinity,
    )..addListener(() {
      setState(() {
        _squareEdgeSize = _animationController.value;
      });
    });
  }

  void startAnimationWithDelay() async {
    if (!_animationController.isAnimating) {
      await new Future.delayed(const Duration(milliseconds: 500));
      _animationController.animateWith(_springSimulation);
    }
  }
}


