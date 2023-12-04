import 'dart:ui';

abstract class GameObject{
  double _x=0,_y=0;
  late Image texture;

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
  void update();
  void end();


}