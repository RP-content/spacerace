import 'dart:math';

class Vector2D{
  late double _x,_y;

  Vector2D(this._x,this._y);

  double getX(){
    return _x;
  }
  double getY(){
    return _y;
  }

  double length(){
    return sqrt(pow(_x,2)+pow(_y, 2));
  }


}