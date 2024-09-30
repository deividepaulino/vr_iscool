import 'package:vr_iscool/modules/registration_module/domain/entities/registration_entity.dart';

extension RegistrationDto on RegistrationEntity {
  static fromJson(Map<String, dynamic>? json) {
    if (json == null) return RegistrationEntity.empty();

    return RegistrationEntity(
      id: json['codigo'] ?? -1,
      name: json['nomeAluno'] ?? '',
      course: json['nomeCurso'] ?? '',
    );
  }

  static fromDB(Map<String, dynamic>? json) {
    if (json == null) return RegistrationEntity.empty();

    return RegistrationEntity(
      id: json['codigo'] ?? -1,
      name: json['nomeAluno'] ?? '',
      course: json['nomeCurso'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nome': name,
    };
  }
}
