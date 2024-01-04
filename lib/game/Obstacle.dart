import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spacerace/game/GameObject.dart';
import 'package:spacerace/game/SphereCollision.dart';

import 'GameControler.dart';
import 'Vector2D.dart';
/// author: Robert Peter
/// ähnlich zu Hindrance
/// Objekte die bei Berührung das aktuelle Level beenden
class Obstacle extends GameObject {

  ///Texturen erstellt von Edwin Khirsivara
  List<String> variant1 = [
    'assets/images/smallObjects/stone1_1.png',
    'assets/images/smallObjects/stone2_1.png',
    'assets/images/smallObjects/stone3_1.png',
    'assets/images/smallObjects/stone4_1.png',
    'assets/images/middleObjects/cactus1_1.png',
    'assets/images/middleObjects/cactus2_1.png',
  ];
  ///Texturen erstellt von Edwin Khirsivara
  List<String> variant2 = [
    'assets/images/largeObjects/tree1_2.png',
    'assets/images/largeObjects/tree2_2.png',
  ];
  late List<String> variant;
  late int selected;
  double size;

  Obstacle(this.size,[Vector2D? pos]){
    switch(GameController().planet){
      case 0:
        variant = variant1;
      case 1:
        variant = variant2;
        size = size *1.5;
    }
    selected = Random().nextInt(variant.length);
    collision = SphereCollision(this, size*0.3, collided);
    if(pos != null){
      setPosition(pos);
    }
  }
  void collided() {
    GameController().backToMenu(true);
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
      child: SizedBox(
        width:
        GameController().loadedLevel?.getLogicUnitFromPosition(size),
        height:
        GameController().loadedLevel?.getLogicUnitFromPosition(size),
        child: FittedBox(
          fit: BoxFit.fill,
          child: Image.asset(
            variant[selected],
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