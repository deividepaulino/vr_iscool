import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:vr_iscool/core/shared/presenter/widgets/buttons/elevated_buttom/elevated_buttom_widget.dart';

class GenericFailPage extends StatefulWidget {
  final String msg;
  final void Function() onTryAgain;
  const GenericFailPage(
      {super.key, required this.msg, required this.onTryAgain});

  @override
  State<GenericFailPage> createState() => _GenericFailPageState();
}

class _GenericFailPageState extends State<GenericFailPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Lottie.asset('assets/animations/fail_ice_cream.json', height: 300),
          Text(
            widget.msg,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context).colorScheme.error,
                ),
          ),
          const SizedBox(height: 16),
          VRButtonElevated.icon(
            icon: Icons.refresh,
            context: context,
            onPressed: widget.onTryAgain,
            title: 'Tentar novamente',
          ),
        ],
      ),
    );
  }
}
