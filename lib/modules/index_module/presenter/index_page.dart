import 'package:asp/asp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lottie/lottie.dart';
import 'package:vr_iscool/core/shared/presenter/pages/generic_fail_page.dart';
import 'package:vr_iscool/core/shared/presenter/pages/generic_loading_page.dart';
import 'package:vr_iscool/core/shared/presenter/widgets/bottom_navigator_bar/bottom_nav_bar_widget.dart';
import 'package:vr_iscool/core/shared/presenter/widgets/course_card_widget/course_card_widget.dart';
import 'package:vr_iscool/modules/course_module/domain/entities/course_entity.dart';
import 'package:vr_iscool/modules/index_module/presenter/atoms/index_atoms.dart';
import 'package:vr_iscool/modules/index_module/presenter/states/index_states.dart';
import 'package:vr_iscool/modules/index_module/presenter/widgets/teachers_widget.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({super.key});

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  final indexAtoms = Modular.get<IndexAtoms>();

  @override
  void initState() {
    indexAtoms.getTopCourseList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = context.select(() => indexAtoms.state.value);

    return Scaffold(
      bottomNavigationBar: const CustomBottomMenu(),
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(Icons.notifications,
                  color: Theme.of(context).primaryColor),
              onPressed: () {}),
        ],
        title: const Text('Olá Deivide!'),
      ),
      body: switch (state) {
        IndexLoadingState _ => const GenericLoadingPage(),
        IndexSuccessState state => _buildSuccess(state.topCourses),
        IndexErrorState state => GenericFailPage(
            msg: state.message,
            onTryAgain: () {
              indexAtoms.getTopCourseList();
            },
          ),
      },
    );
  }

  _buildSuccess(List<CourseEntity> topCourses) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 32),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: LayoutBuilder(
                  builder: (context, constraints) => Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    width: constraints.maxWidth,
                    height: 130,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Toda oportunidade é ',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            Row(
                              children: [
                                Text(
                                  'um novo',
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                Text(
                                  ' aprendizado!',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                        color: Theme.of(context).primaryColor,
                                      ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            //rotate widget
            Positioned(
              right: -10,
              child: Transform.rotate(
                angle: 0.4,
                child: Lottie.asset('assets/animations/cat.json', width: 110),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8),
          child: Text(
            'Cursos populares',
            style: Theme.of(context).textTheme.displayMedium,
          ),
        ),
        if (topCourses.isEmpty)
          const Center(child: Text('Nenhum curso disponível')),
        if (topCourses.isNotEmpty)
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: List.generate(
                  topCourses.length,
                  (index) => CourseCardWidget(
                    topCourseEntity: topCourses[index],
                  ),
                ),
              ),
            ),
          ),
        Padding(
          padding: const EdgeInsets.only(left: 24.0, top: 8),
          child: Text(
            'Professores disponiveis',
            style: Theme.of(context).textTheme.displayMedium,
          ),
        ),
        const TeachersWidget(),
      ],
    );
  }
}
