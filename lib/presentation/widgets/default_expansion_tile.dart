import 'package:flutter/material.dart';

class DefaultExpansionPanel extends StatefulWidget {
  final String title;
  final String subtitle;
  final List<Widget> children;
  const DefaultExpansionPanel(
      {@required this.title, @required this.subtitle, @required this.children});
  @override
  _DefaultExpansionPanelState createState() => _DefaultExpansionPanelState();
}

class _DefaultExpansionPanelState extends State<DefaultExpansionPanel> {
  bool _isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      leading: Icon(
        Icons.account_circle,
        size: 40.0,
        color: Theme.of(context).primaryColor,
      ),
      title: Text(
        widget.title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(widget.subtitle),
      children: widget.children,
      trailing: Icon(_isExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down),
      onExpansionChanged: (value) {
        setState(() {
          _isExpanded = value;
        });
      },
    );
  }
}
