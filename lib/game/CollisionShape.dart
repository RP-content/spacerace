
import 'package:spacerace/game/Vector2D.dart';
import 'GameObject.dart';

abstract class CollisionShape{
  //Objekt which owns this CollisionShape
  late GameObject owner;
  Function? function;
  //Konstruktor
  CollisionShape(this.owner,[this.function]);

  //Methods to override
  Vector2D getNearestPoint(Vector2D point);
  bool isCollidingWithPoint(Vector2D point);

  bool isColliding(CollisionShape other){
    bool b = isCollidingWithPoint(other.getNearestPoint(owner.position));
    if(b){
      function?.call();
      other.function?.call();
    }
    return b;
  }

}