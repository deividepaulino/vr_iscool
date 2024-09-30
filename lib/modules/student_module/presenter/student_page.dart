import 'package:asp/asp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lottie/lottie.dart';
import 'package:vr_iscool/core/shared/presenter/pages/generic_fail_page.dart';
import 'package:vr_iscool/core/shared/presenter/pages/generic_loading_page.dart';
import 'package:vr_iscool/core/shared/presenter/widgets/bottom_navigator_bar/bottom_nav_bar_widget.dart';
import 'package:vr_iscool/core/shared/presenter/widgets/search_bar/search_bar_widget.dart';
import 'package:vr_iscool/modules/student_module/domain/entities/student_entity.dart';
import 'package:vr_iscool/modules/student_module/presenter/atoms/student_atoms.dart';
import 'package:vr_iscool/modules/student_module/presenter/states/student_states.dart';
import 'package:vr_iscool/modules/student_module/presenter/widgets/student_card_widget.dart';
import 'package:vr_iscool/modules/student_module/presenter/widgets/student_course_form_widget.dart';

class StudentPage extends StatefulWidget {
  const StudentPage({super.key});

  @override
  State<StudentPage> createState() => _StudentPageState();
}

class _StudentPageState extends State<StudentPage> {
  final studentAtoms = Modular.get<StudentAtoms>();

  @override
  void initState() {
    studentAtoms.getStudentList();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = context.select(() => studentAtoms.state.value);

    rxObserver(() {
      if (studentAtoms.showSnackBar.value) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Theme.of(context).colorScheme.tertiary,
            content: Text(studentAtoms.snackText.value),
            duration: const Duration(seconds: 2),
          ),
        );
        studentAtoms.showSnackBar.setValue(false);
      }
    });

    return Scaffold(
      bottomNavigationBar: const CustomBottomMenu(),
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: Row(
              children: [
                Icon(Icons.add, color: Theme.of(context).colorScheme.surface),
                Text(
                  'Adicionar',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Theme.of(context).colorScheme.surface),
                ),
              ],
            ),
            onPressed: () {
              //show modal botom sheet
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) {
                  return const AddStudentFormWidget();
                },
              );
            },
          ),
        ],
        title: Text(
          'Meus alunos',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.surface,
              ),
        ),
      ),
      body: switch (state) {
        StudentLoadingState _ => const GenericLoadingPage(),
        StudentSuccessState state => _buildSuccess(state.students),
        StudentErrorState state => GenericFailPage(
            msg: state.message,
            onTryAgain: () {
              studentAtoms.getStudentList();
            },
          ),
      },
    );
  }

  _buildSuccess(List<StudentEntity> students) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.blue.shade900,
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
        if (students.isEmpty)
          Center(
            child: Column(
              children: [
                Lottie.asset('assets/animations/empty.json', height: 200),
                const Text('Nenhuma matrícula encontrada!'),
                const SizedBox(height: 32),
              ],
            ),
          ),
        if (students.isNotEmpty)
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: List.generate(
                  students.length,
                  (index) => StudentCardWidget(
                    student: students[index],
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
