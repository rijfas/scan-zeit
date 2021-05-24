// import 'package:flutter/material.dart';
// import 'package:scan_zeit/core/constants.dart';
// import 'package:scan_zeit/presentation/widgets/default_button.dart';

// class ToggleSelector extends StatefulWidget {
//   final String firstText;
//   final String secondText;
//   final Function onToggle;
//   ToggleSelector({
//     @required this.firstText,
//     @required this.secondText,
//     @required this.onToggle,
//   });
//   @override
//   _ToggleSelectorState createState() => _ToggleSelectorState();
// }

// class _ToggleSelectorState extends State<ToggleSelector> {
//   bool _isToggled = false;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: <Widget>[
//           DefaultButton(
//               text: widget.firstText,
//               color: _isToggled ? Colors.white : kColorScheme[900],
//               textColor: _isToggled ? kColorScheme[900] : Colors.white,
//               onTap: () {
//                 setState(() {
//                   _isToggled = !_isToggled;
//                 });
//               }),
//           DefaultButton(
//               text: widget.secondText,
//               color: _isToggled ? kColorScheme[900] : Colors.white,
//               textColor: _isToggled ? Colors.white : kColorScheme[900],
//               onTap: () {
//                 setState(() {
//                   _isToggled = !_isToggled;
//                 });
//               }),
//         ],
//       ),
//     );
//   }
// }
