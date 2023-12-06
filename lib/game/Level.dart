
import 'package:spacerace/game/Player.dart';

import 'GameObject.dart';

class Level{
  List<GameObject> objects = [];
  Player player = Player();

  void update(double delta){
    objects.forEach((element) {element.update(delta);});
    player.update(delta);
  }

  void addObject(GameObject g){
    objects.add(g);
    g.start();
  }

  void removeObject(GameObject g){
    g.end();
    objects.remove(g);
  }

}