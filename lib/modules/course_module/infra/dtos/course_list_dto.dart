import 'package:vr_iscool/modules/course_module/domain/entities/course_entity.dart';
import 'package:vr_iscool/modules/course_module/infra/dtos/course_dto.dart';

extension CourseListDto on List<CourseEntity> {
  static List<CourseEntity> fromList(List<Map<String, dynamic>> json) {
    final result = List<CourseEntity>.empty(growable: true);

    if (json.isNotEmpty) {
      for (var item in json) {
        result.add(
          CourseEntity(
            descricao: item['descricao'] ?? '',
            ementa: '',
            totalAlunos: item['totalAlunos'] ?? -1,
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
