import 'package:vr_iscool/core/shared/domain/usecases/get_list_usecase.dart';
import 'package:vr_iscool/modules/index_module/domain/entities/top_coruse_entity.dart';
import 'package:vr_iscool/modules/index_module/domain/repositories/top_course_get_list_repository.dart';
import 'package:vr_iscool/modules/index_module/domain/typedefs/top_course_get_list_result.dart';

class TopCourseGetListUsecaseImpl
    implements GetListUsecase<TopCourseGetListResult, TopCourseEntity> {
  final TopCourseGetListRepository _repository;

  TopCourseGetListUsecaseImpl(this._repository);

  @override
  TopCourseGetListResult call(List<TopCourseEntity> entities) {
    return _repository(entities);
  }
}
