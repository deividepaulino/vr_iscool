import 'package:flutter/material.dart';

class VRTextFormField extends StatelessWidget {
  final String title;
  final String hintText;
  final BuildContext context;
  final double? elevation;
  final BorderRadiusGeometry? borderRadius;

  final String? Function(String?)? validator;
  final void Function(String)? onFieldSubmitted;

  final TextEditingController controller;

  const VRTextFormField({
    super.key,
    required this.title,
    required this.hintText,
    required this.context,
    this.elevation,
    this.borderRadius,
    this.validator,
    this.onFieldSubmitted,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start, // Alinha o título à esquerda
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            title,
            style: Theme.of(context).textTheme.displaySmall,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: Theme.of(context).textTheme.displayMedium!.copyWith(
                  color: Colors.black26,
                  fontWeight: FontWeight.w400,
                ),
            filled: true,
            fillColor: Theme.of(context).colorScheme.surface,
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.secondary,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
          ),
          controller: controller,
          validator: validator,
          onFieldSubmitted: onFieldSubmitted,
        ),
      ],
    );
  }
}
