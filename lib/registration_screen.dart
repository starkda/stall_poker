import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:stallpoker/backend_interaction.dart';

import 'data_cast_generator.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final Map<String, dynamic> userData = DataCastGenerator().getUserDataCast();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  int curState = 500;

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
    if (curState == 200) {
      Navigator.of(context).pushReplacementNamed('main_screen');
    }

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
                        'Register',
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
                              controller: nameController,
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
                              controller: passwordController,
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
                          print('register button taught');
                          registerUser(userData).then((value) {
                            if (kDebugMode) {
                              print(value);
                            }
                            setState(() {
                              curState = value;
                            });
                          });
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
                          'Create account!',
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
                    print('Got into login screen');
                  }
                  Navigator.of(context).pushReplacementNamed('/login_screen');
                },
                child: const Text(
                  'Already have an account?',
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
