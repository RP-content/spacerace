import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

            Flexible(
              child: Center(
                child: Text('GAME OVER'.tr, style: TextStyle(fontSize: 30.0, color: Colors.white))
              ),
            ),

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
