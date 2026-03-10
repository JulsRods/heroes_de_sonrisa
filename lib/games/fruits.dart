import 'package:flutter/material.dart';

class FruitsGame extends StatefulWidget {
  const FruitsGame({super.key});

  @override
  State<FruitsGame> createState() => _FruitsGameState();
}

class _FruitsGameState extends State<FruitsGame> {
  final fruits = [
    {'emoji': '🍎', 'name': 'MANZANA'},
    {'emoji': '🍌', 'name': 'BANANA'},
    {'emoji': '🍊', 'name': 'NARANJA'},
    {'emoji': '🍇', 'name': 'UVAS'},
    {'emoji': '🍓', 'name': 'FRESA'},
    {'emoji': '🍉', 'name': 'SANDIA'},
    {'emoji': '🍑', 'name': 'DURAZNO'},
    {'emoji': '🍒', 'name': 'CEREZA'},
    {'emoji': '🍍', 'name': 'PIÑA'},
    {'emoji': '🥝', 'name': 'KIWI'},
    {'emoji': '🍋', 'name': 'LIMON'},
    {'emoji': '🥭', 'name': 'MANGO'},
    {'emoji': '🍐', 'name': 'PERA'},
    {'emoji': '🥥', 'name': 'COCO'},
    {'emoji': '🍈', 'name': 'MELON'},
  ];
  
  int index = 0;
  String message = '¿Qué fruta es esta?';
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
    final correctAnswer = fruits[index]['name']!;

    if (answer == correctAnswer) {
      setState(() {
        message = '¡Correcto! Es una $correctAnswer';
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
    final correctAnswer = fruits[index]['name']!;
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
      index = (index + 1) % fruits.length;
      message = '¿Qué fruta es esta?';
      hints.clear();
      attemptsLeft = 3;
      _controller.clear();
    });
  }

  void show() {
    setState(() {
      message = 'Es una ${fruits[index]['name']}';
      hints.clear();
      attemptsLeft = 3;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Juego de Frutas'),
        backgroundColor: const Color(0xFF27AE60),
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
                fruits[index]['emoji']!,
                style: const TextStyle(fontSize: 80),
              ),
              const SizedBox(height: 20),
              Text(
                fruits[index]['name']!.replaceAll(RegExp(r'.'), '_ '),
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
                    labelText: 'Escribe el nombre de la fruta',
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