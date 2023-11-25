import 'dart:math' show Random;
import 'package:flutter/material.dart';

const _curves = [
  Curves.bounceIn,
  Curves.bounceInOut,
  Curves.bounceOut,
  Curves.decelerate,
  Curves.ease,
  Curves.easeIn,
  Curves.easeInBack,
  Curves.easeInCirc,
  Curves.easeInCubic,
  Curves.easeInExpo,
  Curves.easeInOut,
  Curves.easeInOutBack,
  Curves.easeInOutCirc,
  Curves.easeInOutCubicEmphasized,
  Curves.easeInOutExpo,
  Curves.easeInOutQuad,
  Curves.elasticIn,
  Curves.fastEaseInToSlowEaseOut,
  Curves.fastLinearToSlowEaseIn,
  Curves.fastOutSlowIn,
  Curves.linear,
  Curves.linearToEaseOut,
];

class AnimatedScreen extends StatefulWidget {

  static const String name = 'animated_screen';

  const AnimatedScreen({super.key});

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {

  double width = 50;
  double height = 50;
  double borderRadius = 10.0;
  Color color = Colors.indigo;
  Curve curve = Curves.easeOutCubic;

  void changeShape() {

    final random = Random();
    height = random.nextInt(300) + 50;
    width = random.nextInt(300) + 50;
    borderRadius = random.nextInt(100) + 10.0;

    curve = _curves[random.nextInt(_curves.length)];

    color = Color.fromRGBO(
      random.nextInt(255),
      random.nextInt(255),
      random.nextInt(255),
      1
    );

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Screen'),
      ),

      body: Center(
        child: AnimatedContainer(
          width: width,
          height: height,
          curve: curve,
          duration: const Duration(milliseconds: 400),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(borderRadius)
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: changeShape,
        child: const Icon( Icons.play_arrow ),
      ),
    );
  }
}
