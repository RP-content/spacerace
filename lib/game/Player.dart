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
  double size = 1.0;

  List<String> shipDesigns = [
    'assets/images/ships/ship_A.png',
    'assets/images/ships/ship_B.png',
    'assets/images/ships/ship_C.png',
    'assets/images/ships/ship_D.png',
    'assets/images/ships/ship_E.png',
    'assets/images/ships/ship_F.png',
  ];

  Player(){
    collision = SphereCollision(this, size);
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
            child: Image.asset(
              shipDesigns[GameController().design],
              width: GameController().loadedLevel?.getLogicUnitFromPosition(size),
              height: GameController().loadedLevel?.getLogicUnitFromPosition(size),
              
            )
    ));

  }

}