import 'package:spacerace/game/GameControler.dart';
import 'package:spacerace/game/GameObject.dart';
import 'package:spacerace/game/Vector2D.dart';

abstract class MoveableObject extends GameObject{
  void move(Vector2D dest){
    setX(dest.getX());
    setY(dest.getY());
    if(collision != null){
      GameController().loadedLevel?.objects.forEach((element) {
        if(!GameController().loadedLevel!.removing.contains(element)){
          element.collision?.isColliding(collision!);
        }
      });
    }
  }

}