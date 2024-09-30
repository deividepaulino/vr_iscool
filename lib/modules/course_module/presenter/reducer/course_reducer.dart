import 'package:asp/asp.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:vr_iscool/modules/course_module/external/data/remote/top_course_get_list_datasource_remote_impl.dart';
import 'package:vr_iscool/modules/course_module/infra/datasources/course_get_list_datasource.dart';
import 'package:vr_iscool/modules/course_module/presenter/atoms/course_atoms.dart';
import 'package:vr_iscool/modules/course_module/presenter/states/course_states.dart';

class CourseReducer extends Reducer {
  final CourseGetListDataSource courseGetListDataSource;
  final TopCourseGetListDataSourceRemoteImpl topCourseGetListDataSource;

  final indexAtoms = Modular.get<CourseAtoms>();

  CourseReducer(this.courseGetListDataSource, this.topCourseGetListDataSource) {
    on(() => [indexAtoms.getCourseList], _getCourseList);
    on(() => [indexAtoms.getTopCourseList], _getTopCourseList);
  }

  void _getCourseList() async {
    final res = await courseGetListDataSource([]);

    res.fold(
      (success) async {
        await Future.delayed(const Duration(seconds: 2));
        indexAtoms.state.value = CourseSuccessState(success);
      },
      (error) => {
        indexAtoms.state.value = CourseErrorState(error.message),
      },
    );
  }

  void _getTopCourseList() async {
    final res = await topCourseGetListDataSource([]);

    res.fold(
      (success) async {
        await Future.delayed(const Duration(seconds: 2));
        indexAtoms.state.value = CourseSuccessState(success);
      },
      (error) => {
        indexAtoms.state.value = CourseErrorState(error.message),
      },
    );
  }
}
