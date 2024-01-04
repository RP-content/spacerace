import 'package:flutter/material.dart';
import 'package:flutter/services.dart';//used to exit the app
import 'package:spacerace/game/GameControler.dart';
import 'package:spacerace/graphics/Game.dart';//used for accessing the game with button
import 'package:get/get.dart';//Change of language
import 'LooseScreen.dart';
import 'customize_menu.dart';// used for accessing customize menu
import 'About.dart';//About us

///made by Juan Tirado and Edwin Khirsivara
///main menu. Also includes the options menu
///A simple menu that has the buttons necessary to navigate through the different sides of the game
class MainMenu extends StatefulWidget {
  const MainMenu({Key? key}) : super(key: key);


  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  bool isConfiguring = false;
  double musicVolume = 0.5; // Initial volume values
  double soundVolume = 0.5;
  int selectedPlanetIndex = 0;

  // Add your planets assets
  List<String> planetAssets = [
    'assets/images/planets/planet_1.png',
    'assets/images/planets/planet_2.png',
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GameController().looseF = loose;
  }
  void loose(){
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LooseScreen()),);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/mainbackground.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),


          //Title
          Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Center(
                  child: Text('Space Race',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 40,
                        shadows: [
                          Shadow(
                              blurRadius: 20,
                              color: Colors.white,
                              offset: Offset(0, 0)
                          )
                        ]
                    ),

                  ),
                ),
              )
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
                  // level change
                  setState(() {
                    selectedPlanetIndex = (selectedPlanetIndex - 1) % planetAssets.length;
                    GameController().planet = selectedPlanetIndex;
                  });
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
                  //level change
                  setState(() {
                    selectedPlanetIndex = (selectedPlanetIndex + 1) % planetAssets.length;
                    GameController().planet = selectedPlanetIndex;
                  });
                },
              ),
            ),
          ),

          // Planet Image
          Positioned(
            top: MediaQuery.of(context).size.height / 2 - 90,
            left: MediaQuery.of(context).size.width / 2 - 90,
            child: Image.asset(
              planetAssets[selectedPlanetIndex],
              width: 200,
              height: 200,
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GameFrame()),
                  );
                },
                child: Text('startGame'.tr, style: TextStyle(color: Colors.white)),
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
                child: Text('customize'.tr, style: TextStyle(color: Colors.white)),
              ),
            ),
          ),


          // Configuration Buttons
          if (isConfiguring)
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Music Slider
                  Container(
                    width: 200.0,
                    child: Column(
                      children: [
                        Text('music'.tr, style: TextStyle(fontSize: 16.0, color: Colors.white)),
                        Slider(
                          value: musicVolume,
                          onChanged: (value) {
                            setState(() {
                              musicVolume = value;
                              // Update music value
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
                    width: 200.0, // Adjust the width
                    child: Column(
                      children: [
                        Text('sound'.tr, style: TextStyle(fontSize: 16.0, color: Colors.white)),
                        Slider(
                          value: soundVolume,
                          onChanged: (value) {
                            setState(() {
                              soundVolume = value;
                              //update sound value
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

                  ElevatedButton(
                    onPressed: () {
                      // Navigate to CustomizeShip screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AboutUsPage() ),
                      );
                    },
                    child: Text('aboutUs'.tr, style: TextStyle(color: Colors.white)),
                  ),
                  SizedBox(height: 16.0),


                  // Language Button
                  ElevatedButton(
                    onPressed: () {
                      // Open a dialog or menu to select a language
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('language'.tr),
                            content: Column(
                              children: [
                                ListTile(
                                  title: Text('English'),
                                  onTap: () {
                                    var locale = Locale('en', 'US');
                                    Get.updateLocale(locale);
                                  },
                                ),
                                ListTile(
                                  title: Text('Deutsch'),
                                  onTap: () {
                                    var locale = Locale('de', 'DE');
                                    Get.updateLocale(locale);
                                  },
                                ),
                                // Add more languages as needed
                              ],
                            ),
                          );
                        },
                      );
                    },
                    child: Text('language'.tr, style: TextStyle(color: Colors.white)),
                  ),
                  SizedBox(height: 16.0),

                  // Exit Game Button
                  ElevatedButton(
                    onPressed: () {
                      // Handle exit game button action
                      SystemNavigator.pop(); // Exits the app
                    },
                    child: Text('exitGame'.tr, style: TextStyle(color: Colors.white)),
                  ),


                ],
              ),
            ),
        ],
      ),
    );
  }
}