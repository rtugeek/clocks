// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flare_flutter/flare_actor.dart';

// Project imports:
import 'BranchesLayout.dart';
import 'ClockUiInheritedModel.dart';

// Class for stacking the [FlareActor] of the 'halo' effect of the bird on top of everything else.
//
// The idea is to have the blend mode on top of all widgets
class LayersLayout extends StatelessWidget {
  const LayersLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(14, 39, 88, 1),
      constraints: const BoxConstraints.expand(),
      child: Stack(children: <Widget>[
        const BranchesLayout(),
        // The flare actor subscribes to the 'birdControls' aspect of the [ClockUiInheritedModel]. It should not trigger a rebuild as
        // this value is allways the same and the model doesn't check for that aspect
        FlareActor(
          'packages/clocks/assets/neumorphic/rive/Light_Final.flr',
          controller:
              ClockUiInheritedModel.of(context, 'birdControls')!.haloControls,
          fit: BoxFit.contain,
          shouldClip: true,
        ),
      ]),
    );
  }
}
