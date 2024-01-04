
import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:spacerace/game/Gem.dart';
import 'package:spacerace/game/Hindrance.dart';
import 'package:spacerace/game/Obstacle.dart';
import 'package:spacerace/game/Player.dart';
import 'package:spacerace/game/Vector2D.dart';

import 'GameObject.dart';

class Level{
  List<GameObject> objects = [];
  List<GameObject> removing = [];
  late Player player;
  double height = 10;
  double get widths {
    Size s = MediaQueryData.fromView(WidgetsBinding.instance.window).size;
    return height*s.aspectRatio;
  }
  double get inputFactor {//return MediaQueryData.fromView(WidgetsBinding.instance.window).devicePixelRatio;
    return MediaQueryData.fromView(WidgetsBinding.instance.window).size.height/height;
  }

  Vector2D offset = Vector2D(0, 0);

  Level(){
    player = Player();
    //addObject(player);
    player.start();
    print("width:$widths, height:$height");
  }

  Random rand = Random();
  double movement = 0;

  void update(double delta){
    player.update(delta);
    if(player.getY()<0){
      player.setY(0);
    }else if(player.getY()>10){
      player.setY(10);
    }
    offset = Vector2D(player.getX()-widths *0.4, 0);

    for (var element in objects) {
      element.update(delta);
      if(element.getX()+4<offset.getX()){
        removeObject(element);
        print("$element removed because of Position");
      }
    }
    for (var element in removing) {
      element.end();
      objects.remove(element);
    }
    removing.clear();

    if(movement > 2){
      print("spawn objects");
      movement-=2;
      for(int i = 0; i<2;i++){
        if(rand.nextInt(100)<25){
          addObject(Hindrance(rand.nextDouble()*3+2,Vector2D(player.getX()+20+(rand.nextDouble()-.5), rand.nextDouble()+rand.nextInt(10))));
        }
      }
      for(int i = 0; i<1;i++){
        if(rand.nextInt(100)<20){
          addObject(Obstacle(rand.nextDouble()*3+1.5,Vector2D(player.getX()+20+rand.nextDouble()-.5, rand.nextDouble()+rand.nextInt(10))));
        }
      }
      addObject(Gem(Vector2D(player.getX()+20, rand.nextDouble()*10)));
    }
  }

  void addObject(GameObject g){
    objects.add(g);
    g.start();
  }

  void removeObject(GameObject g){
    removing.add(g);
  }
  
  Alignment getAlignmentFromPosition(double x, double y){
    return Alignment(((x-offset.getX())/widths*2)-1, ((y-offset.getY())/height*2)-1);
  }

  double getLogicUnitFromPosition(double d){
    return d * inputFactor;
  }
}