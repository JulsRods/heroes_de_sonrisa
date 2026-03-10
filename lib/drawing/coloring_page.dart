import 'package:flutter/material.dart';

class ColoringPage extends StatelessWidget {
  const ColoringPage({super.key});

  @override
  Widget build(BuildContext context) {
    final images = ['❤️', '🌸', '🌈', '☀️'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Colorea tu dibujo'),
        backgroundColor: const Color(0xFFE74C3C),
        foregroundColor: Colors.white,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(20),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 20, crossAxisSpacing: 20),
        itemCount: images.length,
        itemBuilder: (context, i) {
          return Container(
            decoration: BoxDecoration(
              color: const Color(0xFFFFF8E1),
              border: Border.all(color: const Color(0xFFE74C3C), width: 3),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(child: Text(images[i], style: const TextStyle(fontSize: 80))),
          );
        },
      ),
    );
  }
}

