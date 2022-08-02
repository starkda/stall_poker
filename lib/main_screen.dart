import 'package:flutter/material.dart';
import 'balance.dart';
import 'bottom_main_screen_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.png'),
            fit: BoxFit.fitHeight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Balance(
              balance: 100000,
            ),
            Text(
              'Stall poker',
              style: TextStyle(
                  fontSize: 80,
                  fontFamily: 'Funny',
                  decoration: TextDecoration.none,
                  color: Color(0xFF76CD7F)),
            ),
            BottomMainScreenBar(
              title: 'kek',
            ),
          ],
        ),
      ),
    );
  }
}
