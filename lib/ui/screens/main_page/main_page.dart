// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:planet_system/bloc/planets_bloc/planets_bloc.dart';
import 'package:planet_system/bloc/planets_bloc/planets_bloc_event.dart';

import 'package:planet_system/resources/resources.dart';
import 'package:planet_system/services/services_index.dart';
import 'package:planet_system/ui/screens/screens_index.dart';

import 'package:planet_system/ui/widgets/widgets_index.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          _BackgroundWidget(),
          Positioned(
            right: 21,
            top: 193,
            child: CustomRadialGradient(
                diameter: 123,
                colors: [AppColors.gradientColor1, AppColors.gradientColor2]),
          ),
          Positioned(
            left: 0,
            top: 470,
            child: CustomRadialGradient(
                diameter: 300,
                colors: [AppColors.gradientColor3, AppColors.gradientColor4]),
          ),
          Positioned.fill(
            child: _BlurStarsWidget(),
          ),
          _SunSystemWidget(),
          _AddPlanetButton(),
        ],
      ),
    );
  }
}

class _SunSystemWidget extends StatelessWidget {
  const _SunSystemWidget();

  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(
        panEnabled: false,
        minScale: 0.2,
        maxScale: 50,
        child: Stack(
          children: [
            Transform.scale(scale: 0.2, child: const SunWidget()),
            Transform.scale(scale: 0.2, child: const PlanetsStack()),
          ],
        ));
  }
}

class _AddPlanetButton extends StatelessWidget {
  const _AddPlanetButton();

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomButton(
                onTap: () {
                  onAddPlanet(context);
                },
                image: AppImages.planet),
            const SizedBox(
              width: 30,
            ),
            CustomButton(
                onTap: () {
                  onRemoveAll(context);
                },
                image: AppImages.minus),
          ],
        ));
  }

  void onRemoveAll(BuildContext context) {
    context.read<PlanetsBloc>().add(const RemoveAllPlanetsBlocEvent());
  }

  void onAddPlanet(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => const AddNewPlanet(),
    ));
  }
}

class _BackgroundWidget extends StatelessWidget {
  const _BackgroundWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: SweepGradient(
          colors: [
            AppColors.background1,
            AppColors.background2,
            AppColors.background1,
          ],
          stops: [
            0.4,
            0.3,
            0.3,
          ],
        ),
      ),
    );
  }
}

class _BlurStarsWidget extends StatelessWidget {
  const _BlurStarsWidget();

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 150.0, sigmaY: 150.0),
        child: Image.asset(
          AppImages.stars,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
