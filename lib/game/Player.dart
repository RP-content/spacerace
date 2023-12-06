import 'dart:ui';

import 'package:spacerace/game/GameObject.dart';
import 'package:spacerace/game/MovableObject.dart';

class Player extends GameObject{
  double speed = 1.0;

  @override
  void end() {
    // TODO: implement end
  }

  @override
  void start() {
    // TODO: implement start
  }

  @override
  void update(double delta) {
    setX(getX()+delta*speed);
  }

  void touchInput(Offset offset){
    setY(offset.dy+getY());
  }
}