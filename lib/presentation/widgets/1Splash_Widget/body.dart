import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../../shared/styles/assets_manager.dart';

class Splash_Body extends StatelessWidget {
  const Splash_Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: ColorManager.primary,
      body: Center(
          child: FadeInDown(
              child: Image(image: AssetImage(ImageAssets.logo)))),
    );
  }
}
