import 'package:spacerace/game/GameControler.dart';
import 'package:spacerace/game/GameObject.dart';
import 'package:spacerace/game/Vector2D.dart';

abstract class MoveableObject extends GameObject{
  void move(Vector2D delta){
    GameController().loadedLevel!.movement+=delta.getX();
    setX(getX()+delta.getX());
    setY(getY()+delta.getY());
  }

}