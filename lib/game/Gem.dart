import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spacerace/game/GameObject.dart';
import 'package:spacerace/game/SphereCollision.dart';
import 'package:spacerace/game/Vector2D.dart';
import 'GameControler.dart';

/// author: Robert Peter
/// Edelsteine, die für Punkte gesammelt werden können
class Gem extends GameObject {
  double size = .8;

  Gem([Vector2D? pos]) {
    collision = SphereCollision(this, size / 2, collected);
    if (pos != null) {
      setPosition(pos);
    }
  }

  void collected() {
    GameController().score++;
    //print("collected !!");
    destroy();
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
        width: GameController().loadedLevel?.getLogicUnitFromPosition(size),
        height: GameController().loadedLevel?.getLogicUnitFromPosition(size),
        child: FittedBox(
          fit: BoxFit.fill,
          ///Texturen erstellt von Edwin Khirsivara
          child: Image.asset('assets/images/diamond.png',),
        ),
      )
    );

    //vorherige positionierung über Alignment
    /*return Positioned.fill(
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
                    'assets/images/diamond.png',
                ),
              ),
            )));*/
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
