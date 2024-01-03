import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:spacerace/game/GameObject.dart';
import 'package:spacerace/game/SphereCollision.dart';

import 'GameControler.dart';
import 'Vector2D.dart';

class Obstacle extends GameObject {
  Obstacle([Vector2D? pos]){
    collision = SphereCollision(this, 1);
    if(pos != null){
      setPosition(pos);
    }
  }

  @override
  void end() {
    // TODO: implement end
  }

  @override
  Widget getGraphics() {
    return Positioned.fill(
        child: Container(
            color: Colors.transparent,
            alignment: GameController().loadedLevel?.getAlignmentFromPosition(getX(),getY()),
            child: Container(
              color: Colors.blueGrey[900],
              width: 50,
              height: 50,
            )
        ));
  }

  @override
  void start() {
    // TODO: implement start
  }

  @override
  void update(double delta) {
    // TODO: implement update
  }

}