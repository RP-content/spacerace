import 'package:spacerace/game/GameObject.dart';
import 'package:spacerace/game/Vector2D.dart';

abstract class MovableObject extends GameObject{
  late double speed;
  late Vector2D direction;


}