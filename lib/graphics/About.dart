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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '- Texturen und loose Screen: Edwin Khirsivara',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '- Hauptmenü, Settings und customization menu: Juan Carlos Tirado Vazquez'
                  '\n   -get package: change of language'
                  '\n   -services package: for exit game button'
                  '\n   ',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '- GameView, Levellogic, EngineStrukturen: Robert Peter',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
