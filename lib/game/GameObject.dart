
import 'package:flutter/cupertino.dart';
import 'package:spacerace/game/CollisionShape.dart';
import 'package:spacerace/game/GameControler.dart';
import 'package:spacerace/game/Vector2D.dart';

/// author: Robert Peter
/// allgemeines Objekt mit den nötigen Informationen
abstract class GameObject{
  CollisionShape? collision;
  double _x = 0, _y = 0;
  Vector2D get position {return Vector2D(_x, _y);}


  double getX(){
    return _x;
  }

  double getY(){
    return _y;
  }

  void setY(double ny){
    _y = ny;
  }
  void setX(double nx){
    _x = nx;
  }

  void setPosition(Vector2D pos){
    setX(pos.getX());
    setY(pos.getY());
  }
  Vector2D getPosition(){
    return Vector2D(getX(),getY());
  }

  void start();
  void update(double delta);
  void end();
  Widget getGraphics();

  void destroy(){
    GameController().loadedLevel?.removeObject(this);
  }
}