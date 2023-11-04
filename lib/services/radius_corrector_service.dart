class ScaleService {
  static const _sunRealRadius = 696340;
  static const _sunScaleRadius = 50;

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
}
