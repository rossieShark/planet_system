import 'package:flutter/material.dart';

class TextFieldsProvider with ChangeNotifier {
  // Use a Map to associate controllers with bool values
  final Map<TextEditingController, bool> _controllerValidationMap = {};
  void addController(TextEditingController controller, bool isValid) {
    _controllerValidationMap[controller] = isValid;

    notifyListeners();
  }

  bool isAllControllersValid() {
    for (var isValid in _controllerValidationMap.values) {
      if (!isValid) {
        return false;
      }
    }
    return true;
  }

  // Function to check if a specific controller is valid
  bool isControllerValid(TextEditingController controller) {
    return _controllerValidationMap[controller] == true;
  }

  Future<void> removeAllControllers() async {
    _controllerValidationMap.clear(); // Clear the validation map as well
    notifyListeners();
  }
}
