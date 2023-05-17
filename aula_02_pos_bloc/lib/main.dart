import 'dart:io';
import 'package:aula02_pos_bloc/app/android_app.dart';
import 'package:aula02_pos_bloc/app/ios_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

void main() {
  //runApp(kIsWeb || Platform.isAndroid ? const AndroidApp() : const IosApp());
  if (kIsWeb || Platform.isAndroid) {
    runApp(const AndroidApp());
  } else {
    runApp(const IosApp());
  }

  //runApp(Platform.isIOS ? const IosApp() : const AndroidApp());
  /*
  if (Platform.isIOS) {
    runApp(const IosApp());
  } else {
    runApp(const AndroidApp());
  }
  */
}