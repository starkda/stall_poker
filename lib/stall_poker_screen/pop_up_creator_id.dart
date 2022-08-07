import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../backend_interaction.dart';

void showIdDialog(BuildContext context) {
  final TextEditingController controller = TextEditingController();
  String data = "";
  controller.addListener(() {
    data = controller.text;
  });
  showDialog(
      context: context,
      builder: (context) {
        final height = MediaQuery.of(context).size.height;
        final width = MediaQuery.of(context).size.width;
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
                color: const Color(0xFF76CD7F),
                border: Border.all(width: 2, color: Colors.black),
                borderRadius: BorderRadius.circular(20)),
            height: height * 0.33,
            width: width * 0.33,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    'Enter game creator ID:',
                    style: TextStyle(
                        color: Colors.black,
                        decoration: TextDecoration.none,
                        fontFamily: 'Serious',
                        fontSize: 20),
                  ),
                  SizedBox(
                    height: height * 0.08,
                    width: width * 0.24,
                    child: TextField(
                      controller: controller,
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
                        hintText: 'ID',
                        suffixIcon: SvgPicture.asset('assets/search.svg'),
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      sendGetGameByIdData(data, context);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xffEADD69),
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    child: const Text(
                      'Find game!',
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
