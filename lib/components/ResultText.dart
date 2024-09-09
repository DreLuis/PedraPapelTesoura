import 'package:flutter/material.dart';

class ResultText extends StatelessWidget {
  final String result;

  const ResultText({required this.result});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        result,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          fontFamily: "OpenSans",
        ),
      ),
    );
  }
}
