import 'package:asp/asp.dart';
import 'package:vr_iscool/modules/course_module/domain/entities/course_entity.dart';
import 'package:vr_iscool/modules/course_module/presenter/states/course_states.dart';

class CourseAtoms {
  final state = Atom<CourseStates>(CourseLoadingState());

  final showSnackBar = Atom<bool>(false);
  final snackText = Atom<String>('');

  final getCourseList = Atom.action();

  final deleteCourseAction = Atom<CourseEntity>(CourseEntity.empty());

  final postCurseAction = Atom<CourseEntity>(CourseEntity.empty());

  final putCurseAction = Atom<CourseEntity>(CourseEntity.empty());

  final getTopCourseList = Atom.action();

  dispose() {
    getCourseList.dispose();
  }
}
