import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:spacerace/game/GameControler.dart';
import 'package:spacerace/game/GameObject.dart';
import 'package:spacerace/game/MovableObject.dart';
import 'package:spacerace/game/SphereCollision.dart';
import 'package:spacerace/game/Vector2D.dart';
import 'package:flame/particles.dart';
import 'package:flame/components.dart';

class Player extends MoveableObject {
  double speed = 1.5;
  bool slow = false;
  double size = 2.0;
  static int spaceSelection = 4;
  static String spaceType = 'assets/images/ships/ship_E.png';

  static void exampleImp(int tryda) {
    spaceSelection = tryda;
    switch (spaceSelection) {
      case 0:
        spaceType = 'assets/images/ships/ship_A.png';

      case 1:
        spaceType = 'assets/images/ships/ship_B.png';


      case 2:
        spaceType = 'assets/images/ships/ship_C.png';


      case 3:
        spaceType = 'assets/images/ships/ship_D.png';


      case 4:
        spaceType = 'assets/images/ships/ship_E.png';


      case 5:
        spaceType = 'assets/images/ships/ship_F.png';

      default:
        print('Error changing space asset');
    }
    print(tryda);
  }

  Player() {
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
    if(slow){
    move(Vector2D(getX() + delta * speed*.3, getY()));
    }else{
      move(Vector2D(getX() + delta * speed, getY()));
    }
    slow = false;
    GameController().loadedLevel?.objects.forEach((element) {
      if (!GameController().loadedLevel!.removing.contains(element)) {
        element.collision?.isColliding(collision!);
      }
    });
  }

  void touchInput(Offset offset) {
    if(slow){
      move(Vector2D(getX(), offset.dy*.1 + getY()));
    }else{
      move(Vector2D(getX(), offset.dy + getY()));
    }

  }

  @override
  Widget getGraphics() {
    return Positioned.fill(
      child: Container(
        //0xAARRGGBB
        color: Colors.transparent,
        alignment: GameController().loadedLevel?.getAlignmentFromPosition(
            getX(), getY()),
        child: Transform.rotate(
            angle: 90 * 3.141592653589793 / 180,
            // Rotate 90 degrees (in radians)
            child: Container(
              //color: Colors.cyan,
              width:
              GameController().loadedLevel?.getLogicUnitFromPosition(size),
              height:
              GameController().loadedLevel?.getLogicUnitFromPosition(size),
              child: FittedBox(
                fit: BoxFit.fill,
                child: Image.asset(
                  spaceType,
                ),
              ),
            )
        ),
      ),
    );

  }

}