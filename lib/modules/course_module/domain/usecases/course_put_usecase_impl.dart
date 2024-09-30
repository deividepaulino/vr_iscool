import 'package:vr_iscool/core/shared/domain/usecases/put_usecase.dart';
import 'package:vr_iscool/modules/course_module/domain/entities/course_entity.dart';
import 'package:vr_iscool/modules/course_module/domain/repositories/course_put_repository.dart';
import 'package:vr_iscool/modules/course_module/domain/typedefs/course_entity_result.dart';

class CoursePutUsecaseImpl
    implements PutUsecase<CourseEntityResult, CourseEntity> {
  final CoursePutRepository _topCoursePutRepository;

  CoursePutUsecaseImpl(this._topCoursePutRepository);

  @override
  CourseEntityResult call(CourseEntity entity) {
    return _topCoursePutRepository(entity);
  }
}
