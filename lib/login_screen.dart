import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'backend_interaction.dart';
import 'data_cast_generator.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final Map<String, dynamic> userData = DataCastGenerator().getUserDataCast();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController.addListener(() {
      userData['login'] = nameController.text;
    });
    passwordController.addListener(() {
      userData['password'] = passwordController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Material(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/background.png'),
              fit: BoxFit.fitHeight,
            ),
          ),
          child: Stack(children: [
            Center(
              child: Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                height: height,
                width: width * 0.35,
                //  color: Colors.redAccent,
                child: ListView(
                  children: [
                    const Center(
                      child: Text(
                        'Log in',
                        style: TextStyle(
                            fontSize: 70,
                            fontFamily: 'Serious',
                            decoration: TextDecoration.none,
                            color: Color(0xFF76CD7F)),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'name',
                          style: TextStyle(
                              fontSize: 25,
                              fontFamily: 'Serious',
                              decoration: TextDecoration.none,
                              color: Color(0xFF76CD7F)),
                        ),
                        SizedBox(
                            width: width * 0.20,
                            height: height * 0.07,
                            child: TextField(
                              scrollPadding: EdgeInsets.only(
                                  bottom:
                                      MediaQuery.of(context).viewInsets.bottom +
                                          40),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        color: Colors.black, width: 10)),
                                fillColor: Colors.white,
                                filled: true,
                              ),
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'password',
                          style: TextStyle(
                              fontSize: 25,
                              fontFamily: 'Serious',
                              decoration: TextDecoration.none,
                              color: Color(0xFF76CD7F)),
                        ),
                        SizedBox(
                            width: width * 0.20,
                            height: height * 0.07,
                            child: TextField(
                              scrollPadding: EdgeInsets.only(
                                  bottom:
                                      MediaQuery.of(context).viewInsets.bottom +
                                          60),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        color: Colors.black, width: 10)),
                                fillColor: Colors.white,
                                filled: true,
                              ),
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        if (kDebugMode) {
                          print('login button taught');
                          if (await loginUser(userData) == 200) {
                            Navigator.of(context)
                                .pushReplacementNamed('/main_screen');
                          }
                        }
                      },
                      style: OutlinedButton.styleFrom(
                          fixedSize: Size(width * 0.23, height * 0.11),
                          primary: Colors.black,
                          backgroundColor: const Color(0xFF76CD7F),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30))),
                      child: const Center(
                        child: Text(
                          'Login!',
                          style: TextStyle(fontFamily: 'Serious', fontSize: 24),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: height,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: OutlinedButton(
                onPressed: () {
                  if (kDebugMode) {
                    print('Got into register screen');
                  }
                  Navigator.of(context)
                      .pushReplacementNamed('/registration_screen');
                },
                child: const Text(
                  'Not registered yet?',
                  style: TextStyle(
                    fontFamily: 'Serious',
                    fontSize: 28,
                    color: Color(0xff729C62),
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
