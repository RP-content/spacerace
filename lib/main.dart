import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; //game orientation, fullscreen,etc

import 'package:spacerace/graphics/MainMenu.dart'; // for accessing main menu

import 'package:get/get.dart';//change of language
import 'package:spacerace/graphics/LocaleStrings.dart';// data of languages

///configured by Juan Tirado
void main() {
  runApp(const Game());
}

class Game extends StatelessWidget {
  const Game({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    // Set preferred orientations to landscape only
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    //Set fullscreen
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

    return GetMaterialApp(
      title: 'space race',
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),

      translations: LocaleStrings(), //the two lines who are in charge of language switching
      locale: Locale('en', 'US'),

      home: const MainMenu(),
    );

  }
}