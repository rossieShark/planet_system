// ignore_for_file: null_check_on_nullable_type_parameter

import 'package:flutter/material.dart';
import 'package:planet_system/ui/widgets/platform_widget/extended_platform.dart';

class PlatformBuilder<T> extends StatelessWidget {
  final T? android;
  final T? iOS;
  final T? web;
  final T? windows;
  final T? other;
  final Widget Function(BuildContext, Widget?, T) builder;
  final Widget? child;
  const PlatformBuilder({
    required this.builder,
    this.android,
    this.iOS,
    this.web,
    this.windows,
    this.other,
    this.child,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    if (ExtendedPlatform.isWeb && web != null) {
      return builder.call(context, child, web!);
    }
    if (ExtendedPlatform.isIOS && iOS != null) {
      return builder.call(context, child, iOS!);
    }
    if (ExtendedPlatform.isAndroid && android != null) {
      return builder.call(context, child, android!);
    }

    return builder.call(context, child, other!);
  }
}
