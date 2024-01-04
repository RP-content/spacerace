import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spacerace/game/GameObject.dart';

import 'GameControler.dart';
import 'SphereCollision.dart';
import 'Vector2D.dart';

class Hindrance extends GameObject{
  List<String> variants = [
    'assets/images/dune1_1.png',
  ];
  late int selected;
  double size;
  Hindrance(this.size,[Vector2D? pos]){
    selected = Random(85).nextInt(variants.length);
    collision = SphereCollision(this, size*0.4,collected);
    if(pos != null){
      setPosition(pos);
    }
  }

  void collected() {
    GameController().loadedLevel?.player.slow = true;
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
            alignment: GameController().loadedLevel?.getAlignmentFromPosition(getX(), getY()),
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