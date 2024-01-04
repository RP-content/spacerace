import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spacerace/game/GameObject.dart';

import 'GameControler.dart';
import 'SphereCollision.dart';
import 'Vector2D.dart';

class Hindrance extends GameObject{

  Hindrance([Vector2D? pos]){
    collision = SphereCollision(this, 2);
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
              color: Colors.blueGrey,
              width: 100,
              height: 100,
              decoration: ShapeDecoration(
                color: Colors.blueGrey[200],
                image: null,
                shape: const CircleBorder(
                )
              ),
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