import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:planet_system/providers/new_planet_provider.dart';
import 'package:provider/provider.dart';

class ColorPickerButton extends StatelessWidget {
  const ColorPickerButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final newPlanetProvider = context.watch<NewPlanetProvider>();
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 16, 0),
      child: GestureDetector(
        child: Container(
          height: 40,
          decoration: BoxDecoration(
            color: newPlanetProvider.state.color,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onTap: () => showDialog(
          context: context,
          builder: (BuildContext context) {
            return Dialog(
              child: Container(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('Choose a Color'),
                    const SizedBox(height: 16.0),
                    ColorPicker(
                      pickerColor: newPlanetProvider.state.color,
                      onColorChanged: (color) {
                        newPlanetProvider.changeColor(color);
                      },
                      enableAlpha: false,
                      pickerAreaHeightPercent: 0.8,
                    ),
                    const SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(16.0),
                        backgroundColor: Colors.white,
                      ),
                      child: const Text(
                        'Apply',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
