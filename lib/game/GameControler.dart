import 'dart:async';
import 'package:spacerace/game/Level.dart';

enum GameState{
  MENU,
  RUNNING,
}
/// author: Robert Peter
///
/// Dies ist die zentrale Schnittstelle des Spiels.
/// Referenzen und der Gameloop sind enthalten
///
///
class GameController{
  static final GameController _instance = GameController._intern();
  late Timer updates;
  GameState gameState = GameState.MENU;
  ///das geladene Level
  Level ?loadedLevel;

  ///Referenz um setState und Navigator von außerhalb der Widgets benutzen zu können
  Function ?looseF;
  Function ?frameUpdater;

  ///ausgewähltes Schiffsdesign, aktueller score, ausgewählter Planet
  int design = 0;
  int score = 0;
  int planet = 0;

  /// factory Konstruktor um zu gewährleisten, dass nur eine Instanz existiert
  factory GameController(){
    return _instance;
  }

  /// interner Konstruktor, startet den Timer für den Gameloop
  GameController._intern(){
    updates = Timer.periodic(const Duration(milliseconds: 17), (timer) {gameloop();});
  }

  void gameloop(){
    if(GameState.RUNNING == gameState){
      loadedLevel?.update(0.017);
      //Grafikupdate
      frameUpdater?.call();
    }
  }

  ///die regelmäßigen Updates werden gestoppt
  ///bei bedarf wird der LooseScreen angezeigt
  void backToMenu(bool loose){
    gameState = GameState.MENU;
    if(loose){
      looseF?.call();
    }
  }

  void setShipDesign(int i){
    design = i;
  }

  ///ein neues Level wird angelegt
  void loadLevel(){
    loadedLevel = Level();
    gameState = GameState.RUNNING;
  }
}