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
  int design = 0;
  int score = 0;

  factory GameController(){
    return _instance;
  }

  int getScore(){
    return score;
}

  GameController._intern(){
    updates = Timer.periodic(const Duration(milliseconds: 20), (timer) {gameloop();});
  }

  void gameloop(){
    if(GameState.RUNNING == gameState){
      loadedLevel?.update(0.02);
      frameUpdater?.call();
      //print("loop");
    }
  }

  void backToMenu(){
    gameState = GameState.MENU;
  }

  void setShipDesign(int i){
    design = i;
  }

  void loadLevel(){
    loadedLevel = Level();
    gameState = GameState.RUNNING;
  }
}