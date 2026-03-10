import 'package:flutter/material.dart';
import 'free_drawing.dart';

class DrawingHome extends StatelessWidget {
  const DrawingHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Zona de Dibujo'),
        backgroundColor: const Color(0xFFE74C3C),
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              icon: const Icon(Icons.edit),
              label: const Text('Dibujo Libre'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFF1C40F),
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              ),
              onPressed: () =>
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const FreeDrawing())),
            ),
          ],
        ),
      ),
    );
  }
}

