import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spacerace/graphics/game_play.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'customize_menu.dart';


class MainMenu extends StatefulWidget {
  const MainMenu({Key? key}) : super(key: key);


  @override
  _MainMenuState createState() => _MainMenuState();
}


class _MainMenuState extends State<MainMenu> {
  bool isConfiguring = false;
  late double musicVolume = 0.5; // Initial volume
  late double soundVolume = 0.5;
  late Map<String, Object> data ={};
  late int money = 0;

  void loadData() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      musicVolume = prefs.getDouble('musicVolume') ?? 0.5;
      soundVolume = prefs.getDouble('soundVolume') ?? 0.5;
      money = prefs.getInt('money') ?? 0;

      var dataString = prefs.getString('data');
      data = dataString != null ? Map<String,Object>.from(jsonDecode(dataString)): {};

    });
  }
  @override
  void initState() {
    loadData();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

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
                'earned'.tr + '$money', // Replace with your actual amount
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
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) =>  const GamePlay(),
                    ),
                  );
                },
                child: Text('startGame'.tr,style: TextStyle(color: Colors.white)),
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
                        Text('music'.tr, style: TextStyle(fontSize: 16.0, color: Colors.white)),
                        Slider(
                          value: musicVolume,
                          onChanged: (value) {
                            setState(() {
                              musicVolume = value;
                              updateMV(musicVolume);
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
                        Text('sound'.tr, style: TextStyle(fontSize: 16.0, color: Colors.white)),
                        Slider(
                          value: soundVolume,
                          onChanged: (value) {
                            setState(() {
                              soundVolume = value;
                              updateSV(value);
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

  void updateMV(double value) async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setDouble('musicVolume', value);
    });
  }

  void updateSV(double value) async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setDouble('soundVolume', value);

    });
  }

  void updateData() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final updatedData = {
      'musicVolume': musicVolume,
      'soundVolume': soundVolume,
      'money': money,
    };

    if(!mapEquals(data, updatedData)) {
      setState(() {
        data = updatedData;
      });

      prefs.setString('data', jsonEncode(data));

    }

  }
}