import 'package:flutter_modular/flutter_modular.dart';
import 'package:vr_iscool/modules/course_module/domain/usecases/course_get_list_usecase_impl.dart';
import 'package:vr_iscool/modules/course_module/domain/usecases/course_get_usecase_impl.dart';
import 'package:vr_iscool/modules/course_module/domain/usecases/top_course_get_list_usecase_impl.dart';
import 'package:vr_iscool/modules/course_module/external/data/remote/course_get_list_datasource_remote_impl.dart';
import 'package:vr_iscool/modules/course_module/external/data/remote/top_course_get_list_datasource_remote_impl.dart';
import 'package:vr_iscool/modules/course_module/infra/repositories/course_get_list_repository_impl.dart';
import 'package:vr_iscool/modules/course_module/infra/repositories/course_repository_impl.dart';
import 'package:vr_iscool/modules/course_module/infra/repositories/top_course_get_list_repository_impl.dart';
import 'package:vr_iscool/modules/course_module/presenter/atoms/course_atoms.dart';
import 'package:vr_iscool/modules/course_module/presenter/course_page.dart';
import 'package:vr_iscool/modules/course_module/presenter/reducer/course_reducer.dart';

class CourseModuleX extends Module {
  @override
  List<Module> get imports => [];

  @override
  List<Bind> get binds => [
        Bind.singleton<CourseAtoms>(
          (i) => CourseAtoms(),
          onDispose: (atom) => atom.dispose(),
          export: true,
        ),
        Bind.singleton<CourseReducer>(
          (i) => CourseReducer(i(), i()),
          onDispose: (atom) => atom.dispose(),
          export: true,
        ),
        Bind((i) => CourseGetListDataSourceRemoteImpl(i()), export: true),
        Bind((i) => CourseGetRepositoryImpl(i()), export: true),
        Bind((i) => CourseGetListRepositoryImpl(i()), export: true),
        Bind((i) => CourseGetUsecaseImpl(i()), export: true),
        Bind((i) => CourseGetListUsecaseImpl(i()), export: true),
        Bind((i) => TopCourseGetListDataSourceRemoteImpl(i()), export: true),
        Bind((i) => TopCourseGetListRepositoryImpl(i()), export: true),
        Bind((i) => TopCourseGetListRepositoryImpl(i()), export: true),
        Bind((i) => TopCourseGetListUsecaseImpl(i()), export: true),
      ];
}

class CourseModule extends Module {
  @override
  List<Module> get imports => [
        CourseModuleX(),
      ];

  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (_, args) => const CoursePage(),
        ),
      ];
}
