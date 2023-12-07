import 'dart:async';

import 'package:spacerace/game/Level.dart';
import 'package:spacerace/graphics/Game.dart';

enum GameState{
  MENU,
  RUNNING,
}
class GameControler{
  static GameControler ?_instance;
  late Timer updates;
  GameState gameState = GameState.MENU;
  Level ?loadedLevel;
  Function ?frameUpdater;

  GameControler(){

    updates = Timer.periodic(const Duration(milliseconds: 17), (timer) {gameloop();});

  }

  static GameControler getInstance() {
    _instance ??= GameControler();
    return _instance!;
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