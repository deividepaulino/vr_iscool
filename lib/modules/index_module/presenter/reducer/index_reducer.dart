import 'package:asp/asp.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:vr_iscool/modules/course_module/presenter/atoms/course_atoms.dart';
import 'package:vr_iscool/modules/course_module/presenter/states/course_states.dart';
import 'package:vr_iscool/modules/index_module/presenter/atoms/index_atoms.dart';
import 'package:vr_iscool/modules/index_module/presenter/states/index_states.dart';

class IndexReducer extends Reducer {
  final indexAtoms = Modular.get<IndexAtoms>();

  final courseAtoms = Modular.get<CourseAtoms>();

  IndexReducer() {
    on(() => [indexAtoms.getTopCourseList], _getTopCourseList);
  }

  void _getTopCourseList() async {
    indexAtoms.state.value = IndexLoadingState();
    courseAtoms.getTopCourseList.call();

    while (courseAtoms.state.value is CourseLoadingState) {
      await Future.delayed(const Duration(milliseconds: 100));
    }

    if (courseAtoms.state.value is CourseSuccessState) {
      indexAtoms.state.value = IndexSuccessState(
        (courseAtoms.state.value as CourseSuccessState).courses,
      );
      return;
    }
    indexAtoms.state.value = IndexErrorState(
      (courseAtoms.state.value as CourseErrorState).message,
    );
  }
}
