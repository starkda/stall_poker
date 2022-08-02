import 'package:flutter/material.dart';

class GameSpecifierButton extends StatefulWidget {
  final double position;
  final String route;
  final String text;

  const GameSpecifierButton(
      {Key? key,
      required this.position,
      required this.route,
      required this.text})
      : super(key: key);

  @override
  State<GameSpecifierButton> createState() => _GameSpecifierButtonState();
}

class _GameSpecifierButtonState extends State<GameSpecifierButton>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _offsetAnimation;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _offsetAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: Offset(0.0, widget.position),
    ).animate(_controller);
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _offsetAnimation,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF76CD7F),
          border: Border.all(color: Colors.black),
        ),
        child: Center(
          child: Text(
            widget.text,
            style: const TextStyle(
                color: Colors.black,
                decoration: TextDecoration.none,
                fontFamily: 'Serious',
                fontSize: 20),
          ),
        ),
      ),
    );
  }
}

class MyStatefulWidget2 extends StatefulWidget {
  const MyStatefulWidget2({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget2> createState() => _MyStatefulWidgetState2();
}

class _MyStatefulWidgetState2 extends State<MyStatefulWidget2>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _offsetAnimation;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _offsetAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0.0, -2),
    ).animate(_controller);
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return SlideTransition(
      position: _offsetAnimation,
      child: Container(
        margin: EdgeInsets.fromLTRB(screenWidth * 0.084, 0, 0, 0),
        decoration: BoxDecoration(
            color: const Color(0xFF76CD7F),
            border: Border.all(color: Colors.black)),
      ),
    );
  }
}
