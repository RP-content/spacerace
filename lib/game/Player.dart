import 'dart:ffi';

import 'package:flame/components.dart';

class Player extends SpriteComponent{

  Vector2 _moveDirection = Vector2.zero();
  //Move speed of player
  double _speed = 300;

  Player({
    Sprite? sprite,
    Vector2? position,
    Vector2? size,
    //int? angle,
  }) : super(sprite: sprite, position: position, size: size, /*angle: angle*/);

  @override
  void update(double dt) {
    super.update(dt);

    this.position += _moveDirection.normalized() * _speed * dt;
  }

  void setMoveDirection(Vector2 newMoveDirection){
    _moveDirection = newMoveDirection;
  }
}