
import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:spacerace/game/Player.dart';
import 'package:spacerace/game/Vector2D.dart';

import 'GameObject.dart';

class Level{
  List<GameObject> objects = [];
  Player player = Player();
  double heights = 10;
  double get widths {return heights*MediaQueryData.fromView(WidgetsBinding.instance.window).devicePixelRatio;}
  Vector2D offset = Vector2D(0, 0);

  Level(){
    player = Player();
    addObject(player);

  }
  void update(double delta){
    objects.forEach((element) {element.update(delta);});
    player.update(delta);
  }

  void addObject(GameObject g){
    objects.add(g);
    g.start();
  }

  void removeObject(GameObject g){
    g.end();
    objects.remove(g);
  }
  
  Alignment getAlignmentFromPosition(double x, double y){
    return Alignment(((x-offset.getX())/widths*2)-1, ((y-offset.getY())/heights*2)-1);
  }

}