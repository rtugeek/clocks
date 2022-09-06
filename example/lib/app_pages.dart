// Package imports:
import 'package:clocks/clocks.dart';
import 'package:clocks/clocks/cloom/cloom_clock.dart';
import 'package:clocks/clocks/customizer.dart';
import 'package:clocks/clocks/humanbeans/HumanBeansClock.dart';
import 'package:clocks/clocks/model.dart';
import 'package:clocks/clocks/neumorphic/neumorphic_clock_wapper.dart';
import 'package:clocks/clocks/tetris/tetris_time.dart';
import 'package:get/get.dart';

class AppPages {
  static final routes = [
    GetPage(name: "/clocks", page: () => const ClocksPage(), children: [
      GetPage(
          name: "/cloom",
          page: () => ClockCustomizer((ClockModel model) => CloomClock(model))),
      GetPage(
          name: "/neumorphic",
          page: () => ClockCustomizer(
              (ClockModel model) => NeumorphicClockWrapper(model))),
      GetPage(
          name: "/humanbeans",
          page: () => ClockCustomizer((ClockModel model) => HumanBeansClock())),
      GetPage(
          name: "/tetris",
          page: () =>
              ClockCustomizer((ClockModel model) => TetrisClock(model))),
    ]),
  ];
}
