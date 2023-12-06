import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomizeShip extends StatefulWidget {
  const CustomizeShip({Key? key}) : super(key: key);

  @override
  _CustomizeShipState createState() => _CustomizeShipState();
}

class _CustomizeShipState extends State<CustomizeShip> {
  int selectedFireType = 0;
  int selectedShipDesign = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                        Text('fireTypes'.tr, style: TextStyle(fontSize: 16.0, color: Colors.black)),
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
                        Text('shipDesigns'.tr, style: TextStyle(fontSize: 16.0, color: Colors.black)),
                        // Add your ship designs selection widgets here
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Padding for Back to Main Menu Button (Bottom Center)
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Return to the main menu
              },
              child: Text('backToMenu'.tr, style: TextStyle(color: Colors.black)),
            ),
          ),
        ],
      ),
    );
  }
}
