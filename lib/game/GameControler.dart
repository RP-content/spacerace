import 'dart:async';

import 'package:spacerace/game/Level.dart';
import 'package:spacerace/graphics/Game.dart';

enum GameState{
  MENU,
  RUNNING,
}
class GameControler{
  static late GameControler _instance;
  late Timer updates;
  GameState gameState = GameState.MENU;
  Level ?loadedLevel;
  GameFrame ?frame;
  _GameControler(){
    updates = Timer.periodic(const Duration(milliseconds: 17), (timer) {gameloop();});
  }

  static GameControler getInstance() {
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