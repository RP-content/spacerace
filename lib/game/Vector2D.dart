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

  Vector2D get normalized => this / length;

  double get length => sqrt(pow(_x,2)+pow(_y, 2));

  Vector2D operator +(Vector2D other){
    return Vector2D(_x+other.getX(), _y+other.getY());
  }

  Vector2D operator -(Vector2D other){
    return Vector2D(_x-other.getX(), _y-other.getY());
  }
  Vector2D operator *(num other){
    return Vector2D(_x*other, _y*other);
  }
  Vector2D operator /(num other){
    return Vector2D(_x/other, _y/other);
  }
  @override
  String toString() {
    return "X: $_x Y: $_y";
  }
}