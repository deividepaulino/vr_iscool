import 'package:flutter_modular/flutter_modular.dart';
import 'package:vr_iscool/modules/login_module/presenter/quick_start_page.dart';

class LoginModule extends Module {
  @override
  List<Module> get imports => [];

  @override
  void routes(r) {
    r.child('/', child: (context) => const QuickStartPage());
  }
}
