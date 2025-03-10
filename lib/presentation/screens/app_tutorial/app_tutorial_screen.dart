import 'package:flutter/material.dart';

class SlideInfo {
  final String? title;
  final String? caption;
  final String? imageUrl;

  SlideInfo({
    this.title,
    this.caption,
    this.imageUrl,
  });
}

final slides = <SlideInfo>[
  SlideInfo(
    title: 'Busca la comida',
    caption: 'Busca la comida que deseas',
    imageUrl: 'assets/images/tutorial/1.png',
  ),
  SlideInfo(
    title: 'Entrega rapida',
    caption: 'Selecciona la comida que deseas',
    imageUrl: 'assets/images/tutorial/2.png',
  ),
  SlideInfo(
    title: 'Disfruta la comida',
    caption: 'Realiza tu pedido y espera la entrega',
    imageUrl: 'assets/images/tutorial/3.png',
  ),
];

class AppTutorialScreen extends StatelessWidget {
  static const String name = 'app_tutorial_screen';

  const AppTutorialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const BouncingScrollPhysics(),
        children: slides
            .map((slideData) => _Slide(
                  title: slideData.title,
                  caption: slideData.caption,
                  imageUrl: slideData.imageUrl,
                ))
            .toList(),
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String? title;
  final String? caption;
  final String? imageUrl;

  const _Slide({this.title, this.caption, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
