import 'package:flutter/material.dart';

import 'login_screen.dart';
import 'registration_screen.dart';
import 'stall_poker_screen/main_screen.dart';

Route? routeGenerator(RouteSettings settings) {
  switch (settings.name) {
    case ('/main_screen'):
      return MaterialPageRoute(builder: (context) => const MainScreen());
    case ('/login_screen'):
      return MaterialPageRoute(builder: (context) => const LoginScreen());
    case ('/registration_screen'):
      return MaterialPageRoute(
          builder: (context) => const RegistrationScreen());
    default:
      return MaterialPageRoute(builder: (context) => const LoginScreen());
  }
}
