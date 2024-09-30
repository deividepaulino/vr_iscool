import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:vr_iscool/core/shared/presenter/widgets/modals/confirm_modal/confirm_modal_widget.dart';
import 'package:vr_iscool/modules/registration_module/domain/entities/registration_entity.dart';
import 'package:vr_iscool/modules/registration_module/presenter/atoms/registration_atoms.dart';
import 'package:vr_iscool/modules/registration_module/presenter/widgets/registration_switch_modal_widget.dart';

class RegistrationCardWidget extends StatefulWidget {
  final RegistrationEntity registration;
  const RegistrationCardWidget({super.key, required this.registration});

  @override
  State<RegistrationCardWidget> createState() => _RegistrationCardWidgetState();
}

class _RegistrationCardWidgetState extends State<RegistrationCardWidget> {
  final registrationAtoms = Modular.get<RegistrationAtoms>();
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.84,
                  child: Row(
                    children: [
                      Text(
                        'Código: ${widget.registration.name}',
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      const SizedBox(width: 8),
                      SizedBox(
                        height: 20,
                        width: 60,
                        child: Chip(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          labelPadding:
                              const EdgeInsets.symmetric(horizontal: 4),
                          padding: const EdgeInsets.only(
                              bottom: 12, right: 8, left: 8),
                          label: Text(
                            'Ativo',
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall!
                                .copyWith(
                                  color: Theme.of(context).colorScheme.surface,
                                ),
                          ),
                          backgroundColor:
                              Theme.of(context).colorScheme.tertiary,
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return RegistrationSwitchModalWidget(
                                registration: widget.registration,
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Text(
                  'Nome:  ${widget.registration.name}',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                Text('Curso: ${widget.registration.course}',
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                          color: Theme.of(context).primaryColor,
                        )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
