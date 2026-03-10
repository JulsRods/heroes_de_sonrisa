import 'package:flutter/material.dart';
import 'dart:math';

class MemoryGame extends StatefulWidget {
  const MemoryGame({super.key});

  @override
  State<MemoryGame> createState() => _MemoryGameState();
}

class _MemoryGameState extends State<MemoryGame> {
  final List<String> emojis = ['🐶', '🐱', '🐮', '🐷', '🐸', '🐰'];
  List<String> cards = [];
  List<bool> revealed = [];
  int? firstIndex;

  @override
  void initState() {
    super.initState();
    cards = [...emojis, ...emojis]..shuffle(Random());
    revealed = List.filled(cards.length, false);
  }

  void flip(int index) {
    if (revealed[index]) return;
    setState(() => revealed[index] = true);
    if (firstIndex == null) {
      firstIndex = index;
    } else {
      if (cards[index] != cards[firstIndex!]) {
        Future.delayed(const Duration(seconds: 1), () {
          setState(() {
            revealed[index] = false;
            revealed[firstIndex!] = false;
            firstIndex = null;
          });
        });
      } else {
        firstIndex = null;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Memoria'),
        backgroundColor: const Color(0xFFE74C3C),
        foregroundColor: Colors.white,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(20),
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: 10, mainAxisSpacing: 10),
        itemCount: cards.length,
        itemBuilder: (context, i) {
          return GestureDetector(
            onTap: () => flip(i),
            child: Container(
              decoration: BoxDecoration(
                color: revealed[i] ? const Color(0xFFF1C40F) : Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: const Color(0xFFE74C3C), width: 3),
              ),
              child: Center(
                child: Text(revealed[i] ? cards[i] : '❓', style: const TextStyle(fontSize: 40)),
              ),
            ),
          );
        },
      ),
    );
  }
}

