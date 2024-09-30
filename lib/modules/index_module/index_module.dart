import 'package:flutter_modular/flutter_modular.dart';
import 'package:vr_iscool/modules/course_module/course_module.dart';
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
          (i) => IndexReducer(),
          onDispose: (atom) => atom.dispose(),
          export: true,
        ),
      ];
}

class IndexModule extends Module {
  @override
  List<Module> get imports => [
        IndexModuleX(),
        CourseModuleX(),
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
