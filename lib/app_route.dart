import 'package:get/get.dart';
import 'package:heart_beat/screens/home/home_screen.dart';
import 'package:heart_beat/screens/login/login_screen.dart';
import 'package:heart_beat/screens/register/register_screen.dart';
import 'package:heart_beat/screens/splash/splash_screen.dart';

class AppRoute {
  static const splashScreen = '/splashScreen';
  static const loginScreen = '/loginScreen';
  static const registerScreen = '/registerScreen';
  static const homeScreen = '/homeScreen';

  static final routes = [
    GetPage(
      name: splashScreen,
      page: () => const SplashScreen(),
    ),

    GetPage(
      name: loginScreen,
      page: () => const LoginScreen(),
    ),

    GetPage(
      name: registerScreen,
      page: () => const RegisterScreen(),
    ),

    GetPage(
      name: homeScreen,
      page: () => const HomeScreen(),
    ),
  ];
}
