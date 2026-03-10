import 'package:flutter/material.dart';

class AnimalsGame extends StatefulWidget {
  const AnimalsGame({super.key});

  @override
  State<AnimalsGame> createState() => _AnimalsGameState();
}

class _AnimalsGameState extends State<AnimalsGame> {
  final animals = [
    {'emoji': '🐶', 'name': 'PERRO'},
    {'emoji': '🐱', 'name': 'GATO'},
    {'emoji': '🐮', 'name': 'VACA'},
    {'emoji': '🐷', 'name': 'CERDO'},
    {'emoji': '🐰', 'name': 'CONEJO'},
    {'emoji': '🐴', 'name': 'CABALLO'},
    {'emoji': '🐑', 'name': 'OVEJA'},
    {'emoji': '🐘', 'name': 'ELEFANTE'},
    {'emoji': '🦁', 'name': 'LEON'},
    {'emoji': '🐯', 'name': 'TIGRE'},
    {'emoji': '🐻', 'name': 'OSO'},
    {'emoji': '🐵', 'name': 'MONO'},
    {'emoji': '🦒', 'name': 'JIRAFA'},
    {'emoji': '🦓', 'name': 'ZEBRA'},
    {'emoji': '🦆', 'name': 'PATO'},
  ];
  
  int index = 0;
  String message = '¿Qué animal es este?';
  final TextEditingController _controller = TextEditingController();
  List<String> hints = [];
  int attemptsLeft = 3;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void checkAnswer() {
    final answer = _controller.text.trim().toUpperCase();
    final correctAnswer = animals[index]['name']!;

    if (answer == correctAnswer) {
      setState(() {
        message = '¡Correcto! Es un $correctAnswer';
        hints.clear();
        attemptsLeft = 3;
      });
      _controller.clear();
    } else {
      setState(() {
        attemptsLeft--;
        if (attemptsLeft > 0) {
          giveHint();
          message = 'Incorrecto. Pistas: ${hints.join(", ")}';
        } else {
          message = 'Se acabaron los intentos. Era: $correctAnswer';
          hints.clear();
        }
      });
    }
  }

  void giveHint() {
    final correctAnswer = animals[index]['name']!;
    final availableIndices = List.generate(correctAnswer.length, (i) => i)
        .where((i) => !hints.contains(correctAnswer[i]))
        .toList();
    
    if (availableIndices.isNotEmpty && hints.length < 3) {
      availableIndices.shuffle();
      final hintIndex = availableIndices.first;
      hints.add(correctAnswer[hintIndex]);
    }
  }

  void next() {
    setState(() {
      index = (index + 1) % animals.length;
      message = '¿Qué animal es este?';
      hints.clear();
      attemptsLeft = 3;
      _controller.clear();
    });
  }

  void show() {
    setState(() {
      message = 'Es un ${animals[index]['name']}';
      hints.clear();
      attemptsLeft = 3;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Juego de Animales'),
        backgroundColor: const Color(0xFFE74C3C),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Text(
                animals[index]['emoji']!,
                style: const TextStyle(fontSize: 80),
              ),
              const SizedBox(height: 20),
              Text(
                animals[index]['name']!.replaceAll(RegExp(r'.'), '_ '),
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 6,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                message,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 15),
              Text(
                'Intentos restantes: $attemptsLeft',
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 280,
                child: TextField(
                  controller: _controller,
                  decoration: const InputDecoration(
                    labelText: 'Escribe el nombre del animal',
                    border: OutlineInputBorder(),
                  ),
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 18),
                  textCapitalization: TextCapitalization.characters,
                  onSubmitted: (_) => checkAnswer(),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: checkAnswer,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 12),
                ),
                child: const Text('Verificar', style: TextStyle(fontSize: 16)),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: show,
                    child: const Text('Mostrar'),
                  ),
                  const SizedBox(width: 15),
                  ElevatedButton(
                    onPressed: next,
                    child: const Text('Siguiente'),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}