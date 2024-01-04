import 'dart:math';
import 'package:flutter/material.dart';
import 'package:spacerace/game/Gem.dart';
import 'package:spacerace/game/Hindrance.dart';
import 'package:spacerace/game/Obstacle.dart';
import 'package:spacerace/game/Player.dart';
import 'package:spacerace/game/Vector2D.dart';
import 'GameObject.dart';

/// author: Robert Peter
/// Logisches Level mit allen Objekten und Funktionen
class Level{
  //Objekte im Level
  List<GameObject> objects = [];
  //Objekte die gelöscht werden sollen
  List<GameObject> removing = [];
  //Referenz zum Spieler
  late Player player;
  //höhe der dargestellten Szene in Game Koordinaten
  double height = 10;
  double get widths {
    Size s = MediaQueryData.fromView(WidgetsBinding.instance.window).size;
    return height*s.aspectRatio;
  }

  double get inputFactor {
    return MediaQueryData.fromView(WidgetsBinding.instance.window).size.height/height;
  }

  //verschiebung der oberen linken Ecke der Kamera in Game Koordinaten
  Vector2D offset = Vector2D(0, 0);

  Level(){
    player = Player();
    player.start();
    print("width:$widths, height:$height");
  }

  Random rand = Random();
  double movement = 0;
  ///Updates der Objekte und Spawnverhalten
  void update(double delta){
    player.update(delta);
    //verhindern, dass der Spieler den Bildschirm verlässt
    if(player.getY()<0){
      player.setY(0);
    }else if(player.getY()>10){
      player.setY(10);
    }
    //Kamera horizontal zentriert auf Spieler
    offset = Vector2D(player.getX()-widths *0.4, 0);

    for (var element in objects) {
      element.update(delta);
      //löschen von Objekten, die den linken Rand verlassen
      if(element.getX()+4<offset.getX()){
        removeObject(element);
        print("$element removed because of Position");
      }
    }
    //Löschen aller markierten Objekte
    for (var element in removing) {
      element.end();
      objects.remove(element);
    }
    removing.clear();

    //Spawn Code
    if(movement > 2){
      movement-=2;
      for(int i = 0; i<2;i++){
        //25% chance auf Ärgernisse
        if(rand.nextInt(100)<25){
          addObject(Hindrance(rand.nextDouble()*3+2,Vector2D(player.getX()+20+(rand.nextDouble()-.5), rand.nextDouble()+rand.nextInt(10))));
        }
      }
      for(int i = 0; i<1;i++){
        //20% Chance auf Hindernisse
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

  /// umrechnung einer Position aus Game Koordinaten zu der linken oberen Ecke in Flutter Koordinaten
  Vector2D posInLogic(Vector2D pos, double size){
    Vector2D posreltopleft = pos-offset;
    Size s = MediaQueryData.fromView(WidgetsBinding.instance.window).size;
    return Vector2D((posreltopleft.getX()-size*.5)/widths*s.width,(posreltopleft.getY()-size*.5)/height*s.height);
  }

  ///Berechnung der Position auf dem Fenster von -1 bis 1 auf X und Y Koordinaten
  Alignment getAlignmentFromPosition(double x, double y){
    return Alignment(((x-offset.getX())/widths*2)-1, ((y-offset.getY())/height*2)-1);
  }


  double getLogicUnitFromPosition(double d){
    return d * inputFactor;
  }
}