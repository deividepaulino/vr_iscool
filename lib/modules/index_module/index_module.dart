import 'package:flutter_modular/flutter_modular.dart';
import 'package:vr_iscool/modules/index_module/domain/usecases/top_course_get_list_usecase_impl.dart';
import 'package:vr_iscool/modules/index_module/domain/usecases/top_course_get_usecase_impl.dart';
import 'package:vr_iscool/modules/index_module/external/data/remote/top_course_get_list_datasource_remote_impl.dart';
import 'package:vr_iscool/modules/index_module/infra/repositories/car_get_repository_impl.dart';
import 'package:vr_iscool/modules/index_module/infra/repositories/top_course_get_list_repository_impl.dart';
import 'package:vr_iscool/modules/index_module/presenter/atoms/index_atoms.dart';
import 'package:vr_iscool/modules/index_module/presenter/index_page.dart';
import 'package:vr_iscool/modules/index_module/presenter/reducer/index_reducer.dart';

class IndexModuleX extends Module {
  @override
  List<Module> get imports => [];

  @override
  List<Bind> get binds => [
        Bind.singleton<IndexAtoms>(
          (i) => IndexAtoms(),
          onDispose: (atom) => atom.dispose(),
          export: true,
        ),
        Bind.singleton<IndexReducer>(
          (i) => IndexReducer(i()),
          onDispose: (atom) => atom.dispose(),
          export: true,
        ),
        Bind((i) => TopCourseGetListDataSourceRemoteImpl(i()), export: true),
        Bind((i) => TopCourseGetRepositoryImpl(i()), export: true),
        Bind((i) => TopCourseGetListRepositoryImpl(i()), export: true),
        Bind((i) => TopCourseGetUsecaseImpl(i()), export: true),
        Bind((i) => TopCourseGetListUsecaseImpl(i()), export: true),
      ];
}

class IndexModule extends Module {
  @override
  List<Module> get imports => [
        IndexModuleX(),
      ];

  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (_, args) => const IndexPage(),
        ),
      ];
}
