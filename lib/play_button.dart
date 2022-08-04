import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'game_specifier.dart';
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

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Container(
          height: widget.height * 4,
        ),
        Positioned(
          left: widget.width * 0.278,
          child: SizedBox(
            height: widget.height * 0.9,
            width: widget.width - widget.width * 0.278,
            child: Builder(
              builder: (context) {
                if (shouldShow == false) {
                  return Container();
                } else {
                  return const GameSpecifierButton(
                    position: -3,
                    route: '/',
                    text: 'Create Game',
                  );
                }
              },
            ),
          ),
        ),
        Positioned(
          left: widget.width * 0.278,
          bottom: widget.height * 2.7,
          child: GestureDetector(
            onTap: () {
              if (kDebugMode) {
                print('Create game taught');
              }
            },
            child: Builder(
              builder: (context) {
                if (shouldShow == false) {
                  return Container();
                } else {
                  return Container(
                      height: widget.height * 0.9,
                      width: widget.width - widget.width * 0.278,
                      color: Colors.transparent);
                }
              },
            ),
          ),
        ),
        Positioned(
          left: widget.width * 0.278,
          child: SizedBox(
            height: widget.height * 0.9,
            width: widget.width - widget.width * 0.278,
            child: Builder(
              builder: (context) {
                if (shouldShow == false) {
                  return Container();
                } else {
                  return const GameSpecifierButton(
                    position: -2,
                    route: '/',
                    text: 'Game by ID',
                  );
                }
              },
            ),
          ),
        ),
        Positioned(
          left: widget.width * 0.278,
          bottom: widget.height * 1.8,
          child: GestureDetector(
            onTap: () {
              showIdDialog(context);
            },
            child: Builder(
              builder: (context) {
                if (shouldShow == false) {
                  return Container();
                } else {
                  return Container(
                      height: widget.height * 0.9,
                      width: widget.width - widget.width * 0.278,
                      color: Colors.transparent);
                }
              },
            ),
          ),
        ),
        Positioned(
          left: widget.width * 0.278,
          child: SizedBox(
            height: widget.height * 0.9,
            width: widget.width - widget.width * 0.278,
            child: Builder(
              builder: (context) {
                if (shouldShow == false) {
                  return Container();
                } else {
                  return const GameSpecifierButton(
                    position: -1,
                    route: '/',
                    text: 'Random Game',
                  );
                }
              },
            ),
          ),
        ),
        Positioned(
          left: widget.width * 0.278,
          bottom: widget.height * 0.9,
          child: GestureDetector(
            onTap: () {
              if (kDebugMode) {
                print('Random Game taught');
              }
            },
            child: Builder(
              builder: (context) {
                if (shouldShow == false) {
                  return Container();
                } else {
                  return Container(
                      height: widget.height * 0.9,
                      width: widget.width - widget.width * 0.278,
                      color: Colors.transparent);
                }
              },
            ),
          ),
        ),
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
