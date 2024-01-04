import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:spacerace/game/GameControler.dart';
import 'package:spacerace/game/GameObject.dart';
import 'package:spacerace/game/MovableObject.dart';
import 'package:spacerace/game/SphereCollision.dart';
import 'package:spacerace/game/Vector2D.dart';


/// author: Robert Peter
/// repräsentation des Spielers
class Player extends MoveableObject {
  double speed = 2.5;
  bool slow = false;
  double size = 2.0;

  static String spaceType = 'assets/images/ships/ship_A.png';
  static String fireType = 'assets/images/ships/effect_purple.png';


  //method by juan tirado
  static void getShip(String ship){
    spaceType = ship;
  }
  //method by juan tirado
  static void getFire(String fire){
    fireType = fire;
  }

  Player() {
    // Kollisions Shape mit angepasstem Radius
    collision = SphereCollision(this, size * 0.3);
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
    //Bewegung nach vorne
    if(slow){
    move(Vector2D(delta * speed*.3, 0));
    }else{
      move(Vector2D(delta * speed, 0));
    }
    //slow wird deaktiviert
    //falls immer noch Kontakt vorhanden ist, wird der slow bei der Kollisionsprüfung wieder aktiviert
    slow = false;
    //in diesem Falle können Objekte nur mit dem Spieler kollidieren, andernfalls wäre die Prüfung im Level
    GameController().loadedLevel?.objects.forEach((element) {
      if (!GameController().loadedLevel!.removing.contains(element)) {
        element.collision?.isColliding(collision!);
      }
    });
  }

  ///aufgerufen vom GestureDetector
  void touchInput(Offset offset) {
    if(slow){
      move(Vector2D(0, offset.dy*.1));
    }else{
      move(Vector2D(0, offset.dy));
    }
  }

  ///Prinzip von Robert Peter
  ///Integration der customisation options von Juan Tirado
  @override
  Widget getGraphics() {
    Vector2D pos = GameController().loadedLevel!.posInLogic(position, size);
    return Positioned(
      left: pos.getX(),
      top: pos.getY(),
      child: Stack(
        children: [
        Positioned(
          top: 18, // Adjust the position of the fire relative to the ship
          left: -5, // Adjust the position of the fire relative to the ship
          child: Transform.rotate(
            angle: 90 * 3.141592653589793 / 180,
            child: Container(
              width: GameController()
                  .loadedLevel
                  ?.getLogicUnitFromPosition(1), // Set fireSize accordingly
              height: GameController()
                  .loadedLevel
                  ?.getLogicUnitFromPosition(1), // Set fireSize accordingly
              child: FittedBox(
                fit: BoxFit.fill,
                child: Image.asset(
                  fireType, // Replace with the actual path to your fire asset
                ),
              ),
            ),
          ),
        ),
        Transform.rotate(
          angle: 90 * 3.141592653589793 / 180,
          child: Container(
            width: GameController()
                .loadedLevel
                ?.getLogicUnitFromPosition(size),
            height: GameController()
                .loadedLevel
                ?.getLogicUnitFromPosition(size),
            child: FittedBox(
              fit: BoxFit.fill,
              child: Image.asset(
                spaceType, // Replace with the actual path to your ship asset
              ),
            ),
          ),
        ),
        ],
      ),
    );
  }

}
