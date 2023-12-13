import 'package:planet_system/domain/models/models_index.dart';
import 'package:planet_system/ui/screens/screens_index.dart';

class AppData {
  List<TableModel> table = [
    TableModel(
      title: 'Color',
      child: const ColorPickerButton(),
    ),
    TableModel(
      title: 'Name of planet',
      child: const NameTextField(),
    ),
    TableModel(
      title: 'Radius (km)',
      child: const RadiusTextField(),
    ),
    TableModel(
      title: 'Distance from sun (million km)',
      child: const DistanceTextField(),
    ),
    TableModel(
      title: 'Velocity',
      child: const VelocityTextField(),
    ),
  ];
}
