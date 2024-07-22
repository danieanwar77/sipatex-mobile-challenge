import 'package:flutter/material.dart';
import 'package:sipatex_mobile_challenge/feature/splash/splash_controller.dart';
import 'package:get/state_manager.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: SplashController(),
      builder: (controller) => Scaffold(
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlutterLogo(
                size: 120,
              ),
              SizedBox(height: 56,),
              CircularProgressIndicator.adaptive()
            ],
          )
        )
      )
    );
  }
}
