import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int temperature = 0;
  String location = 'Jakarta';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/clear.png"),
              fit: BoxFit.cover
          )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Center(
                  child: Text(temperature.toString() + 'ºC',
                    style: TextStyle(
                      fontSize: 60,
                      color: Colors.white,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    location,
                    style: TextStyle(fontSize: 40, color: Colors.white),
                  ),
                )
              ],
            ),
            Column(
              children: [
                Container(
                  child: TextField(
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                    ),
                    decoration: InputDecoration(
                      hintText: "Search the Another Location...",
                      hintStyle: TextStyle(color: Colors.white, fontSize: 16.0)
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
