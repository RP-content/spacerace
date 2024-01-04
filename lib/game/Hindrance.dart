import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spacerace/game/GameObject.dart';

import 'GameControler.dart';
import 'SphereCollision.dart';
import 'Vector2D.dart';


/// author: Robert Peter
///object that slows the player down.
class Hindrance extends GameObject{

  ///Texturen erstellt von Edwin Khirsivara
  ///Texturen für Sand
  List<String> variant1 = [
    'assets/images/largeObjects/dune1_1.png',
    'assets/images/largeObjects/dune2_1.png',
    'assets/images/largeObjects/dune3_1.png',
    'assets/images/largeObjects/dune4_1.png',
  ];
  ///Texturen erstellt von Edwin Khirsivara
  /// Texturen für Wald
  List<String> variant2 =[
    'assets/images/middleObjects/bush1_2.png',
    'assets/images/middleObjects/bush2_2.png',
    'assets/images/smallObjects/grass2_2.png',
    'assets/images/smallObjects/grass1_2.png',
  ];

  late List<String> variant;
  late int selected;
  double size;

  Hindrance(this.size,[Vector2D? pos]){
    //Auswahl der Texturen nach gewähltem Level
    switch(GameController().planet){
      case 0:
        variant = variant1;
        size = size *1.5;
      case 1:
        variant = variant2;
        size = size *0.6;
    }

    //zufällige Textur
    selected = Random().nextInt(variant.length);

    collision = SphereCollision(this, size*0.3,onCollision);

    if(pos != null){
      setPosition(pos);
    }
  }

  //Methode für Kollision
  void onCollision() {
    GameController().loadedLevel?.player.slow = true;
  }



  ///Visuelle repräsentation des Objektes
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

  @override
  void end() {
    // TODO: implement end
  }
}