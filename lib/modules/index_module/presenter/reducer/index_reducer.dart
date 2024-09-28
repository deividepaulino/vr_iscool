import 'package:asp/asp.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:vr_iscool/modules/index_module/infra/datasources/top_course_get_list_datasource.dart';
import 'package:vr_iscool/modules/index_module/presenter/atoms/index_atoms.dart';
import 'package:vr_iscool/modules/index_module/presenter/states/index_states.dart';

class IndexReducer extends Reducer {
  final TopCourseGetListDataSource topCourseGetListDataSource;

  final indexAtoms = Modular.get<IndexAtoms>();

  IndexReducer(this.topCourseGetListDataSource) {
    on(() => [indexAtoms.getTopCourseList], _getTopCourseList);
  }

  void _getTopCourseList() async {
    final res = await topCourseGetListDataSource([]);

    res.fold(
      (success) async {
        await Future.delayed(const Duration(seconds: 2));
        indexAtoms.state.value = IndexSuccessState(success);
      },
      (error) => {
        indexAtoms.state.value = IndexErrorState(error.message),
      },
    );
  }
}
