import 'package:flutter_modular/flutter_modular.dart';
import 'package:vr_iscool/modules/index_module/presenter/index_page.dart';

class IndexModule extends Module {
  @override
  List<Module> get imports => [];

  @override
  void routes(r) {
    r.child('/', child: (context) => const IndexPage());
  }
}
