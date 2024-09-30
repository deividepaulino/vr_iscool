import 'package:vr_iscool/modules/student_module/domain/entities/student_entity.dart';
import 'package:vr_iscool/modules/student_module/infra/dtos/student_dto.dart';

extension StudentListDto on List<StudentEntity> {
  static List<StudentEntity> fromList(List<Map<String, dynamic>> json) {
    final result = List<StudentEntity>.empty(growable: true);

    if (json.isNotEmpty) {
      for (var item in json) {
        result.add(
          StudentEntity(
            id: item['codigo'] ?? -1,
            name: item['nome'] ?? '',
            course: item['curso'] ?? '',
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
