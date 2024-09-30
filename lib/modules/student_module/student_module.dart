import 'package:flutter_modular/flutter_modular.dart';
import 'package:vr_iscool/modules/course_module/course_module.dart';
import 'package:vr_iscool/modules/student_module/domain/usecases/student_delete_usecase_impl.dart';
import 'package:vr_iscool/modules/student_module/domain/usecases/student_get_list_usecase_impl.dart';
import 'package:vr_iscool/modules/student_module/domain/usecases/student_get_usecase_impl.dart';
import 'package:vr_iscool/modules/student_module/domain/usecases/student_patch_usecase_impl.dart';
import 'package:vr_iscool/modules/student_module/domain/usecases/student_post_usecase_impl.dart';
import 'package:vr_iscool/modules/student_module/external/data/remote/student_delete_datasource_remote_impl.dart';
import 'package:vr_iscool/modules/student_module/external/data/remote/student_get_list_datasource_remote_impl.dart';
import 'package:vr_iscool/modules/student_module/external/data/remote/student_patch_datasource_remote_impl.dart';
import 'package:vr_iscool/modules/student_module/external/data/remote/student_post_datasource_remote_impl.dart';

import 'package:vr_iscool/modules/student_module/infra/repositories/student_delete_repository_impl.dart';
import 'package:vr_iscool/modules/student_module/infra/repositories/student_get_list_repository_impl.dart';
import 'package:vr_iscool/modules/student_module/infra/repositories/student_patch_repository_impl.dart';
import 'package:vr_iscool/modules/student_module/infra/repositories/student_post_repository_impl.dart';
import 'package:vr_iscool/modules/student_module/infra/repositories/student_repository_impl.dart';
import 'package:vr_iscool/modules/student_module/presenter/atoms/student_atoms.dart';
import 'package:vr_iscool/modules/student_module/presenter/student_page.dart';
import 'package:vr_iscool/modules/student_module/presenter/reducer/student_reducer.dart';

class StudentModuleX extends Module {
  @override
  List<Module> get imports => [];

  @override
  List<Bind> get binds => [
        Bind.singleton<StudentAtoms>(
          (i) => StudentAtoms(),
          onDispose: (atom) => atom.dispose(),
          export: true,
        ),
        Bind.singleton<StudentReducer>(
          (i) => StudentReducer(
            i(),
            i(),
            i(),
            i(),
          ),
          onDispose: (atom) => atom.dispose(),
          export: true,
        ),
        Bind((i) => StudentGetListDataSourceRemoteImpl(i()), export: true),
        Bind((i) => StudentDeleteDataSourceRemoteImpl(i()), export: true),
        Bind((i) => StudentPostDataSourceRemoteImpl(i()), export: true),
        Bind((i) => StudentPatchDataSourceRemoteImpl(i()), export: true),
        Bind((i) => StudentGetRepositoryImpl(i()), export: true),
        Bind((i) => StudentDeleteRepositoryImpl(i()), export: true),
        Bind((i) => StudentPostRepositoryImpl(i()), export: true),
        Bind((i) => StudentPatchRepositoryImpl(i()), export: true),
        Bind((i) => StudentGetListRepositoryImpl(i()), export: true),
        Bind((i) => StudentGetUsecaseImpl(i()), export: true),
        Bind((i) => StudentDeleteUsecaseImpl(i()), export: true),
        Bind((i) => StudentPostUsecaseImpl(i()), export: true),
        Bind((i) => StudentPatchUsecaseImpl(i()), export: true),
        Bind((i) => StudentGetListUsecaseImpl(i()), export: true),
      ];
}

class StudentModule extends Module {
  @override
  List<Module> get imports => [
        StudentModuleX(),
        CourseModuleX(),
      ];

  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (_, args) => const StudentPage(),
        ),
      ];
}
