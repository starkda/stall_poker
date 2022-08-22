import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stallpoker/player.dart';

class PlayerWidget extends StatelessWidget {
  late final Player player;
  late final int? position;

  PlayerWidget({Key? key, required this.player, this.position})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double cardW = 220;
    double cardH = 150;
    return Container(
        //color: Colors.red,
        width: cardW,
        height: cardH,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: PlayerCard(
                player: player,
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Avatar(),
                  SizedBox(
                    width: 113,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(cardW - 180, 70, 0, 0),
              child: Container(
                height: 43,
                width: 30,
                child: Image.asset('assets/true back of card.png'),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(cardW - 190, 80, 0, 0),
              child: Container(
                height: 43,
                width: 30,
                child: Image.asset('assets/true back of card.png'),
              ),
            ),
            Builder(builder: (BuildContext context) {
              switch (position) {
                case (1):
                  return Align(
                    alignment: Alignment.bottomLeft,
                    child: Row(
                      children: [
                        Column(mainAxisSize: MainAxisSize.min, children: [
                          SvgPicture.asset('assets/chips.svg'),
                          SizedBox(
                            height: 7,
                          )
                        ]),
                        SizedBox(
                          width: 3,
                        ),
                        Transform.rotate(
                          angle: 1 / (3 * sqrt2),
                          child: Text(
                            '10000',
                            style: TextStyle(
                                color: Color(0xff2D2E23),
                                fontSize: 20,
                                fontFamily: 'Funny',
                                decoration: TextDecoration.none),
                          ),
                        ),
                      ],
                    ),
                  );
                case (2):
                  return Align(
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              height: 30,
                            ),
                            SvgPicture.asset('assets/chips.svg')
                          ],
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Transform.rotate(
                              angle: -1 / (2 * sqrt2),
                              child: Text(
                                '10000',
                                style: TextStyle(
                                    color: Color(0xff2D2E23),
                                    fontSize: 20,
                                    fontFamily: 'Funny',
                                    decoration: TextDecoration.none),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            )
                          ],
                        )
                      ],
                    ),
                  );
                case (3):
                  return Align(
                    alignment: Alignment.topCenter,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: 50,
                        ),
                        SvgPicture.asset('assets/chips.svg'),
                        SizedBox(
                          width: 5,
                        ),
                        Column(mainAxisSize: MainAxisSize.min, children: [
                          SizedBox(
                            height: 15,
                          ),
                          Transform.rotate(
                            angle: 1 / (1.5 * sqrt2),
                            child: Text(
                              '10000',
                              style: TextStyle(
                                  color: Color(0xff2D2E23),
                                  fontSize: 20,
                                  fontFamily: 'Funny',
                                  decoration: TextDecoration.none),
                            ),
                          ),
                        ]),
                      ],
                    ),
                  );
                case (4):
                  return Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: 50,
                        ),
                        SvgPicture.asset('assets/chips.svg'),
                        SizedBox(
                          width: 5,
                        ),
                        Column(mainAxisSize: MainAxisSize.min, children: [
                          Transform.rotate(
                            angle: -1 / (3 * sqrt2),
                            child: Text(
                              '10000',
                              style: TextStyle(
                                  color: Color(0xff2D2E23),
                                  fontSize: 20,
                                  fontFamily: 'Funny',
                                  decoration: TextDecoration.none),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          )
                        ]),
                      ],
                    ),
                  );
                default:
                  return Container();
              }
            }),
          ],
        ));
  }
}

class MainPlayerWidget extends StatelessWidget {
  late final Player player;

  MainPlayerWidget({Key? key, required this.player}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double cardW = 250;
    double cardH = 150;
    return Container(
      //  color: Colors.red,
        width: cardW,
        height: cardH,
        child: Stack(
          children: [
            Row(children: [
              SizedBox(
                width: 34,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: PlayerCard(
                  player: player,
                ),
              ),
            ]),
            Align(
              alignment: Alignment.centerLeft,
              child: Avatar(),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(height: 75, width: 50, color: Colors.grey, child: Image.asset('assets/true_back_of_card.jpg', fit: BoxFit.fill,),),
                  Container(height: 75, width: 50, color: Colors.grey, child: Image.asset('assets/true_back_of_card.jpg', fit: BoxFit.fill,),),
                ],
              ),
            ),
            Align(alignment: Alignment.topCenter, child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(mainAxisSize: MainAxisSize.min, children: [
                  SvgPicture.asset('assets/chips.svg'),
                ]),
                SizedBox(
                  width: 10,
                ),
                  Text(
                    '10000',
                    style: TextStyle(
                        color: Color(0xff2D2E23),
                        fontSize: 20,
                        fontFamily: 'Funny',
                        decoration: TextDecoration.none),
                  ),
              ],
            ),),
          ],
        ));
  }
}

class PlayerCard extends StatelessWidget {
  late final Player player;

  PlayerCard({Key? key, required this.player}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        ClipPath(
          clipper: CardClipper(),
          child: Container(
            width: 149,
            height: 39,
            color: const Color(0xFFDBD38B).withOpacity(0.7),
            child: Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Text(
                    'datadata',
                    style: TextStyle(
                        color: Color(0xff2D2E23),
                        fontSize: 13,
                        fontFamily: 'Funny',
                        decoration: TextDecoration.none),
                  ),
                  Divider(
                    height: 5,
                    color: Colors.black,
                    thickness: 1.5,
                  ),
                  Center(
                    child: Row(mainAxisSize: MainAxisSize.min, children: [
                      Container(
                          height: 14.4,
                          width: 14,
                          child: SvgPicture.asset(
                            'assets/balance_chip.svg',
                            fit: BoxFit.fill,
                            color: Colors.red,
                          )),
                      SizedBox(
                        width: 3,
                      ),
                      Text(
                        'datadata',
                        style: TextStyle(
                            color: Color(0xff2D2E23),
                            fontSize: 11,
                            fontFamily: 'Funny',
                            decoration: TextDecoration.none),
                      ),
                    ]),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CardClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var w = size.width;
    var h = size.height;
    var path = Path();
    path.moveTo(0, h);
    path.lineTo(w * 0.81, h);
    path.lineTo(w, 0);
    path.lineTo(w - w * 0.81, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class Avatar extends StatelessWidget {
  const Avatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      CircleAvatar(
        maxRadius: 34,
        minRadius: 34,
        backgroundImage: AssetImage('assets/avatar.jpg'),
      )
    ]);
  }
}
