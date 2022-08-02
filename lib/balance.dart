import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Balance extends StatelessWidget {
  final int balance;

  const Balance({Key? key, required this.balance}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.topRight,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            SvgPicture.asset('assets/balance_border.svg'),
            const SizedBox(
              width: 30,
            ),
            SizedBox(
              width: 150,
                child: Row(
                    children: [
                      const SizedBox(width: 5,),
                      SvgPicture.asset('assets/balance_chip.svg'),
                      const SizedBox(width: 5,),
                      Text(

                        balance.toString(),
                        style:
                            const TextStyle(fontSize: 28, color: Color(0xFF729C62), decoration: TextDecoration.none),
                      )
                    ]))
          ],
        ));
  }
}
