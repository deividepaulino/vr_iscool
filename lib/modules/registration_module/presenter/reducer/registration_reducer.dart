import 'package:asp/asp.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:vr_iscool/modules/registration_module/infra/datasources/registration_delete_datasource.dart';
import 'package:vr_iscool/modules/registration_module/infra/datasources/registration_get_list_datasource.dart';
import 'package:vr_iscool/modules/registration_module/presenter/atoms/registration_atoms.dart';
import 'package:vr_iscool/modules/registration_module/presenter/states/registration_states.dart';

class RegistrationReducer extends Reducer {
  final RegistrationGetListDataSource registrationGetListDataSource;
  final RegistrationDeleteDataSource registrationDeleteDataSource;

  final registrationAtoms = Modular.get<RegistrationAtoms>();

  RegistrationReducer(
    this.registrationGetListDataSource,
    this.registrationDeleteDataSource,
  ) {
    on(() => [registrationAtoms.getRegistrationList], _getRegistrationList);
    on(() => [registrationAtoms.deleteRegistrationAction], _deleteRegistration);
  }

  void _getRegistrationList() async {
    final res = await registrationGetListDataSource([]);

    res.fold(
      (success) async {
        await Future.delayed(const Duration(seconds: 2));
        registrationAtoms.state.value = RegistrationSuccessState(success);
      },
      (error) => {
        registrationAtoms.state.value = RegistrationErrorState(error.message),
      },
    );
  }

  void _deleteRegistration() async {
    final res = await registrationDeleteDataSource(
        registrationAtoms.deleteRegistrationAction.value);

    registrationAtoms.state.value = RegistrationLoadingState();
    res.fold(
      (success) async {
        registrationAtoms.snackText.value = 'Aluno deletado com sucesso';
        registrationAtoms.showSnackBar.setValue(true);
        registrationAtoms.getRegistrationList();
      },
      (error) => {
        registrationAtoms.state.value = RegistrationErrorState(error.message),
      },
    );
  }
}
