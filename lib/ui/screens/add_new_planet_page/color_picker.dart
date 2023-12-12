import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:planet_system/bloc/new_planet_bloc/new_planet_bloc.dart';
import 'package:planet_system/bloc/new_planet_bloc/new_planet_bloc_event.dart';
import 'package:planet_system/providers/provider_index.dart';
import 'package:planet_system/services/services_index.dart';
import 'package:planet_system/ui/widgets/widgets_index.dart';

class ColorPickerButton extends StatelessWidget {
  const ColorPickerButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PlatformBuilder(
        iOS: GestureDetector(
          child: _ColorContainer(),
          onTap: () => showCupertinoDialog(
            context: context,
            builder: (BuildContext context) {
              return _ColorPickerDialog();
            },
          ),
        ),
        other: GestureDetector(
          child: _ColorContainer(),
          onTap: () => showDialog(
            context: context,
            builder: (BuildContext context) {
              return _ColorPickerDialog();
            },
          ),
        ),
        builder: (context, child, widget) {
          return widget;
        });
  }
}

class _ColorContainer extends StatelessWidget {
  const _ColorContainer();

  @override
  Widget build(BuildContext context) {
    final newPlanet = context.watch<NewPlanetBloc>();
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: newPlanet.state.color,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}

class _ColorPickerDialog extends StatelessWidget {
  const _ColorPickerDialog();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: _ColorPickerContent(),
    );
  }
}

class _ColorPickerContent extends StatelessWidget {
  const _ColorPickerContent();

  @override
  Widget build(BuildContext context) {
    final newPlanet = context.watch<NewPlanetBloc>();
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        const Text('Choose a Color'),
        const SizedBox(height: 16.0),
        ColorPicker(
          pickerColor: newPlanet.state.color!,
          onColorChanged: (color) {
            context.read<NewPlanetBloc>().add(ChangeColorEvent(color: color));
          },
          enableAlpha: false,
          pickerAreaHeightPercent: 0.8,
        ),
        const SizedBox(height: 16.0),
        PlatformBuilder(
            iOS: CupertinoButton(
              color: AppColors.accent,
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: _createButtonText(),
            ),
            other: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(16.0),
                backgroundColor: AppColors.accent,
              ),
              child: _createButtonText(),
            ),
            builder: (context, child, widget) {
              return widget;
            }),
      ]),
    );
  }

  Text _createButtonText() {
    return const Text(
      'Apply',
      style: TextStyle(color: AppColors.white),
    );
  }
}
