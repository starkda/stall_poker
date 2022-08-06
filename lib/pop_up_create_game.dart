import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'backend_interaction.dart';
import 'data_cast_generator.dart';

void createGameDialog(BuildContext context) {
  DataCastGenerator gen = DataCastGenerator();
  Map<String, dynamic> createGameDataBox = gen.getCreateGameDataCast();
  showDialog(
      context: context,
      builder: (context) {
        final height = MediaQuery.of(context).size.height;
        final width = MediaQuery.of(context).size.width;
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) => Dialog(
            backgroundColor: Colors.transparent,
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFF76CD7F),
                border: Border.all(width: 2, color: Colors.black),
                borderRadius: BorderRadius.circular(20),
              ),
              height: height * 0.88,
              width: width * 0.38,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        flex: 10,
                        child: CheckboxListTile(
                          controlAffinity: ListTileControlAffinity.leading,
                          checkColor: Colors.white,
                          activeColor: Colors.black,
                          value: createGameDataBox['private'],
                          onChanged: (value) {
                            createGameDataBox['private'] = value!;
                            setState(() {});
                          },
                          title: const Text(
                            'Private',
                            style: TextStyle(fontFamily: 'Serious'),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          color: Colors.red,
                        ),
                      ),
                      Expanded(
                        flex: 10,
                        child: CheckboxListTile(
                          controlAffinity: ListTileControlAffinity.leading,
                          checkColor: Colors.white,
                          activeColor: Colors.black,
                          value: createGameDataBox['bots'],
                          onChanged: (value) {
                            createGameDataBox['bots'] = value!;
                            setState(() {});
                          },
                          title: const Text(
                            'Bots',
                            style: TextStyle(fontFamily: 'Serious'),
                          ),
                        ),
                      )
                    ],
                  ),
                  Column(children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'Maximal players: ${createGameDataBox["maximal_players"].toInt()}',
                        style: const TextStyle(
                            fontFamily: 'Serious', fontSize: 20),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Slider(
                        inactiveColor: Colors.black38,
                        activeColor: const Color(0xff4A4A4A),
                        thumbColor: Colors.black,
                        divisions: 4,
                        min: 1,
                        max: 5,
                        value: createGameDataBox["maximal_players"],
                        onChanged: (value) {
                          createGameDataBox["maximal_players"] = value;
                          setState(() {});
                        })
                  ]),
                  Column(children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'Blind bet: ${createGameDataBox["blind_bet"].toInt()}',
                        style: const TextStyle(
                            fontFamily: 'Serious', fontSize: 20),
                      ),
                    ),
                    Slider(
                        inactiveColor: Colors.black38,
                        activeColor: const Color(0xff4A4A4A),
                        thumbColor: Colors.black,
                        min: 1,
                        max: 1000,
                        value: createGameDataBox["blind_bet"],
                        onChanged: (value) {
                          createGameDataBox["blind_bet"] = value;
                          setState(() {});
                        })
                  ]),
                  Column(children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'Thinking time: ${createGameDataBox["thinking_time"].toInt()}',
                        style: const TextStyle(
                            fontFamily: 'Serious', fontSize: 20),
                      ),
                    ),
                    Slider(
                        inactiveColor: Colors.black38,
                        activeColor: const Color(0xff4A4A4A),
                        thumbColor: Colors.black,
                        min: 5,
                        max: 60,
                        value: createGameDataBox["thinking_time"],
                        onChanged: (value) {
                          createGameDataBox["thinking_time"] = value;
                          setState(() {});
                        })
                  ]),
                  ElevatedButton(
                    onPressed: () {
                      if (kDebugMode) {
                        print('data was sent');
                      }
                      sendCreateGameData(createGameDataBox, context);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xffEADD69),
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    child: const Text(
                      'Create game!',
                      style: TextStyle(
                          color: Colors.black,
                          decoration: TextDecoration.none,
                          fontFamily: 'Serious',
                          fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      });
}
