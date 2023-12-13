class ScaleService {
  static const double _sunRealRadius = 696340;
  static const double _sunScaleRadius = 50;

  double get sunScaleRadius => _sunScaleRadius;
  double get sunRealRadius => _sunRealRadius;
  double _convertValue() {
    return _sunScaleRadius / _sunRealRadius;
  }

  double convertRadius(double radius) {
    return radius * _convertValue();
  }

  double convertDistance(double distance) {
    final actualDistance = distance * 10000;
    return actualDistance * _convertValue() + _sunScaleRadius;
  }

  double? parseToDoubleOrNull(String input) {
    try {
      double result = double.parse(input);
      return result;
    } catch (e) {
      return null;
    }
  }
}
