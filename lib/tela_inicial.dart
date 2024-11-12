import 'package:flutter/material.dart';
import 'tela_quiz.dart';

class TelaInicial extends StatelessWidget {
  @override
  Widget build(BuildContex context) {
    return Scaffold(
      appBar: appBar(title: Text('Quiz App')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'lib/assets/imagens/',


            ),
            SizedBox(height: 20),
            Text(
              'Bem-vindo ao Quiz App!',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TelaQuiz()),
                );
              },
              child: 
            )
          ]
        )
      )
    );
  }
}