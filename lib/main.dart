import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:flutter/services.dart';
import 'package:spacerace/game/game.dart';
import 'package:spacerace/graphics/MainMenu.dart';
import 'package:get/get.dart';

import 'graphics/LocaleStrings.dart';


void main()  {
  WidgetsFlutterBinding.ensureInitialized();
  Flame.device.fullScreen();
  Flame.device.setLandscape();

  runApp(
    GetMaterialApp(
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      translations: LocaleStrings(),
      locale: Locale('en', 'US'),
      home: MainMenu(),
    ),
  );
}
