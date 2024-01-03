import 'dart:ffi';
import 'dart:ui';
import 'dart:math';


import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/particles.dart';
import 'package:flutter/material.dart';
import 'package:flame/experimental.dart';
import 'package:flutter/services.dart';

import 'game.dart';



class Player extends SpriteComponent with HasGameReference<SpaceRace>{

  Vector2 _moveDirection = Vector2.zero();
  //Move speed of player
  double _speed = 300;

  // Holds an object of Random class to generate random numbers.
  final _random = Random();


  // This method generates a random vector such that
  // its x component lies between [-100 to 100] and
  // y component lies between [200, 400]
  Vector2 getRandomVector() {
    return (Vector2.random(_random) - Vector2(0.5, -1)) * 200;
  }


  Player({
    Sprite? sprite,
    Vector2? position,
    Vector2? size,
    //int? angle,
  }) : super(sprite: sprite, position: position, size: size, /*angle: angle*/);

  @override
  void update(double dt) {
    super.update(dt);

    this.position += _moveDirection.normalized() * _speed * dt;

    // Adds thruster particles.
    final particleComponent = ParticleSystemComponent(
      particle: Particle.generate(
        count: 10,
        lifespan: 0.1,
        generator: (i) => AcceleratedParticle(
          acceleration: getRandomVector(),
          speed: getRandomVector(),
          //position: (position.clone() + Vector2(0, size.y / 3)),
          position: Vector2(32, 45),
          child: CircleParticle(
            radius: 1,
            paint: Paint()..color = Colors.white,
          ),
        ),
      ),
    );

    game.player.add(particleComponent);

  }



  void setMoveDirection(Vector2 newMoveDirection){
    _moveDirection = newMoveDirection;
  }


}