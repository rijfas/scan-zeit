import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class DefaultButton extends StatelessWidget {
  final String text;
  final Function onTap;
  const DefaultButton({
    @required this.text,
    @required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return NeumorphicButton(
      margin: const EdgeInsets.all(10.0),
      style: NeumorphicStyle(),
      onPressed: onTap,
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: size.height * 0.04,
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// class DefaultButton extends StatelessWidget {
//   final String text;
//   final Function onTap;
//   const DefaultButton({
//     @required this.text,
//     @required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final Size size = MediaQuery.of(context).size;
//     return OutlinedButton(
//       style: OutlinedButton.styleFrom(
//         backgroundColor: Theme.of(context).primaryColor,
//         padding: const EdgeInsets.all(20.0),
//         // side: BorderSide(
//         //   color: Theme.of(context).primaryColor,
//         //   width: 4.0,
//         // ),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(10.0),
//         ),
//       ),
//       onPressed: onTap,
//       child: Text(
//         text,
//         style: TextStyle(
//           color: Colors.white,
//           fontWeight: FontWeight.bold,
//           fontSize: size.height * 0.02,
//         ),
//       ),
//     );
//   }
// }
