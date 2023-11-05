import 'package:flutter/material.dart';
import 'package:planet_system/services/services_index.dart';


class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onTap, required this.image});
  final VoidCallback onTap;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 50),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(35),
        child: GestureDetector(
          onTap: onTap,
          child: Container(
              width: 60,
              height: 60,
              color: AppColors.white,
              child: Center(
                child: Image.asset(
                  width: 25,
                  height: 25,
                  image,
                  color: AppColors.accent,
                ),
              )),
        ),
      ),
    );
  }
}
