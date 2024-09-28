import 'package:asp/asp.dart';
import 'package:vr_iscool/modules/index_module/presenter/states/index_states.dart';

class IndexAtoms {
  final state = Atom<IndexStates>(IndexErrorState('Falha'));

  final getTopCourseList = Atom.action();

  dispose() {
    getTopCourseList.dispose();
  }
}
