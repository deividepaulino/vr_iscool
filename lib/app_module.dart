import 'package:flutter_modular/flutter_modular.dart';
import 'package:vr_iscool/core/shared/utils/custom_dio.dart';
import 'package:vr_iscool/modules/course_module/course_module.dart';
import 'package:vr_iscool/modules/index_module/index_module.dart';
import 'package:vr_iscool/modules/login_module/login_module.dart';
import 'package:vr_iscool/modules/student_module/student_module.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [];

  @override
  List<Bind> get binds => [
        Bind(
          (i) => CustomDio().dio,
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/', module: LoginModule()),
        ModuleRoute(
          '/index/',
          module: IndexModule(),
          transition: TransitionType.leftToRight,
        ),
        ModuleRoute(
          '/student/',
          module: StudentModule(),
          transition: TransitionType.leftToRight,
        ),
        ModuleRoute(
          '/course/',
          module: CourseModule(),
          transition: TransitionType.leftToRight,
        ),
      ];
}
