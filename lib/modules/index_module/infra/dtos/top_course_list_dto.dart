import 'package:vr_iscool/modules/index_module/domain/entities/top_coruse_entity.dart';
import 'package:vr_iscool/modules/index_module/infra/dtos/top_course_dto.dart';

extension TopCourseListDto on List<TopCourseEntity> {
  static List<TopCourseEntity> fromList(List<Map<String, dynamic>> json) {
    final result = List<TopCourseEntity>.empty(growable: true);

    if (json.isNotEmpty) {
      for (var item in json) {
        result.add(
          TopCourseEntity(
            descricao: item['descricao'] ?? '',
            totalAlunos: item['total_alunos'] ?? -1,
          ),
        );
      }
    }

    return result;
  }

  toList() {
    return map((e) => e.toJson()).toList();
  }
}
