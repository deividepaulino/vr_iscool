import 'package:flutter/material.dart';

// Classe VRButtonOutlined estendendo OutlinedButton
class VRButtonOutlined extends OutlinedButton {
  VRButtonOutlined({
    super.key,
    required VoidCallback onPressed,
    required String title,
    required BuildContext context,
    double? elevation,
    BorderRadiusGeometry? borderRadius,
  }) : super(
          onPressed: onPressed,
          child: Text(
            title,
            style: TextStyle(color: Theme.of(context).primaryColor),
          ),
          style: OutlinedButton.styleFrom(
            backgroundColor: Colors.transparent,
            side: BorderSide(color: Theme.of(context).primaryColor, width: 2),
            elevation: elevation ?? 2.0,
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(30.0),
            ),
          ),
        );

  VRButtonOutlined.icon({
    super.key,
    required VoidCallback onPressed,
    required String title,
    required BuildContext context,
    required IconData icon,
    double? elevation,
    BorderRadiusGeometry? borderRadius,
  }) : super(
          onPressed: onPressed,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                color: Theme.of(context).primaryColor,
              ),
              const SizedBox(width: 8),
              Text(
                title,
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
            ],
          ),
          style: OutlinedButton.styleFrom(
            backgroundColor: Colors.transparent,
            side: BorderSide(color: Theme.of(context).primaryColor, width: 2),
            elevation: elevation ?? 2.0,
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(30.0),
            ),
          ),
        );

  VRButtonOutlined.success({
    super.key,
    required VoidCallback onPressed,
    required String title,
    required BuildContext context,
    double? elevation,
    BorderRadiusGeometry? borderRadius,
  }) : super(
          onPressed: onPressed,
          child: Text(
            title,
            style: const TextStyle(color: Colors.green),
          ),
          style: OutlinedButton.styleFrom(
            backgroundColor: Colors.transparent,
            side: const BorderSide(color: Colors.green, width: 2),
            elevation: elevation ?? 2.0,
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(30.0),
            ),
          ),
        );

  VRButtonOutlined.successIcon({
    super.key,
    required VoidCallback onPressed,
    required String title,
    required BuildContext context,
    required IconData icon,
    double? elevation,
    BorderRadiusGeometry? borderRadius,
  }) : super(
          onPressed: onPressed,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                color: Colors.green,
              ),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(color: Colors.green),
              ),
            ],
          ),
          style: OutlinedButton.styleFrom(
            backgroundColor: Colors.transparent,
            side: const BorderSide(color: Colors.green, width: 2),
            elevation: elevation ?? 2.0,
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(30.0),
            ),
          ),
        );
}
