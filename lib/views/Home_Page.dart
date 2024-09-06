import 'dart:math';
import 'package:flutter/material.dart';

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
      appBar: AppBar(
        backgroundColor: Colors.lightGreen[600],
        title: Center(
          child: Text(
            'Pedra Papel Tesoura',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              fontFamily: "Open Sans",
            ),
          ),
        )
      ),
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
                  GestureDetector(
                    onTap: () => _onCircleTap(0),
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color:Colors.grey[300],
                        border: Border.all(
                          color: Colors.black,
                          width: 2,
                        ),
                        image: DecorationImage(
                          image: AssetImage(_images[0]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => _onCircleTap(1),
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color:Colors.grey[300],
                        border: Border.all(
                          color: Colors.black,
                          width: 2,
                        ),
                        image: DecorationImage(
                          image: AssetImage(_images[1]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => _onCircleTap(2),
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color:Colors.grey[300],
                        border: Border.all(
                          color: Colors.black,
                          width: 2,
                        ),
                        image: DecorationImage(
                          image: AssetImage(_images[2]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  )
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
                  image: _randomImage.isNotEmpty ? DecorationImage(
                    image: AssetImage(_randomImage),
                    fit: BoxFit.cover,
                  ): null,
                ),
              )
            ),
            Container(
              padding: EdgeInsets.only(top: 40),
              child: Center(
                child: Text(
                  "Resultado",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Poppins",
                  ),
                )
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 20),
              child: Center(
                child: Text(
                  _resultMessage,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: "OpenSans",
                  ),
                )
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10),
               child: Center(
                child: Text(
                  "Você: $_userWins - Computador: $_computerWins",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Poppins",
                  ),
                )
               ),
            ),
          ]
        )
      )
    );
  }
}