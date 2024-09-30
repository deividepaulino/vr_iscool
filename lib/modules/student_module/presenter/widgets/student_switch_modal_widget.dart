import 'package:asp/asp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:vr_iscool/core/shared/presenter/widgets/buttons/elevated_buttom/elevated_buttom_widget.dart';
import 'package:vr_iscool/core/shared/presenter/widgets/buttons/outlined_buttom/outlined_buttom_widget.dart';
import 'package:vr_iscool/modules/course_module/domain/entities/course_entity.dart';
import 'package:vr_iscool/modules/course_module/presenter/atoms/course_atoms.dart';
import 'package:vr_iscool/modules/course_module/presenter/states/course_states.dart';
import 'package:vr_iscool/modules/student_module/domain/entities/student_entity.dart';
import 'package:vr_iscool/modules/student_module/presenter/atoms/student_atoms.dart';

class StudentSwitchModalWidget extends StatefulWidget {
  final StudentEntity student;
  const StudentSwitchModalWidget({
    super.key,
    required this.student,
  });

  @override
  State<StudentSwitchModalWidget> createState() =>
      _StudentSwitchModalWidgetState();
}

class _StudentSwitchModalWidgetState extends State<StudentSwitchModalWidget> {
  final courseAtoms = Modular.get<CourseAtoms>();
  final studentAtoms = Modular.get<StudentAtoms>();

  CourseEntity selectedCourse = CourseEntity.empty();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      courseAtoms.getCourseList();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = context.select(() => courseAtoms.state.value);

    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      insetPadding: const EdgeInsets.all(0),
      title: Text(
        'Selecione o novo curso',
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.bold,
            ),
      ),
      content: switch (state) {
        CourseLoadingState _ => const Center(
            heightFactor: 1,
            child: CircularProgressIndicator(),
          ),
        CourseSuccessState state => _buildSuccess(state.courses),
        CourseErrorState state => Center(child: Text(state.message)),
      },
      actions: [
        VRButtonOutlined.icon(
            onPressed: () {
              Modular.to.pop();
            },
            title: 'Cancelar',
            context: context,
            icon: Icons.cancel),
        VRButtonElevated.successIcon(
            size: const Size(60, 40),
            onPressed: () {
              studentAtoms.patchStudentAction.setValue(
                StudentEntity(
                    id: widget.student.id,
                    name: widget.student.name,
                    courseId: selectedCourse.id),
              );
              Modular.to.pop();
            },
            title: 'Confirmar',
            context: context,
            icon: Icons.check),
      ],
    );
  }

  _buildSuccess(List<CourseEntity> courses) {
    return Container(
      height: 250,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Theme.of(context).primaryColor,
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 1.0),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: courses.length,
          itemBuilder: (context, index) {
            final course = courses[index];
            return ListTile(
              tileColor: selectedCourse == course
                  ? Theme.of(context).primaryColor
                  : null,
              title: Text(course.descricao),
              onTap: () {
                setState(() {
                  selectedCourse = course;
                });
              },
            );
          },
        ),
      ),
    );
  }
}
