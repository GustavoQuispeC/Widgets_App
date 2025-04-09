import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subtitle;
  final String link;
  final IconData icon;

  const MenuItem(
      {required this.title,
      required this.subtitle,
      required this.link,
      required this.icon});
}

const appMenuItems = <MenuItem>[
  MenuItem(
      title: 'Riverpod Counter',
      subtitle: 'Introduccion a Riverpod',
      link: '/counter_screen',
      icon: Icons.add_circle_outline_rounded),
  MenuItem(
      title: 'Botones',
      subtitle: 'Varios botones en flutter',
      link: '/buttons',
      icon: Icons.smart_button_outlined),
  MenuItem(
      title: 'Tarjetas',
      subtitle: 'Un contenedor estilizado',
      link: '/cards',
      icon: Icons.credit_card),
  MenuItem(
      title: 'Progress Indicator',
      subtitle: 'Generales y controlados',
      link: '/progress',
      icon: Icons.refresh_rounded),
  MenuItem(
      title: 'Snackbars y Dialogs',
      subtitle: 'Mensajes temporales',
      link: '/snackbars',
      icon: Icons.notifications_active),
  MenuItem(
      title: 'Animated ontainer',
      subtitle: 'Stateful animation',
      link: '/animated',
      icon: Icons.check_box_outline_blank_rounded),
  MenuItem(
      title: 'UI Controls',
      subtitle: 'Serie de controles en Flutter',
      link: '/ui-controls',
      icon: Icons.car_rental_outlined),
  MenuItem(
      title: 'Introduccion a la app',
      subtitle: 'Tutorial de la app',
      link: '/app-tutorial',
      icon: Icons.accessible_rounded),
  MenuItem(
      title: 'Infinito Scroll y pull',
      subtitle: 'Listas infinitas',
      link: '/infinite',
      icon: Icons.list_alt_rounded),
  MenuItem(
      title: 'Theme Changer',
      subtitle: 'Cambiar el tema de la app',
      link: '/theme-changer',
      icon: Icons.color_lens_outlined),
];
