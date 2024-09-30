import 'package:vr_iscool/modules/student_module/domain/entities/student_entity.dart';

extension StudentDto on StudentEntity {
  static fromJson(Map<String, dynamic>? json) {
    if (json == null) return StudentEntity.empty();

    return StudentEntity(
      id: json['codigo'] ?? -1,
      name: json['nome'] ?? '',
      course: json['curso'] ?? '',
    );
  }

  static fromDB(Map<String, dynamic>? json) {
    if (json == null) return StudentEntity.empty();

    return StudentEntity(
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
