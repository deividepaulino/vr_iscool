import 'package:asp/asp.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:vr_iscool/modules/index_module/infra/datasources/top_course_get_list_datasource.dart';
import 'package:vr_iscool/modules/index_module/presenter/atoms/index_atoms.dart';

class IndexReducer extends Reducer {
  final TopCourseGetListDataSource topCourseGetListDataSource;

  final indexAtoms = Modular.get<IndexAtoms>();

  IndexReducer(this.topCourseGetListDataSource) {
    on(() => [indexAtoms.getTopCourseList], _getTopCourseList);
  }

  void _getTopCourseList() {}
}
