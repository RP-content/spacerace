import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spacerace/game/GameControler.dart';

class GameFrame extends StatefulWidget {
  const GameFrame({super.key});

  @override
  State<GameFrame> createState() => _GameFrameState();

}

class _GameFrameState extends State<GameFrame> {
  GameController instance = GameController();
  List<Widget> list = [];

  @override
  void setState(VoidCallback fn) {
    list = List.from(instance.loadedLevel!.objects.map((e) => e.getGraphics()));
    list.add(GameController().loadedLevel!.player.getGraphics());
    super.setState(fn);
  }

  @override
  void initState() {
    super.initState();
    instance.frameUpdater = this.updateState;
    instance.loadLevel(); //loading Level
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        forceMaterialTransparency: true,
        //backgroundColor: Colors.amber,
        foregroundColor: Colors.black,
        //toolbarHeight: 50,
        title: Text(
            "Score: ${GameController().score}",
        ),
      ),
      backgroundColor: Color(0xFFFDF413),
      body: GestureDetector(
        child: Stack(
          children: list,
        ),
        onVerticalDragUpdate: (DragUpdateDetails details) => {
          instance.loadedLevel?.player.touchInput(details.delta/instance.loadedLevel!.inputFactor)},
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    GameController().backToMenu();
    super.dispose();
  }
  void updateState(){
    setState(() {});
  }
}
