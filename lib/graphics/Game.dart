import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spacerace/game/GameControler.dart';

class GameFrame extends StatefulWidget {
  const GameFrame({super.key});

  @override
  State<GameFrame> createState() => _GameFrameState();

}

class _GameFrameState extends State<GameFrame> {
  GameControler instance = GameControler.getInstance();
  @override
  void initState() {
    super.initState();
    instance.frameUpdater = this.updateState;
    instance.loadLevel(); //loading Level
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Stack(

          children: List.from(instance.loadedLevel!.objects.map((e) => e.getGraphics())),
        ),
        onTap: () => {
          instance.loadedLevel?.player.touchInput(Offset(0, 0.1))},
        onDoubleTap: () =>{
          instance.loadedLevel?.player.touchInput(Offset(0, -0.1))
        },
        onVerticalDragUpdate: (DragUpdateDetails details) => {
          instance.loadedLevel?.player.touchInput(details.delta/10)},
      ),
    );
  }

  void updateState(){
    setState(() {});
  }
}
