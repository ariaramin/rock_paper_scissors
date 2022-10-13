import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(
    Application(),
  );
}

class Application extends StatefulWidget {
  const Application({super.key});

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  var _playerOne, _playerTwo, _scoreOne, _scoreTwo;

  @override
  void initState() {
    _scoreOne = 0;
    _scoreTwo = 0;
    _playerOne = _getRandom(1, 3);
    _playerTwo = _getRandom(4, 3);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.redAccent,
      ),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.amber,
        fontFamily: "vazir",
      ),
      home: Scaffold(
        body: SafeArea(
          child: _getBody(),
        ),
      ),
    );
  }

  Widget _getBody() {
    return Column(
      children: [
        Expanded(
          child: Container(
            width: double.infinity,
            color: Colors.redAccent,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Image(
                        image: AssetImage("images/$_playerTwo.png"),
                      ),
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    Container(
                      width: 46,
                      height: 46,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                        ),
                      ),
                      child: Text(
                        "$_scoreTwo",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Container(
          width: double.infinity,
          child: TextButton(
            onPressed: () {
              setState(() {
                _playerOne = _getRandom(1, 3);
                _playerTwo = _getRandom(4, 3);
                _checkWinner();
              });
            },
            style: TextButton.styleFrom(
              foregroundColor: Colors.black,
              backgroundColor: Colors.white,
            ),
            child: Text("سنگ  کاغذ  قیچی"),
          ),
        ),
        Expanded(
          child: Container(
            width: double.infinity,
            color: Colors.blueAccent,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 46,
                      height: 46,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                        ),
                      ),
                      child: Text(
                        "$_scoreOne",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    Expanded(
                      child: Image(
                        image: AssetImage("images/$_playerOne.png"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _checkWinner() {
    if (_playerOne == 1 && _playerTwo == 4) {
      _scoreOne += 1;
    } else if (_playerOne == 1 && _playerTwo == 5) {
      _scoreTwo += 1;
    } else if (_playerOne == 2 && _playerTwo == 4) {
      _scoreTwo += 1;
    } else if (_playerOne == 2 && _playerTwo == 6) {
      _scoreOne += 1;
    } else if (_playerOne == 3 && _playerTwo == 5) {
      _scoreOne += 1;
    } else if (_playerOne == 3 && _playerTwo == 6) {
      _scoreTwo += 1;
    }
  }

  int _getRandom(int min, int max) {
    var random_number = Random().nextInt(max) + min;
    return random_number;
  }
}
