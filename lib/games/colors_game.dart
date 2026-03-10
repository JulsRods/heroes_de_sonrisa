import 'package:flutter/material.dart';

class ColorsGame extends StatefulWidget {
  const ColorsGame({super.key});

  @override
  State<ColorsGame> createState() => _ColorsGameState();
}

class _ColorsGameState extends State<ColorsGame> {
  final List<Color> colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.orange,
    Colors.purple,
    Colors.pink,
    Colors.teal,
  ];

  final List<String> names = [
    'Rojo',
    'Verde',
    'Azul',
    'Amarillo',
    'Naranja',
    'Morado',
    'Rosa',
    'Turquesa',
  ];

  int correctIndex = 0;
  String message = 'Toca el color: Rojo';
  bool correctFlash = false;

  void updateMessage() {
    message = 'Toca el color: ${names[correctIndex]}';
  }

  void checkAnswer(int i) {
    setState(() {
      if (i == correctIndex) {
        correctFlash = true;
        message = '¡Muy bien! Acertaste';

        Future.delayed(const Duration(milliseconds: 600), () {
          setState(() {
            correctIndex = (correctIndex + 1) % colors.length;
            updateMessage();
            correctFlash = false;
          });
        });
      } else {
        message = 'Ese no es. Intenta de nuevo';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      appBar: AppBar(
        title: const Text('Juego de Colores'),
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
        elevation: 4,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 300),
            style: TextStyle(
              fontSize: correctFlash ? 34 : 28,
              fontWeight: FontWeight.bold,
              color: correctFlash ? Colors.green : Colors.black87,
            ),
            child: Text(message),
          ),
          const SizedBox(height: 40),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            children: List.generate(colors.length, (i) {
              return GestureDetector(
                onTap: () => checkAnswer(i),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    color: colors[i],
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: correctFlash && i == correctIndex ? 15 : 8,
                        color: Colors.black26,
                        spreadRadius: correctFlash && i == correctIndex ? 3 : 1,
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
