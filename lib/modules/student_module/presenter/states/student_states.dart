import 'package:vr_iscool/modules/student_module/domain/entities/student_entity.dart';

sealed class StudentStates {}

class StudentLoadingState extends StudentStates {}

class StudentSuccessState extends StudentStates {
  final List<StudentEntity> students;

  StudentSuccessState(this.students);
}

class StudentErrorState extends StudentStates {
  final String message;

  StudentErrorState(this.message);
}
