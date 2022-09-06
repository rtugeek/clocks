// Copyright 2020 Filipe Barroso. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the Baloo-LICENSE file.

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flare_flutter/flare_actor.dart';

import '../flare/assets_utils/numbers_assets.dart';
import '../flare/number_flare_controller.dart';

// Project imports:

class SwitchNumbers extends StatelessWidget {
  final FlareControllerEntry number;
  final double height;
  final double width;

  SwitchNumbers({
    required this.number,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: this.height,
        width: this.width,
        child: Stack(
          children: <Widget>[
            FlareActor(
              this.number.previous!.asset,
              controller:
                  NumberFlareControler(currentState: AnimationState.hide),
            ),
            FlareActor(
              this.number.asset,
              controller:
                  NumberFlareControler(currentState: AnimationState.show),
            )
          ],
        ));
  }
}
