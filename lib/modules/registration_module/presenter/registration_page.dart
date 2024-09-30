import 'package:asp/asp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:vr_iscool/core/shared/presenter/pages/generic_fail_page.dart';
import 'package:vr_iscool/core/shared/presenter/pages/generic_loading_page.dart';
import 'package:vr_iscool/core/shared/presenter/widgets/bottom_navigator_bar/bottom_nav_bar_widget.dart';
import 'package:vr_iscool/core/shared/presenter/widgets/search_bar/search_bar_widget.dart';
import 'package:vr_iscool/modules/registration_module/domain/entities/registration_entity.dart';
import 'package:vr_iscool/modules/registration_module/presenter/atoms/registration_atoms.dart';
import 'package:vr_iscool/modules/registration_module/presenter/states/registration_states.dart';
import 'package:vr_iscool/modules/registration_module/presenter/widgets/registration_card_widget.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final registrationAtoms = Modular.get<RegistrationAtoms>();

  @override
  void initState() {
    registrationAtoms.getRegistrationList();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = context.select(() => registrationAtoms.state.value);

    rxObserver(() {
      if (registrationAtoms.showSnackBar.value) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Theme.of(context).colorScheme.tertiary,
            content: Text(registrationAtoms.snackText.value),
            duration: const Duration(seconds: 2),
          ),
        );
        registrationAtoms.showSnackBar.setValue(false);
      }
    });

    return Scaffold(
      bottomNavigationBar: const CustomBottomMenu(),
      appBar: AppBar(
        backgroundColor: Colors.deepPurple.shade700,
        automaticallyImplyLeading: false,
        title: Text(
          'Matriculas',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.surface,
              ),
        ),
      ),
      body: switch (state) {
        RegistrationLoadingState _ => const GenericLoadingPage(),
        RegistrationSuccessState state => _buildSuccess(state.registrations),
        RegistrationErrorState state => GenericFailPage(
            msg: state.message,
            onTryAgain: () {
              registrationAtoms.getRegistrationList();
            },
          ),
      },
    );
  }

  _buildSuccess(List<RegistrationEntity> registrations) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.deepPurple.shade700,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                spreadRadius: 1,
                blurRadius: 3,
                offset: Offset(0, 1),
              ),
            ],
          ),
          width: double.maxFinite,
          height: 130,
          child: const Center(
            child: VrFilterWidget(),
          ),
        ),
        if (registrations.isEmpty)
          const Center(child: Text('Nenhum curso disponível')),
        if (registrations.isNotEmpty)
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: List.generate(
                  registrations.length,
                  (index) => RegistrationCardWidget(
                    registration: registrations[index],
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
