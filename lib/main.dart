import 'package:flutter/material.dart';
import 'package:scan_zeit/screens/main_screen/main_screen.dart';

import 'core/misc/constants.dart';
import 'screens/intro_screen/intro_screen.dart';
import 'screens/login_register_screen/login_register_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: MaterialColor(kColors_primaryColor, kColorScheme),
      ),
      routes: <String, WidgetBuilder>{
        IntroScreen.id: (context) => IntroScreen(),
        LoginRegisterScreen.id: (context) => LoginRegisterScreen(),
        MainScreen.id: (context) => MainScreen(),
      },
      initialRoute: MainScreen.id,
    );
  }
}
