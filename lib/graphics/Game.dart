import 'package:flutter/material.dart';
import 'package:spacerace/game/GameControler.dart';

/// author: Robert Peter
class GameFrame extends StatefulWidget {
  const GameFrame({super.key});

  @override
  State<GameFrame> createState() => _GameFrameState();

}
/// author: Robert Peter
/// Widget, dass das Level rendert
class _GameFrameState extends State<GameFrame> {
  GameController instance = GameController();
  List<Widget> list = [];

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
    //erzeugen einer Listeit allen Widgets, die die GameObjects repräsentieren
    list = List.from(instance.loadedLevel!.objects.map((e) => e.getGraphics()));
    //hinzufügen des Spielers als letztes, damit er im Vordergrund angezeigt wird
    list.add(GameController().loadedLevel!.player.getGraphics());
  }

  @override
  void initState() {
    super.initState();
    //Referenz um Frameupdates auszulösen
    instance.frameUpdater = updateState;
    instance.loadLevel(); //loading Level
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        forceMaterialTransparency: true,
        foregroundColor: Colors.black,
        title: Text("Score: ${GameController().score}",
        ),
      ),
      backgroundColor: (GameController().planet == 0) ? const Color(0xFFFDF315): const Color(0xFF46B053),
      body: GestureDetector(
        child: Container(
          color: Colors.transparent,
          child: Stack(
            children: list,
          ),
        ),
        onVerticalDragUpdate: (DragUpdateDetails details) => {
          //bewegen des Spielers
          instance.loadedLevel?.player.touchInput(details.delta/instance.loadedLevel!.inputFactor)},
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    //stoppen der updates
    GameController().backToMenu(false);
  }

  void updateState(){
    setState(() {});
  }
}
