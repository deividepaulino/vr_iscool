import 'package:asp/asp.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:vr_iscool/modules/course_module/external/data/remote/top_course_get_list_datasource_remote_impl.dart';
import 'package:vr_iscool/modules/course_module/infra/datasources/course_delete_datasource.dart';
import 'package:vr_iscool/modules/course_module/infra/datasources/course_get_list_datasource.dart';
import 'package:vr_iscool/modules/course_module/infra/datasources/course_post_datasource.dart';
import 'package:vr_iscool/modules/course_module/presenter/atoms/course_atoms.dart';
import 'package:vr_iscool/modules/course_module/presenter/states/course_states.dart';

class CourseReducer extends Reducer {
  final CourseGetListDataSource courseGetListDataSource;
  final TopCourseGetListDataSourceRemoteImpl topCourseGetListDataSource;
  final CourseDeleteDataSource courseDeleteDataSource;
  final CoursePostDataSource coursePostDataSource;

  final courseAtoms = Modular.get<CourseAtoms>();

  CourseReducer(this.courseGetListDataSource, this.topCourseGetListDataSource,
      this.courseDeleteDataSource, this.coursePostDataSource) {
    on(() => [courseAtoms.getCourseList], _getCourseList);
    on(() => [courseAtoms.getTopCourseList], _getTopCourseList);
    on(() => [courseAtoms.deleteCourseAction], _deleteCourse);
    on(() => [courseAtoms.postCurseAction], _postCourse);
  }

  void _getCourseList() async {
    final res = await courseGetListDataSource([]);

    courseAtoms.state.value = CourseLoadingState();

    res.fold(
      (success) async {
        await Future.delayed(const Duration(milliseconds: 800));

        courseAtoms.state.value = CourseSuccessState(success);
      },
      (error) => {
        courseAtoms.state.value = CourseErrorState(error.message),
      },
    );
  }

  void _getTopCourseList() async {
    final res = await topCourseGetListDataSource([]);

    res.fold(
      (success) async {
        await Future.delayed(const Duration(seconds: 2));
        courseAtoms.state.value = CourseSuccessState(success);
      },
      (error) => {
        courseAtoms.state.value = CourseErrorState(error.message),
      },
    );
  }

  void _postCourse() async {
    final res = await coursePostDataSource(courseAtoms.postCurseAction.value);

    courseAtoms.state.value = CourseLoadingState();
    res.fold(
      (success) async {
        courseAtoms.getCourseList();
        courseAtoms.snackText.value = 'Curso cadastrado com sucesso';
        courseAtoms.showSnackBar.setValue(true);
      },
      (error) => {
        courseAtoms.state.value = CourseErrorState(error.message),
      },
    );
  }

  void _deleteCourse() async {
    final res =
        await courseDeleteDataSource(courseAtoms.deleteCourseAction.value);

    courseAtoms.state.value = CourseLoadingState();
    res.fold(
      (success) async {
        courseAtoms.snackText.value = 'Curso deletado com sucesso';
        courseAtoms.showSnackBar.setValue(true);
        courseAtoms.getCourseList();
      },
      (error) => {
        courseAtoms.state.value = CourseErrorState(error.message),
      },
    );
  }
}
