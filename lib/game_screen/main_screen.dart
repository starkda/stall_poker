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
    var screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    var screenHeight = MediaQuery
        .of(context)
        .size
        .height;
    var tableWidth = screenWidth * 0.75;
    var tableHeight = tableWidth * 0.52;
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
                  //  alignment: AlignmentDirectional.topCenter,
                  children: [
                    Positioned(
                      bottom:
                      (screenHeight - tableHeight - screenHeight * 0.14) / 2 +
                          screenHeight * 0.14,
                      right: (screenWidth - tableWidth) / 2,
                      child: Container(
                        height: tableHeight,
                        width: tableWidth,
                        child: Image.asset(
                          'assets/table.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Positioned(
                      right: (screenWidth - tableWidth) / 2 + tableWidth / 2 -
                          35,
                      bottom: (screenHeight - tableHeight -
                          screenHeight * 0.14) / 2 +
                          screenHeight * 0.14 + tableHeight - 50,
                      child: Container(
                        width: 70,
                        height: 70,
                        child: Image.asset('assets/krupie.png'),
                      ),
                    ),
                    Positioned(
                      bottom: (screenHeight - tableHeight -
                          screenHeight * 0.14) / 2 +
                          screenHeight * 0.14 + tableHeight -
                          (tableHeight * 0.225 + 5 + tableWidth * 0.07 * 1.54) - tableHeight * 0.28,
                      right: screenWidth / 2 - tableWidth * 0.255,
                      child: Column(
                        children: [
                          Container(width: tableWidth * 0.43,
                            height: tableHeight * 0.225,
                            child: SvgPicture.asset(
                              'assets/poker.svg', fit: BoxFit.fill,),),
                          SizedBox(
                              height: 15
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                height: tableWidth * 0.07 * 1.54,
                                width: tableWidth * 0.07,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Color(0xffDBD38B), width: 2),
                                ),
                              ),
                              SizedBox(
                                width: tableWidth * 0.04,
                              ),
                              Container(
                                height: tableWidth * 0.07 * 1.54,
                                width: tableWidth * 0.07,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Color(0xffDBD38B), width: 2),
                                ),
                              ),
                              SizedBox(
                                width: tableWidth * 0.04,
                              ),
                              Container(
                                height: tableWidth * 0.07 * 1.54,
                                width: tableWidth * 0.07,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Color(0xffDBD38B), width: 2),
                                ),
                              ),
                              SizedBox(
                                width: tableWidth * 0.04,
                              ),
                              Container(
                                height: tableWidth * 0.07 * 1.54,
                                width: tableWidth * 0.07,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Color(0xffDBD38B), width: 2),
                                ),
                              ),
                              SizedBox(
                                width: tableWidth * 0.04,
                              ),
                              Container(
                                height: tableWidth * 0.07 * 1.54,
                                width: tableWidth * 0.07,
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
                      right: (screenWidth - tableWidth) / 2 - 75,
                      bottom: (screenHeight - tableHeight -
                          screenHeight * 0.14) / 2 +
                          screenHeight * 0.14 + tableHeight - 90,
                      child: Builder(builder: (BuildContext context) {
                        if (snapshot.hasData) {
                          return PlayerWidget(
                              player: snapshot.data![0], position: 1);
                        } else
                          return Container();
                      }),
                    ),
                    Positioned(
                      right: (screenWidth - tableWidth) / 2 - 75,
                      top: screenHeight * 0.4,
                      child: Builder(builder: (BuildContext context) {
                        if (snapshot.hasData) {
                          return PlayerWidget(
                              player: snapshot.data![0], position: 2);
                        } else
                          return Container();
                      }),
                    ),
                    Positioned(
                      left: (screenWidth - tableWidth) / 2 - 75,
                      top: screenHeight * 0.4,
                      child: Builder(builder: (BuildContext context) {
                        if (snapshot.hasData) {
                          return PlayerWidget(
                              player: snapshot.data![0], position: 3);
                        } else
                          return Container();
                      }),
                    ),
                    Positioned(
                      left: (screenWidth - tableWidth) / 2 - 75,
                      bottom: (screenHeight - tableHeight -
                          screenHeight * 0.14) / 2 +
                          screenHeight * 0.14 + tableHeight - 90,
                      child: Builder(builder: (BuildContext context) {
                        if (snapshot.hasData) {
                          return PlayerWidget(
                              player: snapshot.data![0], position: 4);
                        } else
                          return Container();
                      }),
                    ),
                    Positioned(
                      bottom: (screenHeight - tableHeight -
                          screenHeight * 0.14) / 2 +
                          screenHeight * 0.14 - 75,
                      right: screenWidth / 2 - 110,
                      child: MainPlayerWidget(
                        player: snapshot.data![0],
                      ),
                    ),
                  ],
                ),
              ));
        });
  }
}
