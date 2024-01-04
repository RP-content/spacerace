import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '- Texturen und loose Screen: Edwin Khirsivara'
                    '\n',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '- Hauptmenü, Settings und customization menu: Juan Carlos Tirado Vazquez'
                    '\n   --get package: change of language'
                    '\n   --services package: for exit game button'
                    '\n   --material package: the classic Flutter package'
                    '\n   --expanded used in customize_menu to accommodate the two columns(fire and ship types) and the center image'
                    '\n   --Image.asset to use the png files in game'
                    '\n   --ListView to create a scrollable list of spaceships and fire types'
                    '\n   --Positioned to position on the desired place the buttons in mainMenu'
                    '\n   --IgnorePointer to disable main buttons while settings are showing'
                    '\n   --AlertDialog to be able to choose a language'
                    '\n',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '- GameView, Levellogic, EngineStrukturen: Robert Peter',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
