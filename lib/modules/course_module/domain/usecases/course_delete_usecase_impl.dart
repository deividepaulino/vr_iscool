import 'package:vr_iscool/core/shared/domain/usecases/delete_usecase.dart';
import 'package:vr_iscool/modules/course_module/domain/entities/course_entity.dart';
import 'package:vr_iscool/modules/course_module/domain/repositories/course_delete_repository%20copy.dart';
import 'package:vr_iscool/modules/course_module/domain/typedefs/course_entity_result.dart';

class CourseDeleteUsecaseImpl
    implements DeleteUsecase<CourseEntityResult, CourseEntity> {
  final CourseDeleteRepository _topCourseDeleteRepository;

  CourseDeleteUsecaseImpl(this._topCourseDeleteRepository);

  @override
  CourseEntityResult call(CourseEntity entity) {
    return _topCourseDeleteRepository(entity);
  }
}
