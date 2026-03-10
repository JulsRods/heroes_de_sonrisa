import 'package:flutter/material.dart';

class FreeDrawing extends StatefulWidget {
  const FreeDrawing({super.key});

  @override
  State<FreeDrawing> createState() => _FreeDrawingState();
}

class _FreeDrawingState extends State<FreeDrawing> {
  List<Offset?> points = [];
  Color color = Colors.blue;
  double stroke = 5.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dibuja cómo te sientes'),
        backgroundColor: const Color(0xFFE74C3C),
        foregroundColor: Colors.white,
      ),
      body: GestureDetector(
        onPanUpdate: (details) {
          setState(() {
            RenderBox box = context.findRenderObject() as RenderBox;
            points.add(box.globalToLocal(details.globalPosition));
          });
        },
        onPanEnd: (details) => points.add(null),
        child: CustomPaint(painter: DrawPainter(points, color, stroke), size: Size.infinite),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'clear',
            backgroundColor: const Color(0xFFF1C40F),
            onPressed: () => setState(() => points.clear()),
            child: const Icon(Icons.delete),
          ),
        ],
      ),
    );
  }
}

class DrawPainter extends CustomPainter {
  final List<Offset?> points;
  final Color color;
  final double stroke;
  DrawPainter(this.points, this.color, this.stroke);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeCap = StrokeCap.round
      ..strokeWidth = stroke;

    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null) {
        canvas.drawLine(points[i]!, points[i + 1]!, paint);
      }
    }
  }

  @override
  bool shouldRepaint(DrawPainter oldDelegate) => true;
}
