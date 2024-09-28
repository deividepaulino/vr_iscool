import 'package:vr_iscool/modules/index_module/domain/entities/top_coruse_entity.dart';

sealed class IndexStates {}

class IndexLoadingState extends IndexStates {}

class IndexSuccessState extends IndexStates {
  final List<TopCourseEntity> topCourses;

  IndexSuccessState(this.topCourses);
}

class IndexErrorState extends IndexStates {
  final String message;

  IndexErrorState(this.message);
}
