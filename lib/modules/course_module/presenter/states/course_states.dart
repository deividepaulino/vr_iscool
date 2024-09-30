import 'package:vr_iscool/modules/course_module/domain/entities/course_entity.dart';

sealed class CourseStates {}

class CourseLoadingState extends CourseStates {}

class CourseSuccessState extends CourseStates {
  final List<CourseEntity> courses;

  CourseSuccessState(this.courses);
}

class CourseErrorState extends CourseStates {
  final String message;

  CourseErrorState(this.message);
}
