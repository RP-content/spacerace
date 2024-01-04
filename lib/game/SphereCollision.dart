
import 'package:spacerace/game/CollisionShape.dart';
import 'package:spacerace/game/Vector2D.dart';

class SphereCollision extends CollisionShape{
  double radius;

  SphereCollision(super.owner,this.radius,[super.function]);

  @override
  Vector2D getNearestPoint(Vector2D point) {
    return owner.position + (point-owner.position).normalized * radius;
  }

  @override
  bool isCollidingWithPoint(Vector2D point) {
    return (point - owner.position).length<radius;
  }
}