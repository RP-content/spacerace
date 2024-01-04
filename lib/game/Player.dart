import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:spacerace/game/GameControler.dart';
import 'package:spacerace/game/GameObject.dart';
import 'package:spacerace/game/MovableObject.dart';
import 'package:spacerace/game/SphereCollision.dart';
import 'package:spacerace/game/Vector2D.dart';

class Player extends MoveableObject{
  double speed = 1.0;

  Player(){
    collision = SphereCollision(this, 0.5);
  }
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
    move(Vector2D(getX()+delta*speed,getY()));
    GameController().loadedLevel?.objects.forEach((element) {
      if(!GameController().loadedLevel!.removing.contains(element)){
        element.collision?.isColliding(collision!);
      }
    });
  }

  void touchInput(Offset offset){
    move(Vector2D(getX(),offset.dy+getY()));
  }

  @override
  Widget getGraphics() {
    return Positioned.fill(
        child: Container(
          //0xAARRGGBB
            color: Colors.transparent,
            alignment: GameController().loadedLevel?.getAlignmentFromPosition(getX(),getY()),
            child: Container(
              color: Colors.deepOrange,
              width: 40,
              height: 40,
          )
    ));

  }

}