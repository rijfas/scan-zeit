import 'package:flutter/material.dart';

import 'pages/first_page.dart';

class IntroScreen extends StatefulWidget {
  static const id = 'intro_screen';
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FirstPage(),
    );
  }
}
