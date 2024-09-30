import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:vr_iscool/core/shared/presenter/widgets/buttons/elevated_buttom/elevated_buttom_widget.dart';
import 'package:vr_iscool/core/shared/presenter/widgets/buttons/outlined_buttom/outlined_buttom_widget.dart';

class ConfirmModalWidget extends StatefulWidget {
  final Function() leftAction;
  final Function() rightAction;
  final String title;
  final String content;
  const ConfirmModalWidget(
      {super.key,
      required this.leftAction,
      required this.rightAction,
      required this.title,
      required this.content});

  @override
  State<ConfirmModalWidget> createState() => _ConfirmModalWidgetState();
}

class _ConfirmModalWidgetState extends State<ConfirmModalWidget> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      insetPadding: const EdgeInsets.all(0),
      title: Text(
        widget.title,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.bold,
            ),
      ),
      content: Text(
        widget.content,
        style: Theme.of(context).textTheme.displayMedium!.copyWith(
              fontWeight: FontWeight.w400,
            ),
      ),
      actions: [
        VRButtonOutlined.icon(
            onPressed: () {
              widget.leftAction();
              Modular.to.pop();
            },
            title: 'Remover',
            context: context,
            icon: Icons.delete),
        VRButtonElevated.successIcon(
            size: const Size(60, 40),
            onPressed: () {
              widget.rightAction();
              Navigator.of(context).pop();
            },
            title: 'Cancelar',
            context: context,
            icon: Icons.cancel),
      ],
    );
  }
}
