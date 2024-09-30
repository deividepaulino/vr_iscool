import 'package:asp/asp.dart';
import 'package:vr_iscool/modules/course_module/presenter/states/course_states.dart';

class CourseAtoms {
  final state = Atom<CourseStates>(CourseLoadingState());

  final getCourseList = Atom.action();

  final getTopCourseList = Atom.action();

  dispose() {
    getCourseList.dispose();
  }
}
