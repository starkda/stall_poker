import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'game_specifier.dart';
import 'pop_up_create_game.dart';
import 'pop_up_creator_id.dart';

class PlayButton extends StatefulWidget {
  final double height;
  final double width;

  const PlayButton({Key? key, required this.height, required this.width})
      : super(key: key);

  @override
  State<PlayButton> createState() => _PlayButtonState();
}

class _PlayButtonState extends State<PlayButton> {
  bool shouldShow = false;

  void kek() {
    if (kDebugMode) {
      print('play button was tought');
    }
    setState(() {
      shouldShow ^= true;
    });
  }

  Widget getBlueprint(double leftPadding, double height, double width,
      double position, String route, String name) {
    return Positioned(
      left: leftPadding,
      child: SizedBox(
        height: height,
        width: width,
        child: Builder(
          builder: (context) {
            if (shouldShow == false) {
              return Container();
            } else {
              return GameSpecifierButton(
                position: position,
                route: route,
                text: name,
              );
            }
          },
        ),
      ),
    );
  }

  Widget getTouchable(
    double leftPadding,
    double bottomPadding,
    callback,
    height,
    double width,
  ) {
    return Positioned(
      left: leftPadding,
      bottom: bottomPadding,
      child: GestureDetector(
        onTap: () {
          callback();
        },
        child: Builder(
          builder: (context) {
            if (shouldShow == false) {
              return Container();
            } else {
              return Container(
                  height: height, width: width, color: Colors.transparent);
            }
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Container(
          height: widget.height * 4,
        ),
        getBlueprint(widget.width * 0.278, widget.height * 0.9,
            widget.width - widget.width * 0.278, -3, '/', 'Create Game'),
        getTouchable(widget.width * 0.278, widget.height * 2.7, () {
          if (kDebugMode) {
            print('Create game taught');
          }
          createGameDialog(context);
        }, widget.height * 0.9, widget.width - widget.width * 0.278),
        getBlueprint(widget.width * 0.278, widget.height * 0.9,
            widget.width - widget.width * 0.278, -2, '/', 'Game by ID'),
        getTouchable(widget.width * 0.278, widget.height * 1.8, () {
          if (kDebugMode) {
            print('Game by ID taught');
          }
          showIdDialog(context);
        }, widget.height * 0.9, widget.width - widget.width * 0.278),
        getBlueprint(widget.width * 0.278, widget.height * 0.9,
            widget.width - widget.width * 0.278, -1, '/', 'Random Game'),
        getTouchable(widget.width * 0.278, widget.height * 0.9, () {
          if (kDebugMode) {
            print('Random Game taught');
          }
        }, widget.height * 0.9, widget.width - widget.width * 0.278),
        Positioned(
          bottom: 0,
          child: GestureDetector(
            onTap: kek,
            child: ClipPath(
              clipper: PlayBackground(),
              child: Container(
                width: widget.width,
                height: widget.height,
                color: const Color(0xFF76CD7F),
              ),
            ),
          ),
        ),
        Positioned(
          left: widget.width * 0.2,
          bottom: 0,
          child: GestureDetector(
            onTap: kek,
            child: SizedBox(
              width: widget.width * 0.71,
              height: widget.height,
              child: const Center(
                child: Text(
                  'Play',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 33,
                      decoration: TextDecoration.none,
                      fontFamily: 'Serious'),
                ),
              ),
            ),
          ),
        ),
        IgnorePointer(
          child: GestureDetector(
            onTap: kek,
            child: SizedBox(
              width: widget.width,
              height: widget.height,
              child: CustomPaint(
                painter: PlayStroke(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class PlayBackground extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var w = size.width;
    var h = size.height;
    var path = Path();
    path.moveTo(0, h);
    path.lineTo(w, h);
    path.lineTo(w, 0);
    path.lineTo(w - w * 0.717, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class PlayStroke extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var w = size.width;
    var h = size.height;
    Paint paint = Paint()
      ..strokeWidth = 2
      ..color = Colors.black
      ..style = PaintingStyle.stroke;
    var path = Path();
    path.moveTo(0, h);
    path.lineTo(w, h);
    path.lineTo(w, 0);
    path.lineTo(w - w * 0.717, 0);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
