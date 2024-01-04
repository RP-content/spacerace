import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spacerace/game/Player.dart';

class CustomizeShip extends StatefulWidget {
  const CustomizeShip({Key? key}) : super(key: key);

  @override
  _CustomizeShipState createState() => _CustomizeShipState();
}

class _CustomizeShipState extends State<CustomizeShip> {

  int selectedFireType = 0;
  static int selectedShipDesign = 0;


  // List of ship design images
  List<String> shipDesigns = [
    'assets/images/ships/ship_A.png',
    'assets/images/ships/ship_B.png',
    'assets/images/ships/ship_C.png',
    'assets/images/ships/ship_D.png',
    'assets/images/ships/ship_E.png',
    'assets/images/ships/ship_F.png',
  ];



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

            // Earned Container (Top Center)
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Text(
                'earned'.tr, // Replace with your actual amount
                style: TextStyle(color: Colors.white),
              ),
            ),

            // Center Section
            Expanded(
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Fire Type Column (Left)
                    Container(
                      width: 120.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('fireTypes'.tr, style: TextStyle(fontSize: 16.0, color: Colors.white)),
                          // Add your fire types selection widgets here
                        ],
                      ),
                    ),

                    // Ship Design Column (Right)
                    Container(
                      width: 120.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('shipDesigns'.tr, style: TextStyle(fontSize: 16.0, color: Colors.white)),
                          // Add your ship designs selection widgets here
                          Expanded(
                            child: ListView.builder(
                              itemCount: shipDesigns.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedShipDesign = index;
                                      Player.exampleImp(selectedShipDesign);
                                      print(index);
                                    });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.asset(
                                      shipDesigns[index],
                                      width: 80,
                                      height: 80,
                                      color: selectedShipDesign == index ? Colors.blue : null,
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Selected Ship Display
         /*   Container(
              alignment: Alignment.center,
              child: Image.asset(
                shipDesigns[selectedShipDesign],
                width: 120,
                height: 120,
              ),
            ), */
            // Padding for Back to Main Menu Button (Bottom Center)
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Return to the main menu
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
