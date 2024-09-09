import 'dart:math';
import 'package:flutter/material.dart';
import '../components/AppBar.dart'; 
import '../components/CircleImage.dart';
import '../components/ScoreBoard.dart';
import '../components/ResultText.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final List<String> _images = [
    'images/tesoura.png',
    'images/pedra.png',
    'images/papel.png',
  ];

  int _selectedIndex = -1;
  int _computerIndex = -1;
  String _randomImage = '';
  String _resultMessage = '';

  int _userWins = 0;
  int _computerWins = 0;

  void _onCircleTap(int index) {
    setState(() {
      _selectedIndex = index;
      _computerIndex = Random().nextInt(_images.length);
      _randomImage = _images[_computerIndex];
      _resultMessage = _calculateResult(_selectedIndex, _computerIndex);
    });
  }

  String _calculateResult(int userIndex, int computerIndex) {
    if (userIndex == computerIndex) {
      return "Empate";
    }

    if ((userIndex == 0 && computerIndex == 2) ||
        (userIndex == 1 && computerIndex == 0) ||
        (userIndex == 2 && computerIndex == 1)) {
      _userWins++;
      return "Você ganhou!";
    } else {
      _computerWins++;
      return "Você perdeu!";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text(
                "Sua Jogada",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Poppins"
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircleImage(imagePath: _images[0], onTap: () => _onCircleTap(0)),
                  CircleImage(imagePath: _images[1], onTap: () => _onCircleTap(1)),
                  CircleImage(imagePath: _images[2], onTap: () => _onCircleTap(2)),
                ],
              ),
            ),
            Center(
              child: Text(
                "Jogada do Computador",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Poppins"
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 20),
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey[300],
                  border: Border.all(
                    color: Colors.black,
                    width: 2,
                  ),
                  image: _randomImage.isNotEmpty
                      ? DecorationImage(
                          image: AssetImage(_randomImage),
                          fit: BoxFit.cover,
                        )
                      : null,
                ),
              ),
            ),
            SizedBox(height: 30),
            ResultText(result: _resultMessage),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: ScoreBoard(title: "Jogador", score: _userWins),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: ScoreBoard(title: "Computador", score: _computerWins),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}