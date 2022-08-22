import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../player.dart';
import '../player_widget.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class StreamHandle {
  static final res = StreamController<List<Player>>();

  static Stream<List<Player>> getStream() {
    res.sink.add(Player.generateListOfPlayers(5, 5));
    sleep(Duration(milliseconds: 200));
    return res.stream;
  }

  void dispose() {
    res.close();
  }
}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return StreamBuilder(
        stream: StreamHandle.getStream(),
        builder: (BuildContext context, AsyncSnapshot<List<Player>> snapshot) {
          print(snapshot.hasData);
          return SafeArea(
              child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background.png'),
                fit: BoxFit.fitHeight,
              ),
            ),
            child: Stack(
              alignment: AlignmentDirectional.topCenter,
              children: [
                Positioned(
                  top: 40,
                  child: Container(
                    height: screenHeight * 0.65,
                    width: screenWidth * 0.75,
                    child: Image.asset(
                      'assets/table.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Positioned(
                  top: 5,
                  child: Container(
                    child: Image.asset('assets/krupie.png'),
                  ),
                ),
                Positioned(
                  top: 40 + screenHeight * 0.12,
                  child: Column(
                    children: [
                      SvgPicture.asset('assets/poker.svg'),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 70,
                            width: 43,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color(0xffDBD38B), width: 2),
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Container(
                            height: 70,
                            width: 43,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color(0xffDBD38B), width: 2),
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Container(
                            height: 70,
                            width: 43,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color(0xffDBD38B), width: 2),
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Container(
                            height: 70,
                            width: 43,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color(0xffDBD38B), width: 2),
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Container(
                            height: 70,
                            width: 43,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color(0xffDBD38B), width: 2),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Positioned(
                  right: screenWidth * 0.05,
                  top: 0,
                  child: Builder(builder: (BuildContext context) {
                    if (snapshot.hasData) {
                      return PlayerWidget(player: snapshot.data![0], position: 1);
                    } else
                      return Container();
                  }),
                ),
                Positioned(
                  right: 0,
                  top:screenHeight * 0.4,
                  child: Builder(builder: (BuildContext context) {
                    if (snapshot.hasData) {
                      return PlayerWidget(player: snapshot.data![0], position: 2);
                    } else
                      return Container();
                  }),
                ),
                Positioned(
                  right: screenWidth * 0.75 - 80,
                  top: screenHeight * 0.43,
                  child: Builder(builder: (BuildContext context) {
                    if (snapshot.hasData) {
                      return PlayerWidget(player: snapshot.data![0], position: 3);
                    } else
                      return Container();
                  }),
                ),
                Positioned(
                  right: screenWidth * 0.75 - 80,
                  top: 0,
                  child: Builder(builder: (BuildContext context) {
                    if (snapshot.hasData) {
                      return PlayerWidget(player: snapshot.data![0], position: 4);
                    } else
                      return Container();
                  }),
                ),
                Positioned(top: screenHeight * 0.55, right: 200, child: MainPlayerWidget(player: snapshot.data![0],),),
              ],
            ),
          ));
        });
  }
}
