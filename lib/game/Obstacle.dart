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
    'assets/images/stone1_1.png',
    'assets/images/cactus1_1.png',
  ];
  late int selected;
  double size;
  Obstacle(this.size,[Vector2D? pos]){
    selected = Random(85).nextInt(variants.length);
    collision = SphereCollision(this, size*0.4, collected);
    if(pos != null){
      setPosition(pos);
    }
  }
  void collected() {
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
            alignment: GameController()
                .loadedLevel
                ?.getAlignmentFromPosition(getX(), getY()),
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