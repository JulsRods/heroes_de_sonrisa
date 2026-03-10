import 'package:flutter/material.dart';
import 'dart:math';

class ShapesGame extends StatefulWidget {
  const ShapesGame({super.key});

  @override
  State<ShapesGame> createState() => _ShapesGameState();
}

class _ShapesGameState extends State<ShapesGame> {
  final List<String> shapes = ['Círculo','Cuadrado','Triángulo','Rectángulo'];
  final Random rand = Random();
  late String current;

  @override
  void initState() {
    super.initState();
    _next();
  }

  void _next() {
    current = shapes[rand.nextInt(shapes.length)];
    setState(() {});
  }

  void _check(String picked) {
    final ok = picked == current;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(ok ? '¡Correcto!' : 'Intenta otra vez')));
    Future.delayed(const Duration(milliseconds: 700), _next);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Figuras')),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            Text('Selecciona: $current', style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
            const SizedBox(height: 18),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 18,
                crossAxisSpacing: 18,
                children: shapes.map((s) {
                  return ElevatedButton(
                    onPressed: () => _check(s),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black87,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                    ),
                    child: Text(s, style: const TextStyle(fontSize: 22)),
                  );
                }).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
