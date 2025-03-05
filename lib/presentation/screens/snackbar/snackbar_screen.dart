import 'package:flutter/material.dart';

class SnackbarScreen extends StatelessWidget {
  static const String name = 'snackbar_screen';

  const SnackbarScreen({super.key});

//sirve para mostrar un snackbar
  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();

    var snackback = SnackBar(
        content: const Text('Hola mundo'),
        action: SnackBarAction(
          label: 'Ok',
          onPressed: () {},
        ),
        duration: const Duration(seconds: 3));

    ScaffoldMessenger.of(context).showSnackBar(snackback);
  }

//sirve para mostrar un dialogo
  void openDialog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: const Text('Diálogo de ejemplo'),
            content: const Text('Este es un diálogo de ejemplo'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Cerrar'),
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbars y Dialogs'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //? creando un dialogo de licencias
          FilledButton.tonal(
              onPressed: () {
                showAboutDialog(context: context, children: [
                  const Text('Aplicación de ejemplo'),
                  const Text('Versión 1.0.0'),
                  const Text('Desarrollado por:'),
                  const Text('Gustavo Quispe Castañeda')
                ]);
              },
              child: const Text('Licencias usadas')),

          //? creando un dialogo de ejemplo
          FilledButton.tonal(
              onPressed: () {
                openDialog(context);
              },
              child: const Text('Mostrar diálogo')),
        ],
      )),

      //?creando un snackbar
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Show Snackbar'),
        icon: const Icon(Icons.remove_red_eye_outlined),
        onPressed: () => showCustomSnackbar(context),
      ),
    );
  }
}
