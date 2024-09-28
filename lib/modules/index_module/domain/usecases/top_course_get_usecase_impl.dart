import 'package:vr_iscool/core/shared/domain/usecases/get_usecase.dart';
import 'package:vr_iscool/modules/index_module/domain/entities/top_coruse_entity.dart';
import 'package:vr_iscool/modules/index_module/domain/repositories/top_course_get_repository.dart';
import 'package:vr_iscool/modules/index_module/domain/typedefs/top_course_entity_result.dart';

class TopCourseGetUsecaseImpl
    implements GetUsecase<TopCourseEntityResult, TopCourseEntity> {
  final TopCourseGetRepository _topCourseGetRepository;

  TopCourseGetUsecaseImpl(this._topCourseGetRepository);

  @override
  TopCourseEntityResult call(TopCourseEntity entity) {
    return _topCourseGetRepository(entity);
  }
}
