import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../routers/app_router.dart';

class DefaultErrorDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'An error cccured, please login again...',
            style: TextStyle(color: Colors.red[300]),
          ),
          NeumorphicIcon(
            Icons.cloud_rounded,
            size: MediaQuery.of(context).size.height * 0.2,
            style: NeumorphicStyle(depth: 3.0),
          ),
          SizedBox(
            height: 10.0,
          ),
          NeumorphicButton(
            child: Text('Login'),
            onPressed: () => {
              Navigator.of(context).pushReplacementNamed(AppRouter.login),
            },
          ),
        ],
      ),
    );
  }
}
