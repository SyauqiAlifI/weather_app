import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int temperature = 0;
  String location = 'Jakarta';
  int woeId = 1047378;

  String searchApiUrl = 'https://www.metaweather.com/api/location/search/?query=';

  void fetchSearch(String input) async {
    var searchResult = await http.get(Uri.parse(searchApiUrl + input));
    var result = json.decode(searchResult.body)[0];

    setState(() {
      location = result['title'];
      woeId = result['woeId'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
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
                    style: const TextStyle(
                      fontSize: 60,
                      color: Colors.white,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    location,
                    style: const TextStyle(fontSize: 40, color: Colors.white),
                  ),
                )
              ],
            ),
            Column(
              children: [
                Container(
                  width: 300,
                  child: const TextField(
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                    ),
                    decoration: InputDecoration(
                      hintText: "Search the Another Location...",
                      hintStyle: TextStyle(color: Colors.white, fontSize: 16.0),
                      prefixIcon: Icon(Icons.search, color: Colors.white,)
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
