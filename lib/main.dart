import 'package:flutter/material.dart';
import 'package:sipatex_mobile_challenge/app.dart';
import 'package:sipatex_mobile_challenge/core/core/bindings/global_bindings.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  GlobalBindings().dependencies();
  ErrorWidget.builder = (FlutterErrorDetails details) {
    return Material(
      child: Container(
        color: Colors.green,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              details.exception.toString(),
              style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            )
          ],
        ),
      ),
    );
  };

  await GetStorage.init();
  runApp(const App());
}