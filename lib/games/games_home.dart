import 'package:flutter/material.dart';
import 'colors_game.dart';
import 'numbers_game.dart';
import 'animals_game.dart';
import 'memory_game.dart';
import 'shapes_game.dart';
import 'fruits.dart'; 

class GamesHome extends StatelessWidget {
  const GamesHome({super.key});

  @override
  Widget build(BuildContext context) {
    final games = [
      {'title': 'Colores 🎨', 'widget': const ColorsGame()},
      {'title': 'Números 🔢', 'widget': const NumbersGame()},
      {'title': 'Animales 🐶', 'widget': const AnimalsGame()},
      {'title': 'Memoria 🧠', 'widget': const MemoryGame()},
     {'title': 'Formas 🧠', 'widget': const ShapesGame()},
        {'title': 'Frutas 🍎', 'widget': const FruitsGame()},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Juegos Divertidos'),
        backgroundColor: const Color(0xFFE74C3C),
        foregroundColor: Colors.white,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(20),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        itemCount: games.length,
        itemBuilder: (context, i) {
          return ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFF1C40F),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              padding: const EdgeInsets.all(10),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => games[i]['widget'] as Widget),
              );
            },
            child: Text(
              games[i]['title'] as String,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          );
        },
      ),
    );
  }
}
