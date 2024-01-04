import 'package:get/get.dart';//change of language


///made by Juan Tirado
///Just Maps that have stored the different languages. They are then called through main.dart
class LocaleStrings extends Translations{
  @override
  Map<String, Map<String, String>> get keys => {

    'en_US':{
      'earned' : 'Earned: ',
      'fireTypes' :'Fire Types',
      'shipDesigns' : 'Ship Designs',
      'backToMenu' : 'Back to Menu',
      'startGame' : 'Start Game',
      'customize' : 'Customize',
      'music' : 'Music',
      'sound' : 'Sound',
      'language' : 'Language',
      'exitGame' : 'Exit Game',
      'aboutUs' : 'About Us'
    },
    'de_DE':{
      'earned' : 'Earned: ',
      'fireTypes' : 'Feuerarten',
      'shipDesigns' : 'Schiffsentwürfe',
      'backToMenu' : 'Zurück zum Menü',
      'startGame' : 'Spiel starten',
      'customize' : 'Anpassen',
      'music' : 'Musik',
      'sound' : 'Ton',
      'language' : 'Sprache',
      'exitGame' : 'Spiel beenden',
      'aboutUs' : 'Über uns'
    }
  };

}