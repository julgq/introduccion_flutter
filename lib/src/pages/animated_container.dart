import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedContainerPage extends StatefulWidget {
  @override
  _AnimatedContainerPage_State createState() => _AnimatedContainerPage_State();
}

class _AnimatedContainerPage_State extends State<AnimatedContainerPage> {
  double _width = 50.0;
  double _height = 50.0;
  Color _color = Colors.pink;

  BorderRadiusGeometry _boderRadius = BorderRadius.circular(8.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Container'),
      ),
      body: Center(
          child: AnimatedContainer(
            curve: Curves.fastOutSlowIn, // https://api.flutter.dev/flutter/animation/Curves-class.html
            duration: Duration(seconds: 1),
        width: _width,
        height: _height,
        decoration: BoxDecoration(borderRadius: _boderRadius, color: _color),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: _cambiarForma,
      ),
    );
  }

  void _cambiarForma() {
    final random = Random();
    setState(() {
      _boderRadius = BorderRadius.circular(random.nextInt(255).toDouble());
      _width = random.nextInt(300).toDouble();
      _height = random.nextInt(300).toDouble();
      _color = Color.fromRGBO(
          random.nextInt(255), random.nextInt(255), random.nextInt(255), 1);
    });
  }
}
