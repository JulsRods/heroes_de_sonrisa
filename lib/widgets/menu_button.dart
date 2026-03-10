import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String text;
  final VoidCallback onTap;

  const MenuButton({
    super.key,
    required this.color,
    required this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 70),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        elevation: 5,
      ),
      onPressed: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 60, color: Colors.white),
          const SizedBox(height: 10),
          Text(
            text,
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}


