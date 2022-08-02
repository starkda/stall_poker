import 'package:flutter/material.dart';
import 'package:stallpoker/play_button.dart';
import 'package:stallpoker/profile_button.dart';
import 'package:stallpoker/settings_button.dart';
import 'help_button.dart';

class BottomMainScreenBar extends StatefulWidget {
  const BottomMainScreenBar({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<BottomMainScreenBar> createState() => _BottomMainScreenBarState();
}

class _BottomMainScreenBarState extends State<BottomMainScreenBar> {

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height * 0.11;

    return Stack(
      children: [
            Stack(
              children: [
                Container(
                  width: screenWidth,
                ),
                HelpButton(height: screenHeight, width: screenWidth * 0.29),
                Positioned(
                  left: screenWidth * 0.204,
                  child: ProfileButton(
                      height: screenHeight, width: screenWidth * 0.346),
                ),
                Positioned(
                  left: screenWidth * 0.456,
                  child: SettingsButton(
                      height: screenHeight, width: screenWidth * 0.336),
                ),
                Positioned(
                  left: screenWidth * 0.707,
                  child: PlayButton(
                      height: screenHeight, width: screenWidth * 0.29),
                ),
              ],
            ),
      ],
    );
  }
}
