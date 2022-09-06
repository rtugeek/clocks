// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'HumanBeansClock.dart';

class HumanBeansClockApp extends StatelessWidget {
  /// Root for the clock app
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Eventually',
      theme: null,
      home: HumanBeansClock(),
      debugShowCheckedModeBanner: false,
    );
  }
}
