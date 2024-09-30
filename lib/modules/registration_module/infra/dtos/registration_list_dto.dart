import 'package:vr_iscool/modules/registration_module/domain/entities/registration_entity.dart';
import 'package:vr_iscool/modules/registration_module/infra/dtos/registration_dto.dart';

extension RegistrationListDto on List<RegistrationEntity> {
  static List<RegistrationEntity> fromList(List<Map<String, dynamic>> json) {
    final result = List<RegistrationEntity>.empty(growable: true);

    if (json.isNotEmpty) {
      for (var item in json) {
        result.add(
          RegistrationEntity(
            id: item['codigo'] ?? -1,
            name: item['nomeAluno'] ?? '',
            course: item['nomeCurso'] ?? '',
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
