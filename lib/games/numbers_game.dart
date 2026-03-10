import 'dart:math';
import 'package:flutter/material.dart';

class NumbersGame extends StatefulWidget {
  const NumbersGame({super.key});

  @override
  State<NumbersGame> createState() => _NumbersGameState();
}

class _NumbersGameState extends State<NumbersGame> {
  int correctAnswer = 0;
  List<int> options = [];

  @override
  void initState() {
    super.initState();
    _newQuestion();
  }

  void _newQuestion() {
    final random = Random();
    correctAnswer = random.nextInt(9) + 1;
    options = List.generate(4, (_) => random.nextInt(9) + 1);
    if (!options.contains(correctAnswer)) {
      options[random.nextInt(4)] = correctAnswer;
    }
  }

 void _check(int selected) {
  final isCorrect = selected == correctAnswer;

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: const Duration(milliseconds: 500),
      content: Text(isCorrect ? '¡Correcto! ' : 'Intenta otra vez '),
    ),
  );

  // Espera un poquito antes de cambiar la pregunta
  Future.delayed(const Duration(milliseconds: 500), () {
    setState(() {
      _newQuestion();
    });
  });
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Juego de Números'),
        backgroundColor: const Color(0xFFE74C3C),
        foregroundColor: Colors.white,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('¿Cuál es el número $correctAnswer?', style: const TextStyle(fontSize: 28)),
          const SizedBox(height: 40),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            children: options.map((n) {
              return ElevatedButton(
                onPressed: () => _check(n),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFF1C40F),
                  padding: const EdgeInsets.all(25),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                ),
                child: Text('$n', style: const TextStyle(fontSize: 28, color: Colors.white)),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
