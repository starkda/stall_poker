import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SettingsButton extends StatelessWidget {
  final double height;
  final double width;

  const SettingsButton({Key? key, required this.height, required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (kDebugMode) {
          print('Settings button was tought');
        }
      },
      child: Stack(
        children: [
          ClipPath(
            clipper: SettingsBackground(),
            child: Container(
              width: width,
              height: height,
              color: const Color(0xFF76CD7F),
            ),
          ),
          SizedBox(
              width: width,
              height: height,
              child: const Center(
                child: Text(
                  'Settings',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 33,
                      decoration: TextDecoration.none,
                      fontFamily: 'Serious'),
                ),
              )),
          IgnorePointer(
            child: SizedBox(
              width: width,
              height: height,
              child: CustomPaint(
                painter: SettingsStroke(),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class SettingsBackground extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var w = size.width;
    var h = size.height;
    var path = Path();
    path.moveTo(0, h);
    path.lineTo(w * 0.743, h);
    path.lineTo(w, 0);
    path.lineTo(w - w * 0.743, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class SettingsStroke extends CustomPainter {
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
    path.lineTo(w * 0.743, h);
    path.lineTo(w, 0);
    path.lineTo(w - w * 0.743, 0);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
