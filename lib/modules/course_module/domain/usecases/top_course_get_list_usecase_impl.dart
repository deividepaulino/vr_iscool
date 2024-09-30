import 'package:vr_iscool/core/shared/domain/usecases/get_list_usecase.dart';
import 'package:vr_iscool/modules/course_module/domain/entities/course_entity.dart';
import 'package:vr_iscool/modules/course_module/domain/repositories/top_course_get_list_repository.dart';
import 'package:vr_iscool/modules/course_module/domain/typedefs/course_get_list_result.dart';

class TopCourseGetListUsecaseImpl
    implements GetListUsecase<CourseGetListResult, CourseEntity> {
  final TopCourseGetListRepository _repository;

  TopCourseGetListUsecaseImpl(this._repository);

  @override
  CourseGetListResult call(List<CourseEntity> entities) {
    return _repository(entities);
  }
}
