import 'package:flutter/material.dart';

class _ViewModelState {
  List<TextEditingController> controllers = [];
}

class TextFieldsProvider with ChangeNotifier {
  // ignore: prefer_final_fields
  var _state = _ViewModelState();
  _ViewModelState get state => _state;

  void addController(TextEditingController controller) {
    _state.controllers.add(controller);

    notifyListeners();
  }

  bool isAllControllersValid() {
    for (var controller in _state.controllers) {
      if (controller.text.isEmpty) {
        return false;
      }
    }
    return true;
  }

  Future<void> removeAllControllers() async {
    _state.controllers.clear();
  }
}
