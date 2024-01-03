import 'dart:async';

import 'package:spacerace/game/Level.dart';
import 'package:spacerace/graphics/Game.dart';

enum GameState{
  MENU,
  RUNNING,
}
class GameController{
  static final GameController _instance = GameController._intern();
  late Timer updates;
  GameState gameState = GameState.MENU;
  Level ?loadedLevel;
  Function ?frameUpdater;

  factory GameController(){
    return _instance;
  }

  GameController._intern(){
    updates = Timer.periodic(const Duration(milliseconds: 17), (timer) {gameloop();});
  }

  void gameloop(){
    if(GameState.RUNNING == gameState){
      loadedLevel?.update(0.017);
      frameUpdater?.call();
      //print("loop");
    }
  }

  void loadLevel(){
    loadedLevel = Level();
    gameState = GameState.RUNNING;
  }
}