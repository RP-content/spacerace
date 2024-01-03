
import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:spacerace/game/Gem.dart';
import 'package:spacerace/game/Player.dart';
import 'package:spacerace/game/Vector2D.dart';

import 'GameObject.dart';

class Level{
  List<GameObject> objects = [];
  late Player player;
  double height = 10;
  double get widths {return height*MediaQueryData.fromView(WidgetsBinding.instance.window).devicePixelRatio;}
  double get inputFactor {return MediaQueryData.fromView(WidgetsBinding.instance.window).size.height/height;}

  Vector2D offset = Vector2D(0, 0);

  Level(){
    player = Player();
    addObject(player);
    player.start();
  }

  double time = 0;
  void update(double delta){
    objects.forEach((element) {element.update(delta);});
    player.update(delta);
    offset = Vector2D(player.getX()-widths *0.4, 0);

    time += delta;
    if(time > 1){
      time--;
      addObject(Gem(offset+Vector2D(widths, height/2)));
    }
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
    return Alignment(((x-offset.getX())/widths*2)-1, ((y-offset.getY())/height*2)-1);
  }

}