import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:spacerace/game/game.dart';

SpaceRace _spaceRace = SpaceRace();

class GamePlay extends StatelessWidget{
  const GamePlay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){

  /*  return  GameWidget(
        game: _spaceRace,
    );*/
    return WillPopScope(
        onWillPop: () async => false,
        child: GameWidget(
          game: _spaceRace,
        ),
    );


  }



}