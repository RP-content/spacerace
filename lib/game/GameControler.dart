import 'dart:async';

import 'package:spacerace/game/Level.dart';

enum GameState{
  MENU,
  RUNNING,
}
class GameControler{
  late GameControler _instance;
  late Timer updates;
  GameState gameState = GameState.MENU;
  Level ?loadedLevel;

  _GameControler(){
    updates = Timer.periodic(const Duration(milliseconds: 17), (timer) {gameloop();});
  }

  GameControler getInstance() {
    if (_instance == null) {
      _instance = GameControler();
    }
    return _instance;
  }

  void gameloop(){
    if(GameState.RUNNING == gameState){
      loadedLevel?.update(0.017);
    }
  }
}