import 'package:spacerace/game/Vector2D.dart';
import 'GameObject.dart';

/// author: Robert Peter
/// interface für mögliche Kollisionsformen
abstract class CollisionShape{
  //Objekt, dass zu der Shape gehört
  late GameObject owner;
  //optionale Funktion, die bei Kollision aufgerufen wird
  Function? function;

  //Konstruktor
  CollisionShape(this.owner,[this.function]);

  ///Methoden, die überschrieben werden müssen
  Vector2D getNearestPoint(Vector2D point);
  bool isCollidingWithPoint(Vector2D point);

  ///simple Methode zum Prüfen der kollision
  bool isColliding(CollisionShape other){
    //keine Selbstkollision
    if(other == this){
      return false;
    }
    bool b = isCollidingWithPoint(other.getNearestPoint(owner.position));
    if(b){
      function?.call();
      other.function?.call();
    }
    return b;
  }

}