import 'package:asp/asp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:vr_iscool/core/shared/presenter/pages/generic_fail_page.dart';
import 'package:vr_iscool/core/shared/presenter/pages/generic_loading_page.dart';
import 'package:vr_iscool/core/shared/presenter/widgets/bottom_navigator_bar/bottom_nav_bar_widget.dart';
import 'package:vr_iscool/core/shared/presenter/widgets/search_bar/search_bar_widget.dart';
import 'package:vr_iscool/modules/course_module/domain/entities/course_entity.dart';
import 'package:vr_iscool/modules/course_module/presenter/atoms/course_atoms.dart';
import 'package:vr_iscool/modules/course_module/presenter/states/course_states.dart';
import 'package:vr_iscool/modules/course_module/presenter/widgets/course_card_widget.dart';

class CoursePage extends StatefulWidget {
  const CoursePage({super.key});

  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  final courseAtoms = Modular.get<CourseAtoms>();

  @override
  void initState() {
    courseAtoms.getCourseList();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = context.select(() => courseAtoms.state.value);

    return Scaffold(
      bottomNavigationBar: const CustomBottomMenu(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
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
            onPressed: () {},
          ),
        ],
        title: Text(
          'Meus cursos',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.surface,
              ),
        ),
      ),
      body: switch (state) {
        CourseLoadingState _ => const GenericLoadingPage(),
        CourseSuccessState state => _buildSuccess(state.courses),
        CourseErrorState state => GenericFailPage(
            msg: state.message,
            onTryAgain: () {
              courseAtoms.getCourseList();
            },
          ),
      },
    );
  }

  _buildSuccess(List<CourseEntity> courses) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
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
        if (courses.isEmpty)
          const Center(child: Text('Nenhum curso disponível')),
        if (courses.isNotEmpty)
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: List.generate(
                  courses.length,
                  (index) => CourseCardWidget(
                    courseEntity: courses[index],
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
