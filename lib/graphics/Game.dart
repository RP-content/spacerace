import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spacerace/game/GameControler.dart';

class GameFrame extends StatefulWidget {
  const GameFrame({super.key});

  @override
  State<GameFrame> createState() => _GameFrameState();
}

class _GameFrameState extends State<GameFrame> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Container(

        ),
        onVerticalDragUpdate: (DragUpdateDetails details) => {
          GameControler.getInstance().loadedLevel?.player.touchInput(details.delta)},
      ),
    );
  }
}
