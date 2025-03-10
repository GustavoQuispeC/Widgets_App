import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  static const String name = 'ui_controls_screen';

  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UI Controls'),
      ),
      body: const _UiControlsView(),
    );
  }
}

class _UiControlsView extends StatefulWidget {
  const _UiControlsView();

  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

enum Transportation { car, bike, walk, plane }

class _UiControlsViewState extends State<_UiControlsView> {
  bool isDeveloper = true;
  Transportation selectedTransportation = Transportation.car;
  bool wantsBreakfast = false;
  bool wantsLunch = false;
  bool wantsDinner = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
          title: const Text('Developer mode'),
          subtitle: const Text('Enable developer mode'),
          value: isDeveloper,
          onChanged: (bool value) {
            setState(() {
              isDeveloper = value;
            });
          },
        ),

        //! RadioListTile
        ExpansionTile(
            title: const Text('Medios de Transporte'),
            subtitle: Text('$selectedTransportation'),
            children: [
              RadioListTile(
                  title: const Text(' By Car'),
                  value: Transportation.car,
                  groupValue: selectedTransportation,
                  onChanged: (value) => setState(
                        () {
                          selectedTransportation = Transportation.car;
                        },
                      )),
              RadioListTile(
                  title: const Text('By Bike'),
                  value: Transportation.bike,
                  groupValue: selectedTransportation,
                  onChanged: (value) => setState(
                        () {
                          selectedTransportation = Transportation.bike;
                        },
                      )),
              RadioListTile(
                  title: const Text('By Plane'),
                  value: Transportation.plane,
                  groupValue: selectedTransportation,
                  onChanged: (value) => setState(
                        () {
                          selectedTransportation = Transportation.plane;
                        },
                      )),
              RadioListTile(
                  title: const Text('By Walk'),
                  value: Transportation.walk,
                  groupValue: selectedTransportation,
                  onChanged: (value) => setState(
                        () {
                          selectedTransportation = Transportation.walk;
                        },
                      ))
            ]),

//! CheckboxListTile
        CheckboxListTile(
          title: const Text('Desayuno'),
          value: wantsBreakfast,
          onChanged: (value) => setState(() {
            wantsBreakfast = !wantsBreakfast;
          }),
        ),
        CheckboxListTile(
          title: const Text('Almuerzo'),
          value: wantsLunch,
          onChanged: (value) => setState(() {
            wantsLunch = !wantsLunch;
          }),
        ),
        CheckboxListTile(
          title: const Text('Cena'),
          value: wantsDinner,
          onChanged: (value) => setState(() {
            wantsDinner = !wantsDinner;
          }),
        ),
      ],
    );
  }
}
