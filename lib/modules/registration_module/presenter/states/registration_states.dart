import 'package:vr_iscool/modules/registration_module/domain/entities/registration_entity.dart';

sealed class RegistrationStates {}

class RegistrationLoadingState extends RegistrationStates {}

class RegistrationSuccessState extends RegistrationStates {
  final List<RegistrationEntity> registrations;

  RegistrationSuccessState(this.registrations);
}

class RegistrationErrorState extends RegistrationStates {
  final String message;

  RegistrationErrorState(this.message);
}
