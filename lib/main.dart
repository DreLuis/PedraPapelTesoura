import 'package:flutter/material.dart';
import 'package:flutter_application_2/views/Home_Page.dart';


void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
    theme: ThemeData(
      useMaterial3: false
    ),
  ));
}
