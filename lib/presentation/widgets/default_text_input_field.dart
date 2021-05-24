import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class DefaulTextInputField extends StatelessWidget {
  final String hintText;
  final bool isPassword;
  final Function validator;
  final Function onSaved;
  const DefaulTextInputField(
      {Key key,
      @required this.hintText,
      @required this.validator,
      @required this.onSaved,
      this.isPassword = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      margin: const EdgeInsets.all(10.0),
      style: NeumorphicStyle(),
      child: TextFormField(
        onSaved: onSaved,
        validator: validator,
        obscureText: isPassword,
        decoration: InputDecoration(
          hintText: hintText,
          // suffixIcon: isPassword
          //     ? Padding(
          //         padding: const EdgeInsetsDirectional.only(end: 12.0),
          //         child: Icon(
          //           Icons.remove_red_eye_rounded,
          //         ),
          //       )
          //     : null,
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10.0)),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// import '../../core/themes/app_theme.dart';

// class DefaulTextInputField extends StatelessWidget {
//   final String hintText;
//   final bool isPassword;
//   final Function validator;
//   final Function onSaved;
//   const DefaulTextInputField(
//       {Key key,
//       @required this.hintText,
//       @required this.validator,
//       @required this.onSaved,
//       this.isPassword = false})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       onSaved: onSaved,
//       validator: validator,
//       obscureText: isPassword,
//       decoration: InputDecoration(
//         // suffixIcon: isPassword
//         //     ? Padding(
//         //         padding: const EdgeInsetsDirectional.only(end: 12.0),
//         //         child: Icon(
//         //           Icons.remove_red_eye_rounded,
//         //         ),
//         //       )
//         //     : null,
//         filled: true,
//         fillColor: AppTheme.colorPallet[50],
//         hintText: hintText,
//         border: OutlineInputBorder(
//             borderSide: BorderSide.none,
//             borderRadius: BorderRadius.circular(10.0)),
//       ),
//     );
//   }
// }
