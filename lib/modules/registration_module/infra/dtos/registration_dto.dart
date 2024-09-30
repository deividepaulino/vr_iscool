import 'package:vr_iscool/modules/registration_module/domain/entities/registration_entity.dart';

extension RegistrationDto on RegistrationEntity {
  static fromJson(Map<String, dynamic>? json) {
    if (json == null) return RegistrationEntity.empty();

    return RegistrationEntity(
      id: json['codigo'] ?? -1,
      name: json['nome'] ?? '',
      course: json['curso'] ?? '',
    );
  }

  static fromDB(Map<String, dynamic>? json) {
    if (json == null) return RegistrationEntity.empty();

    return RegistrationEntity(
      id: json['codigo'] ?? -1,
      name: json['nome'] ?? '',
      course: json['curso'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nome': name,
    };
  }

  Map<String, dynamic> updateCourse() {
    return {
      'novoCurso': courseId ?? -1,
    };
  }
}
