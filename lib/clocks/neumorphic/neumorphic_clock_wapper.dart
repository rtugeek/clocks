// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:

// Project imports:
import '../model.dart';
import 'neumorphic_clock.dart';

class NeumorphicClockWrapper extends StatefulWidget {
  const NeumorphicClockWrapper(this.model);

  final ClockModel model;

  @override
  _NeumorphicClockWrapperState createState() => _NeumorphicClockWrapperState();
}

class _NeumorphicClockWrapperState extends State<NeumorphicClockWrapper> {
  @override
  Widget build(BuildContext context) {
    final customTheme = Theme.of(context).brightness == Brightness.light
        ? Theme.of(context).copyWith(
            // Hour hand.
            primaryColor: Colors.grey[800],
            // Minute hand.
            highlightColor: Colors.grey[800],
            // Second hand.
            accentColor: Colors.red[800],
            // Tick color
            hintColor: Colors.grey[900],
            // Shadow color
            canvasColor: Colors.grey[500],
            // Inner shadow color
            dividerColor: Colors.grey[400],
            // Icon color:
            errorColor: Colors.grey[800]!.withOpacity(0.1),
            backgroundColor: Colors.grey[300],
          )
        : Theme.of(context).copyWith(
            // Hour hand.
            primaryColor: Colors.grey[400],
            // Minute hand.
            highlightColor: Colors.grey[400],
            // Second hand.
            accentColor: Colors.red[800],
            // Tick color
            hintColor: Colors.grey[900],
            // Shadow color
            canvasColor: Colors.grey[900],
            // Inner shadow color
            dividerColor: Colors.grey[900],
            // Icon color:
            errorColor: Colors.grey[400]!.withOpacity(0.1),
            backgroundColor: Color(0xFF3C4043),
          );
    return Container(
        color: customTheme.backgroundColor,
        child: Center(
          child: AspectRatio(
            aspectRatio: 5 / 3,
            child: NeumorphicClock(widget.model),
          ),
        ));
  }
}
