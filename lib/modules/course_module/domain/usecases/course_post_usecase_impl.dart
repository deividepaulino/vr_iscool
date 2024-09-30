import 'package:vr_iscool/core/shared/domain/usecases/post_usecase.dart';
import 'package:vr_iscool/modules/course_module/domain/entities/course_entity.dart';
import 'package:vr_iscool/modules/course_module/domain/repositories/course_post_repository.dart';
import 'package:vr_iscool/modules/course_module/domain/typedefs/course_entity_result.dart';

class CoursePostUsecaseImpl
    implements PostUsecase<CourseEntityResult, CourseEntity> {
  final CoursePostRepository _topCoursePostRepository;

  CoursePostUsecaseImpl(this._topCoursePostRepository);

  @override
  CourseEntityResult call(CourseEntity entity) {
    return _topCoursePostRepository(entity);
  }
}
