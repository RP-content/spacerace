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
    super.setState(fn);
    list = List.from(instance.loadedLevel!.objects.map((e) => e.getGraphics()));
    list.add(GameController().loadedLevel!.player.getGraphics());
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
      backgroundColor: (GameController().planet == 0) ? Color(0xFFFDF315): Color(
          0xFF46B053),
      body: GestureDetector(
        child: Container(
          color: Colors.transparent,

          child: Stack(
            children: list,
          ),
        ),
        onVerticalDragUpdate: (DragUpdateDetails details) => {
          instance.loadedLevel?.player.touchInput(details.delta/instance.loadedLevel!.inputFactor)},
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    GameController().backToMenu(false);
  }
  void updateState(){
    setState(() {});
  }
}
