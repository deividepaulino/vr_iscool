import 'package:vr_iscool/core/shared/domain/usecases/get_usecase.dart';
import 'package:vr_iscool/modules/course_module/domain/entities/course_entity.dart';
import 'package:vr_iscool/modules/course_module/domain/repositories/course_get_repository.dart';
import 'package:vr_iscool/modules/course_module/domain/typedefs/course_entity_result.dart';

class CourseGetUsecaseImpl
    implements GetUsecase<CourseEntityResult, CourseEntity> {
  final CourseGetRepository _topCourseGetRepository;

  CourseGetUsecaseImpl(this._topCourseGetRepository);

  @override
  CourseEntityResult call(CourseEntity entity) {
    return _topCourseGetRepository(entity);
  }
}
