// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planet_system/bloc/new_planet_bloc/new_planet_bloc.dart';
import 'package:planet_system/bloc/new_planet_bloc/new_planet_bloc_event.dart';
import 'package:planet_system/bloc/new_planet_bloc/new_planet_bloc_state.dart';

import 'package:planet_system/bloc/planets_bloc/planets_bloc.dart';
import 'package:planet_system/bloc/planets_bloc/planets_bloc_event.dart';
import 'package:planet_system/models/models_index.dart';
import 'package:planet_system/services/services_index.dart';

import 'package:planet_system/ui/widgets/widgets_index.dart';

class AddNewPlanet extends StatefulWidget {
  const AddNewPlanet({super.key});

  @override
  State<AddNewPlanet> createState() => _AddNewPlanetState();
}

class _AddNewPlanetState extends State<AddNewPlanet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background1,
      appBar: AppBar(
        backgroundColor: AppColors.background1,
        elevation: 0,
        title: const Text('Add new planet'),
      ),
      body: ListView(
        children: const [
          _PlanetBuilder(),
          _PlanetPropertiesWidget(),
          SizedBox(
            height: 50,
          ),
          _SaveButtonWidget()
        ],
      ),
    );
  }
}

class _PlanetPropertiesWidget extends StatelessWidget {
  const _PlanetPropertiesWidget();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Table(
        columnWidths: const {
          0: FlexColumnWidth(2),
          1: FlexColumnWidth(3),
        },
        children: AppData()
            .table
            .map(
              (item) => TableRow(
                children: [
                  SizedBox(
                    height: 50,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        item.title,
                        style: const TextStyle(color: AppColors.white),
                      ),
                    ),
                  ),
                  item.child,
                ],
              ),
            )
            .toList(),
      ),
    );
  }
}

class _SaveButtonWidget extends StatelessWidget {
  const _SaveButtonWidget();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewPlanetBloc, NewPlanetState>(
        builder: (context, state) {
      return Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            width: 200,
            height: 40,
            color: AppColors.white,
            child: TextButton(
              onPressed: () {
                final newPlanet = context.read<NewPlanetBloc>();
                newPlanet.add(IsValidEvent());
                onPressed(context, state);
              },
              child: const Text(
                'Save',
                style: TextStyle(color: AppColors.accent),
              ),
            ),
          ),
        ),
      );
    });
  }

  void onPressed(BuildContext context, NewPlanetState state) {
    if (state.isValid) {
      final planetsBloc = context.read<PlanetsBloc>();
      final newPlanet = context.read<NewPlanetBloc>();
      planetsBloc.add(AddPlanetsBlocEvent(NewPlanetModel(
          color: newPlanet.state.color,
          raduis: ScaleService().convertRadius(newPlanet.state.raduis.$1!) * 3,
          distance:
              ScaleService().convertDistance(newPlanet.state.distance.$1!),
          velocity: newPlanet.state.velocity.$1,
          name: newPlanet.state.name.$1)));
      Navigator.of(context).pop();
      newPlanet.add(ClearValuesEvent());
    } else {
      AlertDialogWidget().showAlertDialogIos(
          context: context,
          title: 'Please fill all fields',
          onPressed: () => ());
    }
  }
}

class _PlanetBuilder extends StatelessWidget {
  const _PlanetBuilder();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewPlanetBloc, NewPlanetState>(
        builder: (context, state) {
      const scaleFactor = 40;
      final planetRadius = state.raduis.$1 != null
          ? ScaleService().convertRadius(state.raduis.$1!) * scaleFactor
          : 0.0;

      return SizedBox(
          height: MediaQuery.of(context).size.height / 2 - 100,
          child: PlanetBuilderWidget(
              planetRadius: planetRadius, planetColor: state.color!));
    });
  }
}
