import 'package:asp/asp.dart';
import 'package:vr_iscool/modules/registration_module/domain/entities/registration_entity.dart';
import 'package:vr_iscool/modules/registration_module/presenter/states/registration_states.dart';

class RegistrationAtoms {
  final state = Atom<RegistrationStates>(RegistrationLoadingState());

  final showSnackBar = Atom<bool>(false);
  final snackText = Atom<String>('');

  final getRegistrationList = Atom.action();

  final deleteRegistrationAction =
      Atom<RegistrationEntity>(RegistrationEntity.empty());

  dispose() {
    getRegistrationList.dispose();
  }
}
