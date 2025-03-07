import 'package:flutter/material.dart';
import 'dart:math' show Random;

class AnimatedScreen extends StatefulWidget {
  static const String name = 'animated_screen';

  const AnimatedScreen({super.key});

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

//? creando un estado para el widget
class _AnimatedScreenState extends State<AnimatedScreen> {
  double width = 50;
  double height = 50;
  Color color = Colors.indigo;
  double borderRadius = 10;

  void changeShape() {
    final random = Random();

    width = random.nextInt(300) + 50.toDouble();
    height = random.nextInt(300) + 50.toDouble();
    borderRadius = random.nextInt(100).toDouble() + 20;
    color = Color.fromRGBO(
        //red
        random.nextInt(256),
        //green
        random.nextInt(256),
        //blue
        random.nextInt(256),
        //opacity
        1);
    setState(() {});
  }

//? creando un contenedor animado
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Container'),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(seconds: 1),
          curve: Curves.fastOutSlowIn,
          width: width <= 0 ? 0 : width,
          height: height <= 0 ? 0 : height,
          decoration: BoxDecoration(
            color: color,
            borderRadius:
                BorderRadius.circular(borderRadius < 0 ? 0 : borderRadius),
          ),
        ),
      ),

      //? creando un botón flotante
      floatingActionButton: FloatingActionButton(
        onPressed: changeShape,
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}
