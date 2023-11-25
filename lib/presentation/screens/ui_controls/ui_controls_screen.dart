
import 'package:flutter/material.dart';

enum Transportation { car, plane, boat, submarine }

class UiControlScreen extends StatelessWidget {

  static const String name = 'ui_screen';

  const UiControlScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UI Controls Screen')
      ),

      body: const _UIControlsView()
    );
  }
}

class _UIControlsView extends StatefulWidget {

  const _UIControlsView();

  @override
  State<_UIControlsView> createState() => _UIControlsViewState();
}

class _UIControlsViewState extends State<_UIControlsView> {

  bool isDevelopMode = true;
  Transportation selectedTransportation = Transportation.car;
  bool wantsBreakfast = false;
  bool wantsDinner = false;
  bool wantsLunch = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [

        SwitchListTile(
          value: isDevelopMode,
          title: const Text('Developer mode'),
          subtitle: const Text('Additional controls'),
          onChanged: (value) {
            isDevelopMode = value;
            setState(() {});
          }
        ),

        ExpansionTile(
          title: const Text('Transportation vehicule'),
          subtitle: Text('$selectedTransportation'),
          children: [
            RadioListTile(
              title: const Text('By car'),
              subtitle: const Text('Travel by car'),
              value: Transportation.car,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                selectedTransportation = Transportation.car;
              })
            ),

            RadioListTile(
              title: const Text('By plane'),
              subtitle: const Text('Travel by plane'),
              value: Transportation.plane,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                selectedTransportation = Transportation.plane;
              })
            ),

            RadioListTile(
              title: const Text('By boat'),
              subtitle: const Text('Travel by boat'),
              value: Transportation.boat,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                selectedTransportation = Transportation.boat;
              })
            ),

            RadioListTile(
              title: const Text('By submarine'),
              subtitle: const Text('Travel by submarine'),
              value: Transportation.submarine,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                selectedTransportation = Transportation.submarine;
              })
            ),
          ],
        ),

        ExpansionTile(
          title: const Text('What do you want to order ?'),
          children: [

            CheckboxListTile(
              title: const Text('Breakfast'),
              value: wantsBreakfast,
              onChanged: (value) => setState(() {
                wantsBreakfast = !wantsBreakfast;
              })
            ),

            CheckboxListTile(
              title: const Text('Lunch'),
              value: wantsLunch,
              onChanged: (value) => setState(() {
                wantsLunch = !wantsLunch;
              })
            ),

            CheckboxListTile(
              title: const Text('Dinner'),
              value: wantsDinner,
              onChanged: (value) => setState(() {
                wantsDinner = !wantsDinner;
              })
            ),

          ],
        ),

      ],
    );
  }
}
