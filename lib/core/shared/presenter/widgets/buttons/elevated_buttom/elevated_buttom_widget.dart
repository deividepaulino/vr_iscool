import 'package:flutter/material.dart';

// Classe VRButtonElevated estendendo ElevatedButton
class VRButtonElevated extends ElevatedButton {
  VRButtonElevated({
    super.key,
    required VoidCallback super.onPressed,
    required String title,
    required BuildContext context,
    Color? backgroundColor,
    double? elevation,
    BorderRadiusGeometry? borderRadius,
  }) : super(
          child: Text(
            title,
            style: const TextStyle(color: Colors.white), // Texto sempre branco
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor ?? Theme.of(context).primaryColor,
            elevation: elevation ?? 2.0,
            shape: RoundedRectangleBorder(
              borderRadius:
                  borderRadius ?? BorderRadius.circular(30.0), // Raio padrão
            ),
          ),
        );

  VRButtonElevated.icon({
    super.key,
    required VoidCallback super.onPressed,
    required String title,
    required BuildContext context,
    required IconData icon,
    Color? backgroundColor,
    double? elevation,
    BorderRadiusGeometry? borderRadius,
  }) : super(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                color: Colors.white,
              ),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor ?? Theme.of(context).primaryColor,
            elevation: elevation ?? 2.0,
            shape: RoundedRectangleBorder(
              borderRadius:
                  borderRadius ?? BorderRadius.circular(30.0), // Raio padrão
            ),
          ),
        );

  VRButtonElevated.success({
    super.key,
    required VoidCallback super.onPressed,
    required String title,
    required BuildContext context,
    Color? backgroundColor,
    double? elevation,
    BorderRadiusGeometry? borderRadius,
  }) : super(
          child: Text(
            title,
            style: const TextStyle(color: Colors.white), // Texto sempre branco
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor ?? Colors.green, // Cor verde
            elevation: elevation ?? 2.0,
            shape: RoundedRectangleBorder(
              borderRadius:
                  borderRadius ?? BorderRadius.circular(30.0), // Raio padrão
            ),
          ),
        );

  VRButtonElevated.successIcon({
    super.key,
    required VoidCallback super.onPressed,
    required String title,
    required BuildContext context,
    required IconData icon,
    Color? backgroundColor,
    double? elevation,
    BorderRadiusGeometry? borderRadius,
  }) : super(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                color: Colors.white,
              ),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor ?? Colors.green, // Cor verde
            elevation: elevation ?? 2.0,
            shape: RoundedRectangleBorder(
              borderRadius:
                  borderRadius ?? BorderRadius.circular(30.0), // Raio padrão
            ),
          ),
        );
}
