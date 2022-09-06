// Dart imports:
import 'dart:ui';

// Flutter imports:
import 'package:flutter/material.dart' hide Image;

// Project imports:
import 'ClockUiInheritedModel.dart';
import 'LayersLayout.dart';
import 'LoadingScreen.dart';
import 'TexturePainter.dart';

// Class to wrap all the display widgets in [AspectRatio] and hold the [FutureBuilder].
//
// The [FutureBuilder] resolves when the [dart:ui.Image] load and dispalys the clock face.
// Before that shows a loading screen
class SceneLayout extends StatelessWidget {
  const SceneLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Subscibes to the 'iamgesFuture' to the [ClockUiInheritedModel]. Should't trigger
      // rebuild.
        future: ClockUiInheritedModel.of(context, 'imagesFuture')!
            .imagesFuture,
        // Resolves when the [dart:ui.Image] load
        builder: (BuildContext c, AsyncSnapshot<List<Image>> snapshot) {
          // If the future has resolved
          if (snapshot.connectionState == ConnectionState.done) {
            return
              // Paint the textures over all the ui widgets
              // We use [CustomPaint] to get the [ColorBlend] mode for
              // the textures
              CustomPaint(
                foregroundPainter: TexturePainter(
                  screenTexture: snapshot.data![0],
                  multiplyTexture: snapshot.data![1],
                ),
                child: const LayersLayout(),
              );
            // If still loading
          } else {
            // Display the loading screen
            return const LoadingScreen();
          }
        });
  }
}
