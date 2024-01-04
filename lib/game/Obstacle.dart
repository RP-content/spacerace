import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:spacerace/game/GameObject.dart';
import 'package:spacerace/game/SphereCollision.dart';

import 'GameControler.dart';
import 'Vector2D.dart';

class Obstacle extends GameObject {
  List<String> variants = [
    'assets/images/smallObjects/stone1_1.png',
    'assets/images/smallObjects/stone2_1.png',
    'assets/images/smallObjects/stone3_1.png',
    'assets/images/smallObjects/stone4_1.png',
    'assets/images/middleObjects/cactus1_1.png',
    'assets/images/middleObjects/cactus2_1.png',
  ];
  late int selected;
  double size;
  Obstacle(this.size,[Vector2D? pos]){
    selected = Random().nextInt(variants.length);
    collision = SphereCollision(this, size*0.4, collected);
    if(pos != null){
      setPosition(pos);
    }
  }
  void collected() {

  }

  @override
  void end() {
    // TODO: implement end
  }

  @override
  Widget getGraphics() {
    Vector2D pos = GameController().loadedLevel!.posInLogic(position, size);
    return Positioned(
      left: pos.getX(),
      top: pos.getY(),
      child: Container(
        //color: Colors.cyan,
        width:
        GameController().loadedLevel?.getLogicUnitFromPosition(size),
        height:
        GameController().loadedLevel?.getLogicUnitFromPosition(size),
        child: FittedBox(
          fit: BoxFit.fill,
          child: Image.asset(
            variants[selected],
          ),
        ),
      )
    );
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