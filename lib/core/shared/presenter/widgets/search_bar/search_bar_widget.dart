import 'package:flutter/material.dart';

class VrFilterWidget extends StatefulWidget {
  const VrFilterWidget({super.key});

  @override
  State<VrFilterWidget> createState() => _VrFilterWidgetState();
}

class _VrFilterWidgetState extends State<VrFilterWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 45,
        width: 280,
        child: TextFormField(
          onChanged: (v) {},
          decoration: InputDecoration(
            hintText: 'Pesquisar',
            hintStyle: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.5),
            ),
            suffixIcon: InkWell(
              onTap: () {},
              child: const Icon(Icons.search, color: Colors.white),
            ),
            filled: true,
            fillColor: Colors.transparent,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.surface.withOpacity(0.7),
                width: 1, // Largura da borda
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.surface.withOpacity(0.7),
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.surface.withOpacity(0.7),
                width: 1,
              ),
            ),
          ),
          style: const TextStyle(
            color: Colors.white,
          ),
        ));
  }
}
