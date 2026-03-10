import 'package:flutter/material.dart';
import '../widgets/menu_button.dart';
import 'package:heroes_de_sonrisa/games/games_home.dart';
import 'package:heroes_de_sonrisa/drawing/drawing_home.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Héroes de Sonrisa 🦸‍♀️🦸‍♂️'),
        centerTitle: true,
        backgroundColor: const Color(0xFFE74C3C),
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MenuButton(
              color: const Color(0xFFF1C40F),
              icon: Icons.videogame_asset,
              text: 'Juegos',
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const GamesHome()),
              ),
            ),
            const SizedBox(height: 40),
            MenuButton(
              color: const Color(0xFFE74C3C),
              icon: Icons.brush,
              text: 'Dibuja y Pinta',
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const DrawingHome()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

