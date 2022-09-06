// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:flutter_svg/flutter_svg.dart';

import 'generated/assets.dart';

class ClocksPage extends StatelessWidget {
  const ClocksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> previews = [
      "assets/images/clock_cloom.webp",
      "assets/images/clock_neumorphic.webp",
      "assets/images/clock_humanbeans.webp",
      "assets/images/clock_tetris.webp"
    ];
    List<String> routers = [
      "/clocks/cloom",
      "/clocks/neumorphic",
      "/clocks/humanbeans",
      "/clocks/tetris"
    ];
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              ListView.separated(
                  padding: const EdgeInsets.all(16),
                  shrinkWrap: true,
                  itemCount: previews.length,
                  itemBuilder: (context, index) => TextButton(
                      onPressed: () async{
                        SystemChrome.setPreferredOrientations([
                          DeviceOrientation.landscapeLeft,
                          DeviceOrientation.landscapeRight
                        ]);
                        SystemChrome.setEnabledSystemUIMode(
                            SystemUiMode.immersiveSticky);
                        var router = routers[index];
                        // UmengCommonSdk.onEvent(
                        //     "USE_CLOCK", {"type": router.replaceAll("/", "")});
                        await Navigator.pushNamed(context, router);
                        SystemChrome.setPreferredOrientations(
                            [DeviceOrientation.portraitUp]);
                        SystemChrome.setEnabledSystemUIMode(
                            SystemUiMode.edgeToEdge);
                      },
                      child: Image(image: AssetImage(previews[index],package: "clocks"))),
                  separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(
                    height: 16,
                  )),
              if (Platform.isIOS)
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 56,
                    height: 56,
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(28))),
                    child: SvgPicture.asset(Assets.iconClose),
                  ),
                )
            ],
          ),
        ),),
    );
  }
}
