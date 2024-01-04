import 'package:flutter/material.dart';
import 'package:get/get.dart';

///made by Edwin Khirsivara
///screen that pops up when the player collides with an obstacle.
///from there the player can go back to the main menu.

class LooseScreen extends StatefulWidget {
  const LooseScreen({Key? key}) : super(key: key);

  @override
  _LooseScreenState createState() => _LooseScreenState();
}

class _LooseScreenState extends State<LooseScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/mainbackground.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //Centered text "GAME OVER"
            Flexible(
              child: Center(
                child: Text('GAME OVER'.tr, style: TextStyle(fontSize: 30.0, color: Colors.white))
              ),
            ),

            //Button that brings back to the main menu.
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).popUntil((route) => route.isFirst);
                },
                child: Text('backToMenu'.tr, style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
