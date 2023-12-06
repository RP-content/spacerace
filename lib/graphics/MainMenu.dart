import 'package:flutter/material.dart';
import 'customize_menu.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  bool isConfiguring = false;
  double musicVolume = 0.5; // Initial volume values (adjust as needed)
  double soundVolume = 0.5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Money Display
          Positioned(
            top: 16.0,
            left: 16.0,
            child: Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Text(
                'Earned: \$100', // Replace with your actual amount
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),

          // Level Change Triangles (Left)
          Positioned(
            top: MediaQuery.of(context).size.height / 2 - 24.0,
            left: 16.0,
            child: IgnorePointer(
              ignoring: isConfiguring,
              child: IconButton(
                icon: Icon(Icons.arrow_left),
                onPressed: () {
                  // Add your level change action here
                },
              ),
            ),
          ),

          // Level Change Triangles (Right)
          Positioned(
            top: MediaQuery.of(context).size.height / 2 - 24.0,
            right: 16.0,
            child: IgnorePointer(
              ignoring: isConfiguring,
              child: IconButton(
                icon: Icon(Icons.arrow_right),
                onPressed: () {
                  // Add your level change action here
                },
              ),
            ),
          ),

          // Configuration Button
          Positioned(
            top: 24.0,
            right: 16.0,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isConfiguring = !isConfiguring;
                });
              },
              child: Icon(
                Icons.settings,
                size: 36.0,
              ),
            ),
          ),

          // Start Game Button
          Positioned(
            bottom: 16.0,
            right: 16.0,
            child: IgnorePointer(
              ignoring: isConfiguring,
              child: ElevatedButton(
                onPressed: () {
                  // Add your start game button action here
                },
                child: Text('Start Game', style: TextStyle(color: Colors.black)),
              ),
            ),
          ),

          // Customize Button
          Positioned(
            bottom: 16.0,
            left: 16.0,
            child: IgnorePointer(
              ignoring: isConfiguring,
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to CustomizeShip screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CustomizeShip()),
                  );
                },
                child: Text('Customize', style: TextStyle(color: Colors.black)),
              ),
            ),
          ),


          // Configuration Buttons (displayed conditionally)
            if (isConfiguring)
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Music Slider
                    Container(
                      width: 200.0, // Adjust the width as needed
                      child: Column(
                        children: [
                          Text('Music', style: TextStyle(fontSize: 16.0, color: Colors.black)),
                          Slider(
                            value: musicVolume,
                            onChanged: (value) {
                              setState(() {
                                musicVolume = value;
                                // Update your music volume based on the 'value'
                              });
                            },
                            min: 0.0,
                            max: 1.0,
                            label: 'Music Volume',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16.0),

                    // Sound Slider
                    Container(
                      width: 200.0, // Adjust the width as needed
                      child: Column(
                        children: [
                          Text('Sound', style: TextStyle(fontSize: 16.0, color: Colors.black)),
                          Slider(
                            value: soundVolume,
                            onChanged: (value) {
                              setState(() {
                                soundVolume = value;
                                // Update your sound volume based on the 'value'
                              });
                            },
                            min: 0.0,
                            max: 1.0,
                            label: 'Sound Volume',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16.0),

                    // Language Button
                    ElevatedButton(
                      onPressed: () {
                        // Handle language button action
                      },
                      child: Text('Language', style: TextStyle(color: Colors.black)),
                    ),
                    SizedBox(height: 16.0),

                    // Exit Game Button
                    ElevatedButton(
                      onPressed: () {
                        // Handle exit game button action
                        SystemNavigator.pop(); // Exits the app
                      },
                        child: Text('Exit Game', style: TextStyle(color: Colors.black)),
                    ),


                  ],
                ),
              ),
        ],
      ),
    );
  }
}
