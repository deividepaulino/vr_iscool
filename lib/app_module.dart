import 'package:flutter_modular/flutter_modular.dart';
import 'package:vr_iscool/modules/login_module/login_module.dart';

class AppModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.module(
      '/',
      module: LoginModule(),
      transition: TransitionType.rightToLeft,
    );
  }
}
