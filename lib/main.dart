import 'package:flutter/material.dart';
import 'tela_inicial.dart';

void main() => runApp(MenuApp());

class MenuApp extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Quiz',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: TelaInicial(),
    );
  }
}