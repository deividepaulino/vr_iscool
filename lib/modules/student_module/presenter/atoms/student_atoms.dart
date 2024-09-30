import 'package:asp/asp.dart';
import 'package:vr_iscool/modules/student_module/domain/entities/student_entity.dart';
import 'package:vr_iscool/modules/student_module/presenter/states/student_states.dart';

class StudentAtoms {
  final state = Atom<StudentStates>(StudentLoadingState());

  final showSnackBar = Atom<bool>(false);
  final snackText = Atom<String>('');

  final getStudentList = Atom.action();

  final deleteStudentAction = Atom<StudentEntity>(StudentEntity.empty());

  final postCurseAction = Atom<StudentEntity>(StudentEntity.empty());

  final patchStudentAction = Atom<StudentEntity>(StudentEntity.empty());

  dispose() {
    getStudentList.dispose();
  }
}
