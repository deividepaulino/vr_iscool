import 'package:vr_iscool/modules/student_module/domain/entities/student_entity.dart';

extension StudentDto on StudentEntity {
  static fromJson(Map<String, dynamic>? json) {
    if (json == null) return StudentEntity.empty();

    return StudentEntity(
      id: json['codigo'] ?? -1,
      name: json['nome'] ?? '',
    );
  }

  static fromDB(Map<String, dynamic>? json) {
    if (json == null) return StudentEntity.empty();

    return StudentEntity(
      id: json['codigo'] ?? -1,
      name: json['nome'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nome': name,
    };
  }
}
