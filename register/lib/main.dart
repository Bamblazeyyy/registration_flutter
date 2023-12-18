import 'package:flutter/material.dart';
import 'register.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {'/': (context) => Register()},
  ));
}
