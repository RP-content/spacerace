import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:spacerace/game/GameObject.dart';
import 'package:spacerace/game/SphereCollision.dart';
import 'package:spacerace/game/Vector2D.dart';

import 'GameControler.dart';

class Gem extends GameObject{
  Gem([Vector2D? pos]){
    collision = SphereCollision(this, .25, collected);
    if(pos != null){
      setPosition(pos);
    }
  }

  void collected(){
    //Player score +1
    destroy();
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
              color: Colors.red,
              width: 20,
              height: 20,
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