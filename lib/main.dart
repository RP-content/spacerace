import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:spacerace/graphics/MainMenu.dart';

import 'package:get/get.dart';
import 'package:spacerace/graphics/LocaleStrings.dart';
void main() {
  runApp(const Game());
}

class Game extends StatelessWidget {
  const Game({super.key});

  // Function to change the app's locale
 /* void _changeLocale(BuildContext context, Locale newLocale) {
    AppLocalizations.delegate.load(newLocale);
    // Trigger a rebuild of the widget tree
    Navigator.popUntil(context, (route) => route.isFirst);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const MainMenu()),
    );
  } */


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    // Set preferred orientations to landscape only
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    return GetMaterialApp(
      title: 'space race',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),

    /*  localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      //locale: Locale('de'),
      supportedLocales: [
        Locale('en'),
        Locale('de')
      ], */
      translations: LocaleStrings(),
      locale: Locale('en', 'US'),

      home: const MainMenu(),
    );

  }
}