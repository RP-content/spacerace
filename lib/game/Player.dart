import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:spacerace/game/GameControler.dart';
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

  @override
  Widget getGraphics() {
    return Positioned.fill(
        child: Container(
            color: Colors.transparent,
            alignment: GameControler.getInstance().loadedLevel?.getAlignmentFromPosition(getX(),getY()),
            child: Container(
              color: Colors.deepOrange,
              width: 20,
              height: 20,
          )
    ));


  }

}