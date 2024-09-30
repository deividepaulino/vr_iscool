import 'package:vr_iscool/modules/course_module/domain/entities/course_entity.dart';

sealed class IndexStates {}

class IndexLoadingState extends IndexStates {}

class IndexSuccessState extends IndexStates {
  final List<CourseEntity> topCourses;

  IndexSuccessState(this.topCourses);
}

class IndexErrorState extends IndexStates {
  final String message;

  IndexErrorState(this.message);
}
