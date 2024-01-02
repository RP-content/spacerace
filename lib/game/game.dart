import 'dart:ui';

import 'package:flame/camera.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/material.dart';
import 'package:spacerace/game/player.dart';
import 'package:flutter/gestures.dart';

int shipSprite = 4;
class SpaceRace extends FlameGame with PanDetector{

  late Player player;
  Offset? _pointerStartPosition;
  Offset? _pointerCurrentPosition;
  final double _joystickRadius = 60;
  final double _deadzoneRadius = 10;


  void setShipDesign(int newSprite) {
    shipSprite = newSprite;
  }

  @override
  Future<void> onLoad() async{
    await images.load('simpleSpace_tilesheet@2.png');

    final spriteSheet = SpriteSheet.fromColumnsAndRows(
        image: images.fromCache('simpleSpace_tilesheet@2.png'),
        columns: 8,
        rows: 6,
    );



    player = Player(
      sprite: spriteSheet.getSpriteById(shipSprite),
      size: Vector2(64,64),
      //angle: -90,
      position: canvasSize/2,
    );


    player.anchor = Anchor.center;

    add(player);

  }

  @override
  void render(Canvas canvas){
    super.render(canvas);

    if(_pointerStartPosition != null){
      canvas.drawCircle(_pointerStartPosition!, _joystickRadius, Paint()..color = Colors.grey.withAlpha(100),
        
      );
    }

    if(_pointerCurrentPosition != null){
      var delta = _pointerCurrentPosition! - _pointerStartPosition!;
      if(delta.distance >_joystickRadius){
        delta = _pointerStartPosition! +
            (Vector2(delta.dx, delta.dy).normalized()*_joystickRadius).toOffset();
      } else{
        delta = _pointerCurrentPosition!;
      }
      canvas.drawCircle(delta, 20, Paint()..color = Colors.white.withAlpha(100),

      );
    }
  }

  @override
  void onPanStart(DragStartInfo info) {
  }
  @override
  void onPanUpdate(DragUpdateInfo info) {

  }
  @override
  void onPanEnd(DragEndInfo info) {}
  @override
  void onPanCancel() {}


  @override
  void handlePanStart(DragStartDetails details) {
    _pointerStartPosition = details.globalPosition;
    _pointerCurrentPosition = details.globalPosition;
    onPanStart(DragStartInfo.fromDetails(this, details));
  }
  @override
  void handlePanUpdate(DragUpdateDetails details) {
    _pointerCurrentPosition = details.globalPosition;

    var delta = _pointerCurrentPosition! - _pointerStartPosition!;
    if(delta.distance >_deadzoneRadius){
      player.setMoveDirection(Vector2(delta.dx, delta.dy));
    }else{
      player.setMoveDirection(Vector2.zero());
    }


    onPanUpdate(DragUpdateInfo.fromDetails(this, details));
  }
  @override
  void handlePanEnd(DragEndDetails details) {
    _pointerStartPosition = null;
    _pointerCurrentPosition = null;
    player.setMoveDirection(Vector2.zero());
    onPanEnd(DragEndInfo.fromDetails(details));
  }
}