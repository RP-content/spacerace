import 'package:get/get.dart';

class LocaleStrings extends Translations{
  @override
  // TODO: implement keys
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
    }
  };

}