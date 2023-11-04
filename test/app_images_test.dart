import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:planet_system/resources/resources.dart';

void main() {
  test('app_images assets test', () {
    expect(File(AppImages.jupiter).existsSync(), isTrue);
    expect(File(AppImages.planet).existsSync(), isTrue);
    expect(File(AppImages.stars).existsSync(), isTrue);
  });
}
