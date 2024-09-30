import 'package:flutter_modular/flutter_modular.dart';
import 'package:vr_iscool/modules/course_module/course_module.dart';
import 'package:vr_iscool/modules/registration_module/domain/usecases/registration_delete_usecase_impl.dart';
import 'package:vr_iscool/modules/registration_module/domain/usecases/registration_get_list_usecase_impl.dart';
import 'package:vr_iscool/modules/registration_module/external/data/remote/registration_delete_datasource_remote_impl.dart';
import 'package:vr_iscool/modules/registration_module/external/data/remote/registration_get_list_datasource_remote_impl.dart';

import 'package:vr_iscool/modules/registration_module/infra/repositories/registration_delete_repository_impl.dart';
import 'package:vr_iscool/modules/registration_module/infra/repositories/registration_get_list_repository_impl.dart';
import 'package:vr_iscool/modules/registration_module/presenter/atoms/registration_atoms.dart';
import 'package:vr_iscool/modules/registration_module/presenter/registration_page.dart';
import 'package:vr_iscool/modules/registration_module/presenter/reducer/registration_reducer.dart';

class RegistrationModuleX extends Module {
  @override
  List<Module> get imports => [];

  @override
  List<Bind> get binds => [
        Bind.singleton<RegistrationAtoms>(
          (i) => RegistrationAtoms(),
          onDispose: (atom) => atom.dispose(),
          export: true,
        ),
        Bind.singleton<RegistrationReducer>(
          (i) => RegistrationReducer(
            i(),
            i(),
          ),
          onDispose: (atom) => atom.dispose(),
          export: true,
        ),
        Bind((i) => RegistrationGetListDataSourceRemoteImpl(i()), export: true),
        Bind((i) => RegistrationDeleteDataSourceRemoteImpl(i()), export: true),
        Bind((i) => RegistrationDeleteRepositoryImpl(i()), export: true),
        Bind((i) => RegistrationGetListRepositoryImpl(i()), export: true),
        Bind((i) => RegistrationDeleteUsecaseImpl(i()), export: true),
        Bind((i) => RegistrationGetListUsecaseImpl(i()), export: true),
      ];
}

class RegistrationModule extends Module {
  @override
  List<Module> get imports => [
        RegistrationModuleX(),
        CourseModuleX(),
      ];

  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (_, args) => const RegistrationPage(),
        ),
      ];
}
