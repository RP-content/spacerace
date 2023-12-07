import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:spacerace/game/Vector2D.dart';

abstract class GameObject{
  double _x=0,_y=0;
  late Image texture;
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

  void start();
  void update(double delta);
  void end();
  Widget getGraphics();

}