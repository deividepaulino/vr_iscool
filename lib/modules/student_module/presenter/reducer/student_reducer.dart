import 'package:asp/asp.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:vr_iscool/modules/student_module/infra/datasources/student_delete_datasource.dart';
import 'package:vr_iscool/modules/student_module/infra/datasources/student_get_list_datasource.dart';
import 'package:vr_iscool/modules/student_module/infra/datasources/student_patch_datasource.dart';
import 'package:vr_iscool/modules/student_module/infra/datasources/student_post_datasource.dart';
import 'package:vr_iscool/modules/student_module/presenter/atoms/student_atoms.dart';
import 'package:vr_iscool/modules/student_module/presenter/states/student_states.dart';

class StudentReducer extends Reducer {
  final StudentGetListDataSource studentGetListDataSource;
  final StudentDeleteDataSource studentDeleteDataSource;
  final StudentPostDataSource studentPostDataSource;
  final StudentPatchDataSource studentPatchDataSource;

  final studentAtoms = Modular.get<StudentAtoms>();

  StudentReducer(this.studentGetListDataSource, this.studentDeleteDataSource,
      this.studentPostDataSource, this.studentPatchDataSource) {
    on(() => [studentAtoms.getStudentList], _getStudentList);
    on(() => [studentAtoms.deleteStudentAction], _deleteStudent);
    on(() => [studentAtoms.postCurseAction], _postStudent);
    on(() => [studentAtoms.patchStudentAction], _patchStudent);
  }

  void _getStudentList() async {
    final res = await studentGetListDataSource([]);

    res.fold(
      (success) async {
        await Future.delayed(const Duration(seconds: 2));
        studentAtoms.state.value = StudentSuccessState(success);
      },
      (error) => {
        studentAtoms.state.value = StudentErrorState(error.message),
      },
    );
  }

  void _postStudent() async {
    final res = await studentPostDataSource(studentAtoms.postCurseAction.value);

    studentAtoms.state.value = StudentLoadingState();
    res.fold(
      (success) async {
        studentAtoms.getStudentList();
        studentAtoms.snackText.value = 'Aluno cadastrado com sucesso';
        studentAtoms.showSnackBar.setValue(true);
      },
      (error) => {
        studentAtoms.state.value = StudentErrorState(error.message),
      },
    );
  }

  void _deleteStudent() async {
    final res =
        await studentDeleteDataSource(studentAtoms.deleteStudentAction.value);

    studentAtoms.state.value = StudentLoadingState();
    res.fold(
      (success) async {
        studentAtoms.snackText.value = 'Aluno deletado com sucesso';
        studentAtoms.showSnackBar.setValue(true);
        studentAtoms.getStudentList();
      },
      (error) => {
        studentAtoms.state.value = StudentErrorState(error.message),
      },
    );
  }

  void _patchStudent() async {
    final res =
        await studentPatchDataSource(studentAtoms.patchStudentAction.value);

    studentAtoms.state.value = StudentLoadingState();
    res.fold(
      (success) async {
        studentAtoms.snackText.value = 'Aluno atualizado com sucesso';
        studentAtoms.showSnackBar.setValue(true);
        studentAtoms.getStudentList();
      },
      (error) => {
        studentAtoms.state.value = StudentErrorState(error.message),
      },
    );
  }
}
