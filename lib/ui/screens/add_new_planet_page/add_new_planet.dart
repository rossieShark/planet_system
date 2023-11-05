// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:planet_system/models/models_index.dart';
import 'package:planet_system/providers/provider_index.dart';
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
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          width: 200,
          height: 40,
          color: AppColors.white,
          child: TextButton(
            onPressed: () {
              onPressed(context);
            },
            child: const Text(
              'Save',
              style: TextStyle(color: AppColors.accent),
            ),
          ),
        ),
      ),
    );
  }

  void onPressed(BuildContext context) {
    final provider = context.read<TextFieldsProvider>();

    if (provider.isAllControllersValid()) {
      final planetsProvider = context.read<PlanetsProvider>();
      final newPlanet = context.read<NewPlanetProvider>().state;
      planetsProvider.addPlanet(NewPlanetModel(
          color: newPlanet.color,
          raduis: ScaleService().convertRadius(newPlanet.raduis!) * 3,
          distance: ScaleService().convertDistance(newPlanet.distance!),
          velocity: newPlanet.velocity,
          name: newPlanet.name));
      Navigator.of(context).pop();
      provider.removeAllControllers();
    }
  }
}

class _PlanetBuilder extends StatelessWidget {
  const _PlanetBuilder();

  @override
  Widget build(BuildContext context) {
    return Consumer<NewPlanetProvider>(builder: (context, newPlanet, child) {
      const scaleFactor = 40;
      final planetRadius = newPlanet.state.raduis != null
          ? ScaleService().convertRadius(newPlanet.state.raduis!) * scaleFactor
          : 0.0;

      return SizedBox(
          height: MediaQuery.of(context).size.height / 2 - 100,
          child: PlanetBuilderWidget(
              planetRadius: planetRadius, planetColor: newPlanet.state.color!));
    });
  }
}
